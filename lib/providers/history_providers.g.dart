// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyCountHash() => r'643142b764ec151e06f1f725b9923a7d10b21e1e';

/// See also [historyCount].
@ProviderFor(historyCount)
final historyCountProvider = AutoDisposeStreamProvider<int>.internal(
  historyCount,
  name: r'historyCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$historyCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HistoryCountRef = AutoDisposeStreamProviderRef<int>;
String _$historyTopArtistsHash() => r'7f12e127122eaa89baff9e37cb0615a0ec2258ab';

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

/// See also [historyTopArtists].
@ProviderFor(historyTopArtists)
const historyTopArtistsProvider = HistoryTopArtistsFamily();

/// See also [historyTopArtists].
class HistoryTopArtistsFamily
    extends Family<AsyncValue<List<ArtistHistoryStats>>> {
  /// See also [historyTopArtists].
  const HistoryTopArtistsFamily();

  /// See also [historyTopArtists].
  HistoryTopArtistsProvider call({DateTime? startDate, DateTime? endDate}) {
    return HistoryTopArtistsProvider(startDate: startDate, endDate: endDate);
  }

  @override
  HistoryTopArtistsProvider getProviderOverride(
    covariant HistoryTopArtistsProvider provider,
  ) {
    return call(startDate: provider.startDate, endDate: provider.endDate);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'historyTopArtistsProvider';
}

/// See also [historyTopArtists].
class HistoryTopArtistsProvider
    extends AutoDisposeFutureProvider<List<ArtistHistoryStats>> {
  /// See also [historyTopArtists].
  HistoryTopArtistsProvider({DateTime? startDate, DateTime? endDate})
    : this._internal(
        (ref) => historyTopArtists(
          ref as HistoryTopArtistsRef,
          startDate: startDate,
          endDate: endDate,
        ),
        from: historyTopArtistsProvider,
        name: r'historyTopArtistsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$historyTopArtistsHash,
        dependencies: HistoryTopArtistsFamily._dependencies,
        allTransitiveDependencies:
            HistoryTopArtistsFamily._allTransitiveDependencies,
        startDate: startDate,
        endDate: endDate,
      );

  HistoryTopArtistsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Override overrideWith(
    FutureOr<List<ArtistHistoryStats>> Function(HistoryTopArtistsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HistoryTopArtistsProvider._internal(
        (ref) => create(ref as HistoryTopArtistsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtistHistoryStats>> createElement() {
    return _HistoryTopArtistsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HistoryTopArtistsProvider &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HistoryTopArtistsRef
    on AutoDisposeFutureProviderRef<List<ArtistHistoryStats>> {
  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;
}

class _HistoryTopArtistsProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtistHistoryStats>>
    with HistoryTopArtistsRef {
  _HistoryTopArtistsProviderElement(super.provider);

  @override
  DateTime? get startDate => (origin as HistoryTopArtistsProvider).startDate;
  @override
  DateTime? get endDate => (origin as HistoryTopArtistsProvider).endDate;
}

String _$historyTopTracksHash() => r'35b5e022526199107823cc9fc3250820f5965c9d';

/// See also [historyTopTracks].
@ProviderFor(historyTopTracks)
const historyTopTracksProvider = HistoryTopTracksFamily();

/// See also [historyTopTracks].
class HistoryTopTracksFamily
    extends Family<AsyncValue<List<TrackHistoryStats>>> {
  /// See also [historyTopTracks].
  const HistoryTopTracksFamily();

  /// See also [historyTopTracks].
  HistoryTopTracksProvider call({DateTime? startDate, DateTime? endDate}) {
    return HistoryTopTracksProvider(startDate: startDate, endDate: endDate);
  }

  @override
  HistoryTopTracksProvider getProviderOverride(
    covariant HistoryTopTracksProvider provider,
  ) {
    return call(startDate: provider.startDate, endDate: provider.endDate);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'historyTopTracksProvider';
}

/// See also [historyTopTracks].
class HistoryTopTracksProvider
    extends AutoDisposeFutureProvider<List<TrackHistoryStats>> {
  /// See also [historyTopTracks].
  HistoryTopTracksProvider({DateTime? startDate, DateTime? endDate})
    : this._internal(
        (ref) => historyTopTracks(
          ref as HistoryTopTracksRef,
          startDate: startDate,
          endDate: endDate,
        ),
        from: historyTopTracksProvider,
        name: r'historyTopTracksProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$historyTopTracksHash,
        dependencies: HistoryTopTracksFamily._dependencies,
        allTransitiveDependencies:
            HistoryTopTracksFamily._allTransitiveDependencies,
        startDate: startDate,
        endDate: endDate,
      );

  HistoryTopTracksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Override overrideWith(
    FutureOr<List<TrackHistoryStats>> Function(HistoryTopTracksRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HistoryTopTracksProvider._internal(
        (ref) => create(ref as HistoryTopTracksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TrackHistoryStats>> createElement() {
    return _HistoryTopTracksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HistoryTopTracksProvider &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HistoryTopTracksRef
    on AutoDisposeFutureProviderRef<List<TrackHistoryStats>> {
  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;
}

class _HistoryTopTracksProviderElement
    extends AutoDisposeFutureProviderElement<List<TrackHistoryStats>>
    with HistoryTopTracksRef {
  _HistoryTopTracksProviderElement(super.provider);

  @override
  DateTime? get startDate => (origin as HistoryTopTracksProvider).startDate;
  @override
  DateTime? get endDate => (origin as HistoryTopTracksProvider).endDate;
}

String _$historyTotalStreamsHash() =>
    r'5df1d29e5dd6f93a4b1cb37d1035e4ff69b71789';

/// See also [historyTotalStreams].
@ProviderFor(historyTotalStreams)
const historyTotalStreamsProvider = HistoryTotalStreamsFamily();

/// See also [historyTotalStreams].
class HistoryTotalStreamsFamily extends Family<AsyncValue<int>> {
  /// See also [historyTotalStreams].
  const HistoryTotalStreamsFamily();

  /// See also [historyTotalStreams].
  HistoryTotalStreamsProvider call({DateTime? startDate, DateTime? endDate}) {
    return HistoryTotalStreamsProvider(startDate: startDate, endDate: endDate);
  }

  @override
  HistoryTotalStreamsProvider getProviderOverride(
    covariant HistoryTotalStreamsProvider provider,
  ) {
    return call(startDate: provider.startDate, endDate: provider.endDate);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'historyTotalStreamsProvider';
}

/// See also [historyTotalStreams].
class HistoryTotalStreamsProvider extends AutoDisposeFutureProvider<int> {
  /// See also [historyTotalStreams].
  HistoryTotalStreamsProvider({DateTime? startDate, DateTime? endDate})
    : this._internal(
        (ref) => historyTotalStreams(
          ref as HistoryTotalStreamsRef,
          startDate: startDate,
          endDate: endDate,
        ),
        from: historyTotalStreamsProvider,
        name: r'historyTotalStreamsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$historyTotalStreamsHash,
        dependencies: HistoryTotalStreamsFamily._dependencies,
        allTransitiveDependencies:
            HistoryTotalStreamsFamily._allTransitiveDependencies,
        startDate: startDate,
        endDate: endDate,
      );

  HistoryTotalStreamsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Override overrideWith(
    FutureOr<int> Function(HistoryTotalStreamsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HistoryTotalStreamsProvider._internal(
        (ref) => create(ref as HistoryTotalStreamsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _HistoryTotalStreamsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HistoryTotalStreamsProvider &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HistoryTotalStreamsRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;
}

class _HistoryTotalStreamsProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with HistoryTotalStreamsRef {
  _HistoryTotalStreamsProviderElement(super.provider);

  @override
  DateTime? get startDate => (origin as HistoryTotalStreamsProvider).startDate;
  @override
  DateTime? get endDate => (origin as HistoryTotalStreamsProvider).endDate;
}

String _$historyTotalMsHash() => r'23991ce20503def7a5ae396e930f4f5980ef034f';

/// See also [historyTotalMs].
@ProviderFor(historyTotalMs)
const historyTotalMsProvider = HistoryTotalMsFamily();

/// See also [historyTotalMs].
class HistoryTotalMsFamily extends Family<AsyncValue<int>> {
  /// See also [historyTotalMs].
  const HistoryTotalMsFamily();

  /// See also [historyTotalMs].
  HistoryTotalMsProvider call({DateTime? startDate, DateTime? endDate}) {
    return HistoryTotalMsProvider(startDate: startDate, endDate: endDate);
  }

  @override
  HistoryTotalMsProvider getProviderOverride(
    covariant HistoryTotalMsProvider provider,
  ) {
    return call(startDate: provider.startDate, endDate: provider.endDate);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'historyTotalMsProvider';
}

/// See also [historyTotalMs].
class HistoryTotalMsProvider extends AutoDisposeFutureProvider<int> {
  /// See also [historyTotalMs].
  HistoryTotalMsProvider({DateTime? startDate, DateTime? endDate})
    : this._internal(
        (ref) => historyTotalMs(
          ref as HistoryTotalMsRef,
          startDate: startDate,
          endDate: endDate,
        ),
        from: historyTotalMsProvider,
        name: r'historyTotalMsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$historyTotalMsHash,
        dependencies: HistoryTotalMsFamily._dependencies,
        allTransitiveDependencies:
            HistoryTotalMsFamily._allTransitiveDependencies,
        startDate: startDate,
        endDate: endDate,
      );

  HistoryTotalMsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Override overrideWith(
    FutureOr<int> Function(HistoryTotalMsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HistoryTotalMsProvider._internal(
        (ref) => create(ref as HistoryTotalMsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _HistoryTotalMsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HistoryTotalMsProvider &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HistoryTotalMsRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;
}

class _HistoryTotalMsProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with HistoryTotalMsRef {
  _HistoryTotalMsProviderElement(super.provider);

  @override
  DateTime? get startDate => (origin as HistoryTotalMsProvider).startDate;
  @override
  DateTime? get endDate => (origin as HistoryTotalMsProvider).endDate;
}

String _$listeningClockHash() => r'610c24408f4a121b0776fef28c3b2992e2184d99';

/// See also [listeningClock].
@ProviderFor(listeningClock)
const listeningClockProvider = ListeningClockFamily();

/// See also [listeningClock].
class ListeningClockFamily extends Family<AsyncValue<List<int>>> {
  /// See also [listeningClock].
  const ListeningClockFamily();

  /// See also [listeningClock].
  ListeningClockProvider call({DateTime? startDate, DateTime? endDate}) {
    return ListeningClockProvider(startDate: startDate, endDate: endDate);
  }

  @override
  ListeningClockProvider getProviderOverride(
    covariant ListeningClockProvider provider,
  ) {
    return call(startDate: provider.startDate, endDate: provider.endDate);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listeningClockProvider';
}

/// See also [listeningClock].
class ListeningClockProvider extends AutoDisposeFutureProvider<List<int>> {
  /// See also [listeningClock].
  ListeningClockProvider({DateTime? startDate, DateTime? endDate})
    : this._internal(
        (ref) => listeningClock(
          ref as ListeningClockRef,
          startDate: startDate,
          endDate: endDate,
        ),
        from: listeningClockProvider,
        name: r'listeningClockProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$listeningClockHash,
        dependencies: ListeningClockFamily._dependencies,
        allTransitiveDependencies:
            ListeningClockFamily._allTransitiveDependencies,
        startDate: startDate,
        endDate: endDate,
      );

  ListeningClockProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Override overrideWith(
    FutureOr<List<int>> Function(ListeningClockRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListeningClockProvider._internal(
        (ref) => create(ref as ListeningClockRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<int>> createElement() {
    return _ListeningClockProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListeningClockProvider &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListeningClockRef on AutoDisposeFutureProviderRef<List<int>> {
  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;
}

class _ListeningClockProviderElement
    extends AutoDisposeFutureProviderElement<List<int>>
    with ListeningClockRef {
  _ListeningClockProviderElement(super.provider);

  @override
  DateTime? get startDate => (origin as ListeningClockProvider).startDate;
  @override
  DateTime? get endDate => (origin as ListeningClockProvider).endDate;
}

String _$artistHistoryStatsHash() =>
    r'72ca98b58c4af83cfae40642dbeb7b4b7d6dc8c7';

/// See also [artistHistoryStats].
@ProviderFor(artistHistoryStats)
const artistHistoryStatsProvider = ArtistHistoryStatsFamily();

/// See also [artistHistoryStats].
class ArtistHistoryStatsFamily extends Family<AsyncValue<ArtistHistoryStats?>> {
  /// See also [artistHistoryStats].
  const ArtistHistoryStatsFamily();

  /// See also [artistHistoryStats].
  ArtistHistoryStatsProvider call(String artistName) {
    return ArtistHistoryStatsProvider(artistName);
  }

  @override
  ArtistHistoryStatsProvider getProviderOverride(
    covariant ArtistHistoryStatsProvider provider,
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
  String? get name => r'artistHistoryStatsProvider';
}

/// See also [artistHistoryStats].
class ArtistHistoryStatsProvider
    extends AutoDisposeFutureProvider<ArtistHistoryStats?> {
  /// See also [artistHistoryStats].
  ArtistHistoryStatsProvider(String artistName)
    : this._internal(
        (ref) => artistHistoryStats(ref as ArtistHistoryStatsRef, artistName),
        from: artistHistoryStatsProvider,
        name: r'artistHistoryStatsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$artistHistoryStatsHash,
        dependencies: ArtistHistoryStatsFamily._dependencies,
        allTransitiveDependencies:
            ArtistHistoryStatsFamily._allTransitiveDependencies,
        artistName: artistName,
      );

  ArtistHistoryStatsProvider._internal(
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
    FutureOr<ArtistHistoryStats?> Function(ArtistHistoryStatsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArtistHistoryStatsProvider._internal(
        (ref) => create(ref as ArtistHistoryStatsRef),
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
  AutoDisposeFutureProviderElement<ArtistHistoryStats?> createElement() {
    return _ArtistHistoryStatsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtistHistoryStatsProvider &&
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
mixin ArtistHistoryStatsRef
    on AutoDisposeFutureProviderRef<ArtistHistoryStats?> {
  /// The parameter `artistName` of this provider.
  String get artistName;
}

class _ArtistHistoryStatsProviderElement
    extends AutoDisposeFutureProviderElement<ArtistHistoryStats?>
    with ArtistHistoryStatsRef {
  _ArtistHistoryStatsProviderElement(super.provider);

  @override
  String get artistName => (origin as ArtistHistoryStatsProvider).artistName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
