import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/spotify_constants.dart';

part 'auth_repository.g.dart';

const _accessTokenKey = 'spotify_access_token';
const _refreshTokenKey = 'spotify_refresh_token';
const _expiryKey = 'spotify_token_expiry';
const _pkceVerifierKey = 'pkce_code_verifier';
const _pkceStateKey = 'pkce_state';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepository();

class AuthRepository {
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  final _dio = Dio();

  Future<bool> get isLoggedIn async {
    final token = await _storage.read(key: _accessTokenKey);
    if (token == null) return false;
    final expiryStr = await _storage.read(key: _expiryKey);
    if (expiryStr == null) return false;
    final expiry = DateTime.parse(expiryStr);
    if (DateTime.now().isBefore(expiry)) return true;
    return tryRefresh();
  }

  Future<String?> get accessToken async {
    final expiryStr = await _storage.read(key: _expiryKey);
    if (expiryStr != null) {
      final expiry = DateTime.parse(expiryStr);
      if (DateTime.now().isBefore(expiry)) {
        return _storage.read(key: _accessTokenKey);
      }
    }
    final refreshed = await tryRefresh();
    if (refreshed) return _storage.read(key: _accessTokenKey);
    return null;
  }

  /// Step 1: open the browser with the Spotify PKCE auth URL.
  Future<void> launchLogin() async {
    final verifier = _generateCodeVerifier();
    final challenge = _generateCodeChallenge(verifier);
    final state = _generateState();

    await _storage.write(key: _pkceVerifierKey, value: verifier);
    await _storage.write(key: _pkceStateKey, value: state);

    final uri = Uri.https('accounts.spotify.com', '/authorize', {
      'client_id': SpotifyConstants.clientId,
      'response_type': 'code',
      'redirect_uri': SpotifyConstants.redirectUri,
      'scope': SpotifyConstants.scopes.join(' '),
      'code_challenge_method': 'S256',
      'code_challenge': challenge,
      'state': state,
    });

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// Step 2: called when app receives the callback deep link.
  /// Returns true if the token exchange succeeded.
  Future<bool> handleCallback(Uri uri) async {
    final code = uri.queryParameters['code'];
    final returnedState = uri.queryParameters['state'];
    final error = uri.queryParameters['error'];

    if (error != null || code == null) return false;

    final storedState = await _storage.read(key: _pkceStateKey);
    if (storedState != null && returnedState != storedState) return false;

    final verifier = await _storage.read(key: _pkceVerifierKey);
    if (verifier == null) return false;

    try {
      final response = await _dio.post(
        SpotifyConstants.tokenUrl,
        data: {
          'grant_type': 'authorization_code',
          'code': code,
          'redirect_uri': SpotifyConstants.redirectUri,
          'client_id': SpotifyConstants.clientId,
          'code_verifier': verifier,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      final data = response.data as Map<String, dynamic>;
      final accessToken = data['access_token'] as String?;
      final refreshToken = data['refresh_token'] as String?;
      final expiresIn = data['expires_in'] as int? ?? 3600;

      if (accessToken == null) return false;

      final expiry = DateTime.now().add(Duration(seconds: expiresIn));
      await _storage.write(key: _accessTokenKey, value: accessToken);
      if (refreshToken != null) {
        await _storage.write(key: _refreshTokenKey, value: refreshToken);
      }
      await _storage.write(key: _expiryKey, value: expiry.toIso8601String());
      await _storage.delete(key: _pkceVerifierKey);
      await _storage.delete(key: _pkceStateKey);
      return true;
    } catch (e) {
      debugPrint('Token exchange failed: $e');
      return false;
    }
  }

  Future<bool> tryRefresh() async {
    final refreshToken = await _storage.read(key: _refreshTokenKey);
    if (refreshToken == null) return false;

    try {
      final response = await _dio.post(
        SpotifyConstants.tokenUrl,
        data: {
          'grant_type': 'refresh_token',
          'refresh_token': refreshToken,
          'client_id': SpotifyConstants.clientId,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      final data = response.data as Map<String, dynamic>;
      final accessToken = data['access_token'] as String?;
      final newRefreshToken = data['refresh_token'] as String?;
      final expiresIn = data['expires_in'] as int? ?? 3600;

      if (accessToken == null) return false;

      final expiry = DateTime.now().add(Duration(seconds: expiresIn));
      await _storage.write(key: _accessTokenKey, value: accessToken);
      if (newRefreshToken != null) {
        await _storage.write(key: _refreshTokenKey, value: newRefreshToken);
      }
      await _storage.write(key: _expiryKey, value: expiry.toIso8601String());
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> logout() async {
    await _storage.deleteAll();
  }

  String _generateCodeVerifier() {
    final rng = Random.secure();
    final bytes = List<int>.generate(32, (_) => rng.nextInt(256));
    return base64Url.encode(bytes).replaceAll('=', '');
  }

  String _generateCodeChallenge(String verifier) {
    final bytes = utf8.encode(verifier);
    final digest = sha256.convert(bytes);
    return base64Url.encode(digest.bytes).replaceAll('=', '');
  }

  String _generateState() {
    final rng = Random.secure();
    final bytes = List<int>.generate(16, (_) => rng.nextInt(256));
    return base64Url.encode(bytes).replaceAll('=', '');
  }
}
