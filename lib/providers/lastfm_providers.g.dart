// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lastfm_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lastFmUsernameHash() => r'd2b9ac88d1dedd7746086a2bba9ebd8dbeadbcb5';

/// The saved Last.fm username (null = not connected)
///
/// Copied from [lastFmUsername].
@ProviderFor(lastFmUsername)
final lastFmUsernameProvider = AutoDisposeFutureProvider<String?>.internal(
  lastFmUsername,
  name: r'lastFmUsernameProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lastFmUsernameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LastFmUsernameRef = AutoDisposeFutureProviderRef<String?>;
String _$lastFmConnectedHash() => r'19baf185b291996b2bbaf7d692f0923c49eb837f';

/// Whether Last.fm is connected
///
/// Copied from [lastFmConnected].
@ProviderFor(lastFmConnected)
final lastFmConnectedProvider = AutoDisposeFutureProvider<bool>.internal(
  lastFmConnected,
  name: r'lastFmConnectedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lastFmConnectedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LastFmConnectedRef = AutoDisposeFutureProviderRef<bool>;
String _$lastFmUserHash() => r'3277d679cdcce2f2a2954c1b849014cf57fb4514';

/// Full user info (only fetched when username is set)
///
/// Copied from [lastFmUser].
@ProviderFor(lastFmUser)
final lastFmUserProvider = AutoDisposeFutureProvider<LastFmUser?>.internal(
  lastFmUser,
  name: r'lastFmUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lastFmUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LastFmUserRef = AutoDisposeFutureProviderRef<LastFmUser?>;
String _$lastFmTopArtistsHash() => r'b6ab050677a6cc4378ca9757e24ca3fc688ffe67';

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

/// Top artists from Last.fm for a given period
///
/// Copied from [lastFmTopArtists].
@ProviderFor(lastFmTopArtists)
const lastFmTopArtistsProvider = LastFmTopArtistsFamily();

/// Top artists from Last.fm for a given period
///
/// Copied from [lastFmTopArtists].
class LastFmTopArtistsFamily extends Family<AsyncValue<List<LastFmArtist>>> {
  /// Top artists from Last.fm for a given period
  ///
  /// Copied from [lastFmTopArtists].
  const LastFmTopArtistsFamily();

  /// Top artists from Last.fm for a given period
  ///
  /// Copied from [lastFmTopArtists].
  LastFmTopArtistsProvider call({String period = 'overall', int limit = 50}) {
    return LastFmTopArtistsProvider(period: period, limit: limit);
  }

  @override
  LastFmTopArtistsProvider getProviderOverride(
    covariant LastFmTopArtistsProvider provider,
  ) {
    return call(period: provider.period, limit: provider.limit);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lastFmTopArtistsProvider';
}

/// Top artists from Last.fm for a given period
///
/// Copied from [lastFmTopArtists].
class LastFmTopArtistsProvider
    extends AutoDisposeFutureProvider<List<LastFmArtist>> {
  /// Top artists from Last.fm for a given period
  ///
  /// Copied from [lastFmTopArtists].
  LastFmTopArtistsProvider({String period = 'overall', int limit = 50})
    : this._internal(
        (ref) => lastFmTopArtists(
          ref as LastFmTopArtistsRef,
          period: period,
          limit: limit,
        ),
        from: lastFmTopArtistsProvider,
        name: r'lastFmTopArtistsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$lastFmTopArtistsHash,
        dependencies: LastFmTopArtistsFamily._dependencies,
        allTransitiveDependencies:
            LastFmTopArtistsFamily._allTransitiveDependencies,
        period: period,
        limit: limit,
      );

  LastFmTopArtistsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
    required this.limit,
  }) : super.internal();

  final String period;
  final int limit;

  @override
  Override overrideWith(
    FutureOr<List<LastFmArtist>> Function(LastFmTopArtistsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LastFmTopArtistsProvider._internal(
        (ref) => create(ref as LastFmTopArtistsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        period: period,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LastFmArtist>> createElement() {
    return _LastFmTopArtistsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LastFmTopArtistsProvider &&
        other.period == period &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LastFmTopArtistsRef on AutoDisposeFutureProviderRef<List<LastFmArtist>> {
  /// The parameter `period` of this provider.
  String get period;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _LastFmTopArtistsProviderElement
    extends AutoDisposeFutureProviderElement<List<LastFmArtist>>
    with LastFmTopArtistsRef {
  _LastFmTopArtistsProviderElement(super.provider);

  @override
  String get period => (origin as LastFmTopArtistsProvider).period;
  @override
  int get limit => (origin as LastFmTopArtistsProvider).limit;
}

String _$lastFmTopTracksHash() => r'4a0add09f3cc5e7e2f23d173e2f60f1181779ecc';

/// Top tracks from Last.fm for a given period
///
/// Copied from [lastFmTopTracks].
@ProviderFor(lastFmTopTracks)
const lastFmTopTracksProvider = LastFmTopTracksFamily();

/// Top tracks from Last.fm for a given period
///
/// Copied from [lastFmTopTracks].
class LastFmTopTracksFamily extends Family<AsyncValue<List<LastFmTrack>>> {
  /// Top tracks from Last.fm for a given period
  ///
  /// Copied from [lastFmTopTracks].
  const LastFmTopTracksFamily();

  /// Top tracks from Last.fm for a given period
  ///
  /// Copied from [lastFmTopTracks].
  LastFmTopTracksProvider call({String period = 'overall', int limit = 50}) {
    return LastFmTopTracksProvider(period: period, limit: limit);
  }

  @override
  LastFmTopTracksProvider getProviderOverride(
    covariant LastFmTopTracksProvider provider,
  ) {
    return call(period: provider.period, limit: provider.limit);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lastFmTopTracksProvider';
}

/// Top tracks from Last.fm for a given period
///
/// Copied from [lastFmTopTracks].
class LastFmTopTracksProvider
    extends AutoDisposeFutureProvider<List<LastFmTrack>> {
  /// Top tracks from Last.fm for a given period
  ///
  /// Copied from [lastFmTopTracks].
  LastFmTopTracksProvider({String period = 'overall', int limit = 50})
    : this._internal(
        (ref) => lastFmTopTracks(
          ref as LastFmTopTracksRef,
          period: period,
          limit: limit,
        ),
        from: lastFmTopTracksProvider,
        name: r'lastFmTopTracksProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$lastFmTopTracksHash,
        dependencies: LastFmTopTracksFamily._dependencies,
        allTransitiveDependencies:
            LastFmTopTracksFamily._allTransitiveDependencies,
        period: period,
        limit: limit,
      );

  LastFmTopTracksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
    required this.limit,
  }) : super.internal();

  final String period;
  final int limit;

  @override
  Override overrideWith(
    FutureOr<List<LastFmTrack>> Function(LastFmTopTracksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LastFmTopTracksProvider._internal(
        (ref) => create(ref as LastFmTopTracksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        period: period,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LastFmTrack>> createElement() {
    return _LastFmTopTracksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LastFmTopTracksProvider &&
        other.period == period &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LastFmTopTracksRef on AutoDisposeFutureProviderRef<List<LastFmTrack>> {
  /// The parameter `period` of this provider.
  String get period;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _LastFmTopTracksProviderElement
    extends AutoDisposeFutureProviderElement<List<LastFmTrack>>
    with LastFmTopTracksRef {
  _LastFmTopTracksProviderElement(super.provider);

  @override
  String get period => (origin as LastFmTopTracksProvider).period;
  @override
  int get limit => (origin as LastFmTopTracksProvider).limit;
}

String _$lastFmRecentTracksHash() =>
    r'19530bcbe4ce0381497462d99a35c901f86f036c';

/// Recent scrobbles from Last.fm
///
/// Copied from [lastFmRecentTracks].
@ProviderFor(lastFmRecentTracks)
const lastFmRecentTracksProvider = LastFmRecentTracksFamily();

/// Recent scrobbles from Last.fm
///
/// Copied from [lastFmRecentTracks].
class LastFmRecentTracksFamily
    extends Family<AsyncValue<List<LastFmRecentTrack>>> {
  /// Recent scrobbles from Last.fm
  ///
  /// Copied from [lastFmRecentTracks].
  const LastFmRecentTracksFamily();

  /// Recent scrobbles from Last.fm
  ///
  /// Copied from [lastFmRecentTracks].
  LastFmRecentTracksProvider call({int limit = 50}) {
    return LastFmRecentTracksProvider(limit: limit);
  }

  @override
  LastFmRecentTracksProvider getProviderOverride(
    covariant LastFmRecentTracksProvider provider,
  ) {
    return call(limit: provider.limit);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lastFmRecentTracksProvider';
}

/// Recent scrobbles from Last.fm
///
/// Copied from [lastFmRecentTracks].
class LastFmRecentTracksProvider
    extends AutoDisposeFutureProvider<List<LastFmRecentTrack>> {
  /// Recent scrobbles from Last.fm
  ///
  /// Copied from [lastFmRecentTracks].
  LastFmRecentTracksProvider({int limit = 50})
    : this._internal(
        (ref) => lastFmRecentTracks(ref as LastFmRecentTracksRef, limit: limit),
        from: lastFmRecentTracksProvider,
        name: r'lastFmRecentTracksProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$lastFmRecentTracksHash,
        dependencies: LastFmRecentTracksFamily._dependencies,
        allTransitiveDependencies:
            LastFmRecentTracksFamily._allTransitiveDependencies,
        limit: limit,
      );

  LastFmRecentTracksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
  }) : super.internal();

  final int limit;

  @override
  Override overrideWith(
    FutureOr<List<LastFmRecentTrack>> Function(LastFmRecentTracksRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LastFmRecentTracksProvider._internal(
        (ref) => create(ref as LastFmRecentTracksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LastFmRecentTrack>> createElement() {
    return _LastFmRecentTracksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LastFmRecentTracksProvider && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LastFmRecentTracksRef
    on AutoDisposeFutureProviderRef<List<LastFmRecentTrack>> {
  /// The parameter `limit` of this provider.
  int get limit;
}

class _LastFmRecentTracksProviderElement
    extends AutoDisposeFutureProviderElement<List<LastFmRecentTrack>>
    with LastFmRecentTracksRef {
  _LastFmRecentTracksProviderElement(super.provider);

  @override
  int get limit => (origin as LastFmRecentTracksProvider).limit;
}

String _$lastFmArtistPlayCountHash() =>
    r'630ddabcb3536b3a672757cb2c4c57a85f0680d8';

/// Play count for a specific artist (from top 1000)
///
/// Copied from [lastFmArtistPlayCount].
@ProviderFor(lastFmArtistPlayCount)
const lastFmArtistPlayCountProvider = LastFmArtistPlayCountFamily();

/// Play count for a specific artist (from top 1000)
///
/// Copied from [lastFmArtistPlayCount].
class LastFmArtistPlayCountFamily extends Family<AsyncValue<int?>> {
  /// Play count for a specific artist (from top 1000)
  ///
  /// Copied from [lastFmArtistPlayCount].
  const LastFmArtistPlayCountFamily();

  /// Play count for a specific artist (from top 1000)
  ///
  /// Copied from [lastFmArtistPlayCount].
  LastFmArtistPlayCountProvider call(String artistName) {
    return LastFmArtistPlayCountProvider(artistName);
  }

  @override
  LastFmArtistPlayCountProvider getProviderOverride(
    covariant LastFmArtistPlayCountProvider provider,
  ) {
    return call(provider.artistName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lastFmArtistPlayCountProvider';
}

/// Play count for a specific artist (from top 1000)
///
/// Copied from [lastFmArtistPlayCount].
class LastFmArtistPlayCountProvider extends AutoDisposeFutureProvider<int?> {
  /// Play count for a specific artist (from top 1000)
  ///
  /// Copied from [lastFmArtistPlayCount].
  LastFmArtistPlayCountProvider(String artistName)
    : this._internal(
        (ref) =>
            lastFmArtistPlayCount(ref as LastFmArtistPlayCountRef, artistName),
        from: lastFmArtistPlayCountProvider,
        name: r'lastFmArtistPlayCountProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$lastFmArtistPlayCountHash,
        dependencies: LastFmArtistPlayCountFamily._dependencies,
        allTransitiveDependencies:
            LastFmArtistPlayCountFamily._allTransitiveDependencies,
        artistName: artistName,
      );

  LastFmArtistPlayCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artistName,
  }) : super.internal();

  final String artistName;

  @override
  Override overrideWith(
    FutureOr<int?> Function(LastFmArtistPlayCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LastFmArtistPlayCountProvider._internal(
        (ref) => create(ref as LastFmArtistPlayCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artistName: artistName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int?> createElement() {
    return _LastFmArtistPlayCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LastFmArtistPlayCountProvider &&
        other.artistName == artistName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artistName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LastFmArtistPlayCountRef on AutoDisposeFutureProviderRef<int?> {
  /// The parameter `artistName` of this provider.
  String get artistName;
}

class _LastFmArtistPlayCountProviderElement
    extends AutoDisposeFutureProviderElement<int?>
    with LastFmArtistPlayCountRef {
  _LastFmArtistPlayCountProviderElement(super.provider);

  @override
  String get artistName => (origin as LastFmArtistPlayCountProvider).artistName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
