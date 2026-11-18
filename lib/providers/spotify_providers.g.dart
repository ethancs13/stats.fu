// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$topArtistsHash() => r'dafa4ba222d83c441e7f711ceae50df7c59a3854';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [topArtists].
@ProviderFor(topArtists)
const topArtistsProvider = TopArtistsFamily();

/// See also [topArtists].
class TopArtistsFamily extends Family<AsyncValue<List<Artist>>> {
  /// See also [topArtists].
  const TopArtistsFamily();

  /// See also [topArtists].
  TopArtistsProvider call({String timeRange = SpotifyConstants.mediumTerm}) {
    return TopArtistsProvider(timeRange: timeRange);
  }

  @override
  TopArtistsProvider getProviderOverride(
    covariant TopArtistsProvider provider,
  ) {
    return call(timeRange: provider.timeRange);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'topArtistsProvider';
}

/// See also [topArtists].
class TopArtistsProvider extends AutoDisposeFutureProvider<List<Artist>> {
  /// See also [topArtists].
  TopArtistsProvider({String timeRange = SpotifyConstants.mediumTerm})
    : this._internal(
        (ref) => topArtists(ref as TopArtistsRef, timeRange: timeRange),
        from: topArtistsProvider,
        name: r'topArtistsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$topArtistsHash,
        dependencies: TopArtistsFamily._dependencies,
        allTransitiveDependencies: TopArtistsFamily._allTransitiveDependencies,
        timeRange: timeRange,
      );

  TopArtistsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.timeRange,
  }) : super.internal();

  final String timeRange;

  @override
  Override overrideWith(
    FutureOr<List<Artist>> Function(TopArtistsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TopArtistsProvider._internal(
        (ref) => create(ref as TopArtistsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        timeRange: timeRange,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Artist>> createElement() {
    return _TopArtistsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopArtistsProvider && other.timeRange == timeRange;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, timeRange.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TopArtistsRef on AutoDisposeFutureProviderRef<List<Artist>> {
  /// The parameter `timeRange` of this provider.
  String get timeRange;
}

class _TopArtistsProviderElement
    extends AutoDisposeFutureProviderElement<List<Artist>>
    with TopArtistsRef {
  _TopArtistsProviderElement(super.provider);

  @override
  String get timeRange => (origin as TopArtistsProvider).timeRange;
}

String _$topTracksHash() => r'9e63e5004a058986df5c8139f27b50925a29266c';

/// See also [topTracks].
@ProviderFor(topTracks)
const topTracksProvider = TopTracksFamily();

/// See also [topTracks].
class TopTracksFamily extends Family<AsyncValue<List<Track>>> {
  /// See also [topTracks].
  const TopTracksFamily();

  /// See also [topTracks].
  TopTracksProvider call({String timeRange = SpotifyConstants.mediumTerm}) {
    return TopTracksProvider(timeRange: timeRange);
  }

  @override
  TopTracksProvider getProviderOverride(covariant TopTracksProvider provider) {
    return call(timeRange: provider.timeRange);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'topTracksProvider';
}

/// See also [topTracks].
class TopTracksProvider extends AutoDisposeFutureProvider<List<Track>> {
  /// See also [topTracks].
  TopTracksProvider({String timeRange = SpotifyConstants.mediumTerm})
    : this._internal(
        (ref) => topTracks(ref as TopTracksRef, timeRange: timeRange),
        from: topTracksProvider,
        name: r'topTracksProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$topTracksHash,
        dependencies: TopTracksFamily._dependencies,
        allTransitiveDependencies: TopTracksFamily._allTransitiveDependencies,
        timeRange: timeRange,
      );

  TopTracksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.timeRange,
  }) : super.internal();

  final String timeRange;

  @override
  Override overrideWith(
    FutureOr<List<Track>> Function(TopTracksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TopTracksProvider._internal(
        (ref) => create(ref as TopTracksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        timeRange: timeRange,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Track>> createElement() {
    return _TopTracksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopTracksProvider && other.timeRange == timeRange;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, timeRange.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TopTracksRef on AutoDisposeFutureProviderRef<List<Track>> {
  /// The parameter `timeRange` of this provider.
  String get timeRange;
}

class _TopTracksProviderElement
    extends AutoDisposeFutureProviderElement<List<Track>>
    with TopTracksRef {
  _TopTracksProviderElement(super.provider);

  @override
  String get timeRange => (origin as TopTracksProvider).timeRange;
}

String _$recentlyPlayedHash() => r'6bd9f554225cbe8701ee19056a4d91e75fb9e3f7';

/// See also [recentlyPlayed].
@ProviderFor(recentlyPlayed)
final recentlyPlayedProvider =
    AutoDisposeFutureProvider<List<RecentlyPlayedItem>>.internal(
      recentlyPlayed,
      name: r'recentlyPlayedProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$recentlyPlayedHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecentlyPlayedRef =
    AutoDisposeFutureProviderRef<List<RecentlyPlayedItem>>;
String _$artistDetailHash() => r'c6be0474082fd30eb55a777755e5b2172db02c3a';

/// See also [artistDetail].
@ProviderFor(artistDetail)
const artistDetailProvider = ArtistDetailFamily();

/// See also [artistDetail].
class ArtistDetailFamily extends Family<AsyncValue<Artist>> {
  /// See also [artistDetail].
  const ArtistDetailFamily();

  /// See also [artistDetail].
  ArtistDetailProvider call(String artistId) {
    return ArtistDetailProvider(artistId);
  }

  @override
  ArtistDetailProvider getProviderOverride(
    covariant ArtistDetailProvider provider,
  ) {
    return call(provider.artistId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'artistDetailProvider';
}

/// See also [artistDetail].
class ArtistDetailProvider extends AutoDisposeFutureProvider<Artist> {
  /// See also [artistDetail].
  ArtistDetailProvider(String artistId)
    : this._internal(
        (ref) => artistDetail(ref as ArtistDetailRef, artistId),
        from: artistDetailProvider,
        name: r'artistDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$artistDetailHash,
        dependencies: ArtistDetailFamily._dependencies,
        allTransitiveDependencies:
            ArtistDetailFamily._allTransitiveDependencies,
        artistId: artistId,
      );

  ArtistDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artistId,
  }) : super.internal();

  final String artistId;

  @override
  Override overrideWith(
    FutureOr<Artist> Function(ArtistDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArtistDetailProvider._internal(
        (ref) => create(ref as ArtistDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artistId: artistId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Artist> createElement() {
    return _ArtistDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtistDetailProvider && other.artistId == artistId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artistId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ArtistDetailRef on AutoDisposeFutureProviderRef<Artist> {
  /// The parameter `artistId` of this provider.
  String get artistId;
}

class _ArtistDetailProviderElement
    extends AutoDisposeFutureProviderElement<Artist>
    with ArtistDetailRef {
  _ArtistDetailProviderElement(super.provider);

  @override
  String get artistId => (origin as ArtistDetailProvider).artistId;
}

String _$relatedArtistsHash() => r'32afac1381415bf5abab95b81e3abc619820600b';

/// See also [relatedArtists].
@ProviderFor(relatedArtists)
const relatedArtistsProvider = RelatedArtistsFamily();

/// See also [relatedArtists].
class RelatedArtistsFamily extends Family<AsyncValue<List<Artist>>> {
  /// See also [relatedArtists].
  const RelatedArtistsFamily();

  /// See also [relatedArtists].
  RelatedArtistsProvider call(String artistId) {
    return RelatedArtistsProvider(artistId);
  }

  @override
  RelatedArtistsProvider getProviderOverride(
    covariant RelatedArtistsProvider provider,
  ) {
    return call(provider.artistId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'relatedArtistsProvider';
}

/// See also [relatedArtists].
class RelatedArtistsProvider extends AutoDisposeFutureProvider<List<Artist>> {
  /// See also [relatedArtists].
  RelatedArtistsProvider(String artistId)
    : this._internal(
        (ref) => relatedArtists(ref as RelatedArtistsRef, artistId),
        from: relatedArtistsProvider,
        name: r'relatedArtistsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$relatedArtistsHash,
        dependencies: RelatedArtistsFamily._dependencies,
        allTransitiveDependencies:
            RelatedArtistsFamily._allTransitiveDependencies,
        artistId: artistId,
      );

  RelatedArtistsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artistId,
  }) : super.internal();

  final String artistId;

  @override
  Override overrideWith(
    FutureOr<List<Artist>> Function(RelatedArtistsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RelatedArtistsProvider._internal(
        (ref) => create(ref as RelatedArtistsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artistId: artistId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Artist>> createElement() {
    return _RelatedArtistsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RelatedArtistsProvider && other.artistId == artistId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artistId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RelatedArtistsRef on AutoDisposeFutureProviderRef<List<Artist>> {
  /// The parameter `artistId` of this provider.
  String get artistId;
}

class _RelatedArtistsProviderElement
    extends AutoDisposeFutureProviderElement<List<Artist>>
    with RelatedArtistsRef {
  _RelatedArtistsProviderElement(super.provider);

  @override
  String get artistId => (origin as RelatedArtistsProvider).artistId;
}

String _$artistTopTracksHash() => r'1ababefc0db28de38cc4a0fa0ad14e546fb8a2f1';

/// See also [artistTopTracks].
@ProviderFor(artistTopTracks)
const artistTopTracksProvider = ArtistTopTracksFamily();

/// See also [artistTopTracks].
class ArtistTopTracksFamily extends Family<AsyncValue<List<Track>>> {
  /// See also [artistTopTracks].
  const ArtistTopTracksFamily();

  /// See also [artistTopTracks].
  ArtistTopTracksProvider call(String artistId) {
    return ArtistTopTracksProvider(artistId);
  }

  @override
  ArtistTopTracksProvider getProviderOverride(
    covariant ArtistTopTracksProvider provider,
  ) {
    return call(provider.artistId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'artistTopTracksProvider';
}

/// See also [artistTopTracks].
class ArtistTopTracksProvider extends AutoDisposeFutureProvider<List<Track>> {
  /// See also [artistTopTracks].
  ArtistTopTracksProvider(String artistId)
    : this._internal(
        (ref) => artistTopTracks(ref as ArtistTopTracksRef, artistId),
        from: artistTopTracksProvider,
        name: r'artistTopTracksProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$artistTopTracksHash,
        dependencies: ArtistTopTracksFamily._dependencies,
        allTransitiveDependencies:
            ArtistTopTracksFamily._allTransitiveDependencies,
        artistId: artistId,
      );

  ArtistTopTracksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artistId,
  }) : super.internal();

  final String artistId;

  @override
  Override overrideWith(
    FutureOr<List<Track>> Function(ArtistTopTracksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArtistTopTracksProvider._internal(
        (ref) => create(ref as ArtistTopTracksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artistId: artistId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Track>> createElement() {
    return _ArtistTopTracksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtistTopTracksProvider && other.artistId == artistId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artistId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ArtistTopTracksRef on AutoDisposeFutureProviderRef<List<Track>> {
  /// The parameter `artistId` of this provider.
  String get artistId;
}

class _ArtistTopTracksProviderElement
    extends AutoDisposeFutureProviderElement<List<Track>>
    with ArtistTopTracksRef {
  _ArtistTopTracksProviderElement(super.provider);

  @override
  String get artistId => (origin as ArtistTopTracksProvider).artistId;
}

String _$trackDetailHash() => r'b3ae3785c5e1701220b4088457e03c7d4ad4c8b5';

/// See also [trackDetail].
@ProviderFor(trackDetail)
const trackDetailProvider = TrackDetailFamily();

/// See also [trackDetail].
class TrackDetailFamily extends Family<AsyncValue<Track>> {
  /// See also [trackDetail].
  const TrackDetailFamily();

  /// See also [trackDetail].
  TrackDetailProvider call(String trackId) {
    return TrackDetailProvider(trackId);
  }

  @override
  TrackDetailProvider getProviderOverride(
    covariant TrackDetailProvider provider,
  ) {
    return call(provider.trackId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'trackDetailProvider';
}

/// See also [trackDetail].
class TrackDetailProvider extends AutoDisposeFutureProvider<Track> {
  /// See also [trackDetail].
  TrackDetailProvider(String trackId)
    : this._internal(
        (ref) => trackDetail(ref as TrackDetailRef, trackId),
        from: trackDetailProvider,
        name: r'trackDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$trackDetailHash,
        dependencies: TrackDetailFamily._dependencies,
        allTransitiveDependencies: TrackDetailFamily._allTransitiveDependencies,
        trackId: trackId,
      );

  TrackDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.trackId,
  }) : super.internal();

  final String trackId;

  @override
  Override overrideWith(
    FutureOr<Track> Function(TrackDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TrackDetailProvider._internal(
        (ref) => create(ref as TrackDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        trackId: trackId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Track> createElement() {
    return _TrackDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrackDetailProvider && other.trackId == trackId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, trackId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TrackDetailRef on AutoDisposeFutureProviderRef<Track> {
  /// The parameter `trackId` of this provider.
  String get trackId;
}

class _TrackDetailProviderElement
    extends AutoDisposeFutureProviderElement<Track>
    with TrackDetailRef {
  _TrackDetailProviderElement(super.provider);

  @override
  String get trackId => (origin as TrackDetailProvider).trackId;
}

String _$audioFeaturesHash() => r'ca2d3cc8b89b9b3d2fad21aa3b11e3cbadf7fda4';

/// See also [audioFeatures].
@ProviderFor(audioFeatures)
const audioFeaturesProvider = AudioFeaturesFamily();

/// See also [audioFeatures].
class AudioFeaturesFamily extends Family<AsyncValue<AudioFeatures?>> {
  /// See also [audioFeatures].
  const AudioFeaturesFamily();

  /// See also [audioFeatures].
  AudioFeaturesProvider call(String trackId) {
    return AudioFeaturesProvider(trackId);
  }

  @override
  AudioFeaturesProvider getProviderOverride(
    covariant AudioFeaturesProvider provider,
  ) {
    return call(provider.trackId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'audioFeaturesProvider';
}

/// See also [audioFeatures].
class AudioFeaturesProvider extends AutoDisposeFutureProvider<AudioFeatures?> {
  /// See also [audioFeatures].
  AudioFeaturesProvider(String trackId)
    : this._internal(
        (ref) => audioFeatures(ref as AudioFeaturesRef, trackId),
        from: audioFeaturesProvider,
        name: r'audioFeaturesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$audioFeaturesHash,
        dependencies: AudioFeaturesFamily._dependencies,
        allTransitiveDependencies:
            AudioFeaturesFamily._allTransitiveDependencies,
        trackId: trackId,
      );

  AudioFeaturesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.trackId,
  }) : super.internal();

  final String trackId;

  @override
  Override overrideWith(
    FutureOr<AudioFeatures?> Function(AudioFeaturesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AudioFeaturesProvider._internal(
        (ref) => create(ref as AudioFeaturesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        trackId: trackId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AudioFeatures?> createElement() {
    return _AudioFeaturesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AudioFeaturesProvider && other.trackId == trackId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, trackId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AudioFeaturesRef on AutoDisposeFutureProviderRef<AudioFeatures?> {
  /// The parameter `trackId` of this provider.
  String get trackId;
}

class _AudioFeaturesProviderElement
    extends AutoDisposeFutureProviderElement<AudioFeatures?>
    with AudioFeaturesRef {
  _AudioFeaturesProviderElement(super.provider);

  @override
  String get trackId => (origin as AudioFeaturesProvider).trackId;
}

String _$recommendationsHash() => r'f21b1202353bc1a75f22dcbc06f4efc41232a6d1';

/// See also [recommendations].
@ProviderFor(recommendations)
final recommendationsProvider = AutoDisposeFutureProvider<List<Track>>.internal(
  recommendations,
  name: r'recommendationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recommendationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecommendationsRef = AutoDisposeFutureProviderRef<List<Track>>;
String _$followedArtistsHash() => r'ade67f94d2ac6384ac1167a3d9d7dd7c11e15817';

/// See also [followedArtists].
@ProviderFor(followedArtists)
final followedArtistsProvider =
    AutoDisposeFutureProvider<List<Artist>>.internal(
      followedArtists,
      name: r'followedArtistsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$followedArtistsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FollowedArtistsRef = AutoDisposeFutureProviderRef<List<Artist>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
