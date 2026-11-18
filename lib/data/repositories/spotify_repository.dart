import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/constants/spotify_constants.dart';
import '../models/artist.dart';
import '../models/recently_played.dart';
import '../models/spotify_image.dart';
import '../models/spotify_user.dart';
import '../models/track.dart';
import 'auth_repository.dart';

part 'spotify_repository.g.dart';

@riverpod
SpotifyRepository spotifyRepository(SpotifyRepositoryRef ref) {
  final auth = ref.watch(authRepositoryProvider);
  return SpotifyRepository(auth);
}

class SpotifyRepository {
  SpotifyRepository(this._auth) {
    _dio = Dio(BaseOptions(baseUrl: SpotifyConstants.baseUrl))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final token = await _auth.accessToken;
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            handler.next(options);
          },
          onError: (error, handler) async {
            if (error.response?.statusCode == 401) {
              final refreshed = await _auth.tryRefresh();
              if (refreshed) {
                final token = await _auth.accessToken;
                final opts = error.requestOptions;
                opts.headers['Authorization'] = 'Bearer $token';
                final response = await _dio.fetch(opts);
                handler.resolve(response);
                return;
              }
            }
            handler.next(error);
          },
        ),
      );
  }

  final AuthRepository _auth;
  late final Dio _dio;

  Future<SpotifyUser> getCurrentUser() async {
    final r = await _dio.get('/me');
    return _parseUser(r.data as Map<String, dynamic>);
  }

  Future<List<Artist>> getTopArtists(String timeRange, {int limit = 50}) async {
    final r = await _dio.get('/me/top/artists', queryParameters: {
      'time_range': timeRange,
      'limit': limit,
    });
    return (r.data['items'] as List)
        .map((j) => _parseArtist(j as Map<String, dynamic>))
        .toList();
  }

  Future<List<Track>> getTopTracks(String timeRange, {int limit = 50}) async {
    final r = await _dio.get('/me/top/tracks', queryParameters: {
      'time_range': timeRange,
      'limit': limit,
    });
    return (r.data['items'] as List)
        .map((j) => _parseTrack(j as Map<String, dynamic>))
        .toList();
  }

  Future<List<RecentlyPlayedItem>> getRecentlyPlayed({int limit = 50}) async {
    final r = await _dio.get('/me/player/recently-played', queryParameters: {'limit': limit});
    return (r.data['items'] as List)
        .map((j) => RecentlyPlayedItem(
              track: _parseTrack(j['track'] as Map<String, dynamic>),
              playedAt: DateTime.parse(j['played_at'] as String),
            ))
        .toList();
  }

  Future<Artist> getArtist(String id) async {
    final r = await _dio.get('/artists/$id');
    return _parseArtist(r.data as Map<String, dynamic>);
  }

  Future<List<Artist>> getRelatedArtists(String id) async {
    final r = await _dio.get('/artists/$id/related-artists');
    return (r.data['artists'] as List)
        .take(10)
        .map((j) => _parseArtist(j as Map<String, dynamic>))
        .toList();
  }

  Future<List<Track>> getArtistTopTracks(String id, {String market = 'US'}) async {
    final r = await _dio.get('/artists/$id/top-tracks', queryParameters: {'market': market});
    return (r.data['tracks'] as List)
        .map((j) => _parseTrack(j as Map<String, dynamic>))
        .toList();
  }

  Future<Track> getTrack(String id) async {
    final r = await _dio.get('/tracks/$id');
    return _parseTrack(r.data as Map<String, dynamic>);
  }

  Future<AudioFeatures?> getAudioFeatures(String trackId) async {
    try {
      final r = await _dio.get('/audio-features/$trackId');
      return AudioFeatures.fromJson(r.data as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<List<Track>> getRecommendations({
    List<String> seedArtists = const [],
    List<String> seedTracks = const [],
    int limit = 20,
  }) async {
    final r = await _dio.get('/recommendations', queryParameters: {
      if (seedArtists.isNotEmpty) 'seed_artists': seedArtists.take(3).join(','),
      if (seedTracks.isNotEmpty) 'seed_tracks': seedTracks.take(2).join(','),
      'limit': limit,
    });
    return (r.data['tracks'] as List)
        .map((j) => _parseTrack(j as Map<String, dynamic>))
        .toList();
  }

  Future<List<Artist>> getFollowedArtists({int limit = 50}) async {
    final r = await _dio.get('/me/following', queryParameters: {
      'type': 'artist',
      'limit': limit,
    });
    return (r.data['artists']['items'] as List)
        .map((j) => _parseArtist(j as Map<String, dynamic>))
        .toList();
  }

  // Parsers

  SpotifyUser _parseUser(Map<String, dynamic> j) {
    return SpotifyUser(
      id: j['id'] as String,
      displayName: j['display_name'] as String? ?? j['id'] as String,
      email: j['email'] as String?,
      images: _parseImages(j['images']),
      followersTotal: j['followers']?['total'] as int?,
      country: j['country'] as String?,
      product: j['product'] as String?,
      externalUrl: j['external_urls']?['spotify'] as String?,
    );
  }

  Artist _parseArtist(Map<String, dynamic> j) {
    return Artist(
      id: j['id'] as String,
      name: j['name'] as String,
      genres: (j['genres'] as List?)?.cast<String>() ?? [],
      images: _parseImages(j['images']),
      popularity: j['popularity'] as int?,
      followersTotal: j['followers']?['total'] as int?,
      externalUrl: j['external_urls']?['spotify'] as String?,
    );
  }

  Track _parseTrack(Map<String, dynamic> j) {
    final albumJ = j['album'] as Map<String, dynamic>?;
    return Track(
      id: j['id'] as String,
      name: j['name'] as String,
      album: Album(
        id: albumJ?['id'] as String? ?? '',
        name: albumJ?['name'] as String? ?? '',
        images: _parseImages(albumJ?['images']),
        releaseDate: albumJ?['release_date'] as String?,
        externalUrl: albumJ?['external_urls']?['spotify'] as String?,
      ),
      artists: ((j['artists'] as List?) ?? [])
          .map((a) => Artist(
                id: a['id'] as String,
                name: a['name'] as String,
              ))
          .toList(),
      durationMs: j['duration_ms'] as int? ?? 0,
      popularity: j['popularity'] as int?,
      previewUrl: j['preview_url'] as String?,
      externalUrl: j['external_urls']?['spotify'] as String?,
      explicit: j['explicit'] as bool? ?? false,
    );
  }

  List<SpotifyImage> _parseImages(dynamic raw) {
    if (raw == null) return [];
    return (raw as List)
        .map((i) => SpotifyImage(
              url: i['url'] as String,
              width: i['width'] as int?,
              height: i['height'] as int?,
            ))
        .toList();
  }
}
