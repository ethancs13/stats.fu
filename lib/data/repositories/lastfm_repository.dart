import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/lastfm_constants.dart';
import '../models/lastfm_models.dart';

part 'lastfm_repository.g.dart';

const _usernameKey = 'lastfm_username';

@riverpod
LastFmRepository lastFmRepository(LastFmRepositoryRef ref) => LastFmRepository();

class LastFmRepository {
  final _dio = Dio(BaseOptions(baseUrl: LastFmConstants.baseUrl));

  Map<String, dynamic> get _base => {
        'api_key': LastFmConstants.apiKey,
        'format': 'json',
      };

  // ── Username storage ──────────────────────────────────────────────────────

  Future<String?> getSavedUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }

  Future<void> saveUsername(String? username) async {
    final prefs = await SharedPreferences.getInstance();
    if (username == null || username.isEmpty) {
      await prefs.remove(_usernameKey);
    } else {
      await prefs.setString(_usernameKey, username.trim());
    }
  }

  // ── API calls ─────────────────────────────────────────────────────────────

  Future<LastFmUser> getUserInfo(String username) async {
    final r = await _dio.get('', queryParameters: {
      ..._base,
      'method': 'user.getInfo',
      'user': username,
    });
    final data = r.data['user'];
    if (data == null) throw Exception('User not found');
    return LastFmUser.fromJson(data as Map<String, dynamic>);
  }

  Future<List<LastFmArtist>> getTopArtists(
    String username, {
    String period = LastFmConstants.overall,
    int limit = 50,
  }) async {
    final r = await _dio.get('', queryParameters: {
      ..._base,
      'method': 'user.getTopArtists',
      'user': username,
      'period': period,
      'limit': limit,
    });
    final items = r.data['topartists']?['artist'] as List? ?? [];
    return items.map((j) => LastFmArtist.fromJson(j as Map<String, dynamic>)).toList();
  }

  Future<List<LastFmTrack>> getTopTracks(
    String username, {
    String period = LastFmConstants.overall,
    int limit = 50,
  }) async {
    final r = await _dio.get('', queryParameters: {
      ..._base,
      'method': 'user.getTopTracks',
      'user': username,
      'period': period,
      'limit': limit,
    });
    final items = r.data['toptracks']?['track'] as List? ?? [];
    return items.map((j) => LastFmTrack.fromJson(j as Map<String, dynamic>)).toList();
  }

  /// Fetches the most recent scrobbles. Supports pagination via [page].
  Future<List<LastFmRecentTrack>> getRecentTracks(
    String username, {
    int limit = 50,
    int page = 1,
  }) async {
    final r = await _dio.get('', queryParameters: {
      ..._base,
      'method': 'user.getRecentTracks',
      'user': username,
      'limit': limit,
      'page': page,
      'extended': 0,
    });
    final items = r.data['recenttracks']?['track'] as List? ?? [];
    return items
        .map((j) => LastFmRecentTrack.fromJson(j as Map<String, dynamic>))
        .toList();
  }

  /// Looks up how many times the user has played a specific artist.
  Future<int?> getArtistPlayCount(String username, String artistName) async {
    final artists = await getTopArtists(username, limit: 1000);
    final match = artists.where(
      (a) => a.name.toLowerCase() == artistName.toLowerCase(),
    );
    return match.isNotEmpty ? match.first.playCount : null;
  }

  /// Looks up how many times the user has played a specific track.
  Future<int?> getTrackPlayCount(String username, String trackName, String artistName) async {
    final tracks = await getTopTracks(username, limit: 1000);
    final match = tracks.where(
      (t) =>
          t.name.toLowerCase() == trackName.toLowerCase() &&
          t.artistName.toLowerCase() == artistName.toLowerCase(),
    );
    return match.isNotEmpty ? match.first.playCount : null;
  }
}
