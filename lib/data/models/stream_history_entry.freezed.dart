// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_history_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StreamHistoryEntry {

 DateTime get ts; int get msPlayed; String? get trackName; String? get artistName; String? get albumName; String? get spotifyTrackUri; String? get reasonStart; String? get reasonEnd; bool get shuffle; bool get skipped;
/// Create a copy of StreamHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamHistoryEntryCopyWith<StreamHistoryEntry> get copyWith => _$StreamHistoryEntryCopyWithImpl<StreamHistoryEntry>(this as StreamHistoryEntry, _$identity);

  /// Serializes this StreamHistoryEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamHistoryEntry&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.msPlayed, msPlayed) || other.msPlayed == msPlayed)&&(identical(other.trackName, trackName) || other.trackName == trackName)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.spotifyTrackUri, spotifyTrackUri) || other.spotifyTrackUri == spotifyTrackUri)&&(identical(other.reasonStart, reasonStart) || other.reasonStart == reasonStart)&&(identical(other.reasonEnd, reasonEnd) || other.reasonEnd == reasonEnd)&&(identical(other.shuffle, shuffle) || other.shuffle == shuffle)&&(identical(other.skipped, skipped) || other.skipped == skipped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ts,msPlayed,trackName,artistName,albumName,spotifyTrackUri,reasonStart,reasonEnd,shuffle,skipped);

@override
String toString() {
  return 'StreamHistoryEntry(ts: $ts, msPlayed: $msPlayed, trackName: $trackName, artistName: $artistName, albumName: $albumName, spotifyTrackUri: $spotifyTrackUri, reasonStart: $reasonStart, reasonEnd: $reasonEnd, shuffle: $shuffle, skipped: $skipped)';
}


}

/// @nodoc
abstract mixin class $StreamHistoryEntryCopyWith<$Res>  {
  factory $StreamHistoryEntryCopyWith(StreamHistoryEntry value, $Res Function(StreamHistoryEntry) _then) = _$StreamHistoryEntryCopyWithImpl;
@useResult
$Res call({
 DateTime ts, int msPlayed, String? trackName, String? artistName, String? albumName, String? spotifyTrackUri, String? reasonStart, String? reasonEnd, bool shuffle, bool skipped
});




}
/// @nodoc
class _$StreamHistoryEntryCopyWithImpl<$Res>
    implements $StreamHistoryEntryCopyWith<$Res> {
  _$StreamHistoryEntryCopyWithImpl(this._self, this._then);

  final StreamHistoryEntry _self;
  final $Res Function(StreamHistoryEntry) _then;

/// Create a copy of StreamHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ts = null,Object? msPlayed = null,Object? trackName = freezed,Object? artistName = freezed,Object? albumName = freezed,Object? spotifyTrackUri = freezed,Object? reasonStart = freezed,Object? reasonEnd = freezed,Object? shuffle = null,Object? skipped = null,}) {
  return _then(_self.copyWith(
ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as DateTime,msPlayed: null == msPlayed ? _self.msPlayed : msPlayed // ignore: cast_nullable_to_non_nullable
as int,trackName: freezed == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String?,artistName: freezed == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String?,albumName: freezed == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String?,spotifyTrackUri: freezed == spotifyTrackUri ? _self.spotifyTrackUri : spotifyTrackUri // ignore: cast_nullable_to_non_nullable
as String?,reasonStart: freezed == reasonStart ? _self.reasonStart : reasonStart // ignore: cast_nullable_to_non_nullable
as String?,reasonEnd: freezed == reasonEnd ? _self.reasonEnd : reasonEnd // ignore: cast_nullable_to_non_nullable
as String?,shuffle: null == shuffle ? _self.shuffle : shuffle // ignore: cast_nullable_to_non_nullable
as bool,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StreamHistoryEntry].
extension StreamHistoryEntryPatterns on StreamHistoryEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamHistoryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamHistoryEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamHistoryEntry value)  $default,){
final _that = this;
switch (_that) {
case _StreamHistoryEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamHistoryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _StreamHistoryEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime ts,  int msPlayed,  String? trackName,  String? artistName,  String? albumName,  String? spotifyTrackUri,  String? reasonStart,  String? reasonEnd,  bool shuffle,  bool skipped)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamHistoryEntry() when $default != null:
return $default(_that.ts,_that.msPlayed,_that.trackName,_that.artistName,_that.albumName,_that.spotifyTrackUri,_that.reasonStart,_that.reasonEnd,_that.shuffle,_that.skipped);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime ts,  int msPlayed,  String? trackName,  String? artistName,  String? albumName,  String? spotifyTrackUri,  String? reasonStart,  String? reasonEnd,  bool shuffle,  bool skipped)  $default,) {final _that = this;
switch (_that) {
case _StreamHistoryEntry():
return $default(_that.ts,_that.msPlayed,_that.trackName,_that.artistName,_that.albumName,_that.spotifyTrackUri,_that.reasonStart,_that.reasonEnd,_that.shuffle,_that.skipped);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime ts,  int msPlayed,  String? trackName,  String? artistName,  String? albumName,  String? spotifyTrackUri,  String? reasonStart,  String? reasonEnd,  bool shuffle,  bool skipped)?  $default,) {final _that = this;
switch (_that) {
case _StreamHistoryEntry() when $default != null:
return $default(_that.ts,_that.msPlayed,_that.trackName,_that.artistName,_that.albumName,_that.spotifyTrackUri,_that.reasonStart,_that.reasonEnd,_that.shuffle,_that.skipped);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamHistoryEntry implements StreamHistoryEntry {
  const _StreamHistoryEntry({required this.ts, required this.msPlayed, this.trackName, this.artistName, this.albumName, this.spotifyTrackUri, this.reasonStart, this.reasonEnd, this.shuffle = false, this.skipped = false});
  factory _StreamHistoryEntry.fromJson(Map<String, dynamic> json) => _$StreamHistoryEntryFromJson(json);

@override final  DateTime ts;
@override final  int msPlayed;
@override final  String? trackName;
@override final  String? artistName;
@override final  String? albumName;
@override final  String? spotifyTrackUri;
@override final  String? reasonStart;
@override final  String? reasonEnd;
@override@JsonKey() final  bool shuffle;
@override@JsonKey() final  bool skipped;

/// Create a copy of StreamHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamHistoryEntryCopyWith<_StreamHistoryEntry> get copyWith => __$StreamHistoryEntryCopyWithImpl<_StreamHistoryEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamHistoryEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamHistoryEntry&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.msPlayed, msPlayed) || other.msPlayed == msPlayed)&&(identical(other.trackName, trackName) || other.trackName == trackName)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.spotifyTrackUri, spotifyTrackUri) || other.spotifyTrackUri == spotifyTrackUri)&&(identical(other.reasonStart, reasonStart) || other.reasonStart == reasonStart)&&(identical(other.reasonEnd, reasonEnd) || other.reasonEnd == reasonEnd)&&(identical(other.shuffle, shuffle) || other.shuffle == shuffle)&&(identical(other.skipped, skipped) || other.skipped == skipped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ts,msPlayed,trackName,artistName,albumName,spotifyTrackUri,reasonStart,reasonEnd,shuffle,skipped);

@override
String toString() {
  return 'StreamHistoryEntry(ts: $ts, msPlayed: $msPlayed, trackName: $trackName, artistName: $artistName, albumName: $albumName, spotifyTrackUri: $spotifyTrackUri, reasonStart: $reasonStart, reasonEnd: $reasonEnd, shuffle: $shuffle, skipped: $skipped)';
}


}

/// @nodoc
abstract mixin class _$StreamHistoryEntryCopyWith<$Res> implements $StreamHistoryEntryCopyWith<$Res> {
  factory _$StreamHistoryEntryCopyWith(_StreamHistoryEntry value, $Res Function(_StreamHistoryEntry) _then) = __$StreamHistoryEntryCopyWithImpl;
@override @useResult
$Res call({
 DateTime ts, int msPlayed, String? trackName, String? artistName, String? albumName, String? spotifyTrackUri, String? reasonStart, String? reasonEnd, bool shuffle, bool skipped
});




}
/// @nodoc
class __$StreamHistoryEntryCopyWithImpl<$Res>
    implements _$StreamHistoryEntryCopyWith<$Res> {
  __$StreamHistoryEntryCopyWithImpl(this._self, this._then);

  final _StreamHistoryEntry _self;
  final $Res Function(_StreamHistoryEntry) _then;

/// Create a copy of StreamHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ts = null,Object? msPlayed = null,Object? trackName = freezed,Object? artistName = freezed,Object? albumName = freezed,Object? spotifyTrackUri = freezed,Object? reasonStart = freezed,Object? reasonEnd = freezed,Object? shuffle = null,Object? skipped = null,}) {
  return _then(_StreamHistoryEntry(
ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as DateTime,msPlayed: null == msPlayed ? _self.msPlayed : msPlayed // ignore: cast_nullable_to_non_nullable
as int,trackName: freezed == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String?,artistName: freezed == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String?,albumName: freezed == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String?,spotifyTrackUri: freezed == spotifyTrackUri ? _self.spotifyTrackUri : spotifyTrackUri // ignore: cast_nullable_to_non_nullable
as String?,reasonStart: freezed == reasonStart ? _self.reasonStart : reasonStart // ignore: cast_nullable_to_non_nullable
as String?,reasonEnd: freezed == reasonEnd ? _self.reasonEnd : reasonEnd // ignore: cast_nullable_to_non_nullable
as String?,shuffle: null == shuffle ? _self.shuffle : shuffle // ignore: cast_nullable_to_non_nullable
as bool,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ArtistHistoryStats {

 String get artistName; int get streamCount; int get msPlayed; DateTime get firstPlayed; DateTime get lastPlayed; int get rank;
/// Create a copy of ArtistHistoryStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistHistoryStatsCopyWith<ArtistHistoryStats> get copyWith => _$ArtistHistoryStatsCopyWithImpl<ArtistHistoryStats>(this as ArtistHistoryStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtistHistoryStats&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.streamCount, streamCount) || other.streamCount == streamCount)&&(identical(other.msPlayed, msPlayed) || other.msPlayed == msPlayed)&&(identical(other.firstPlayed, firstPlayed) || other.firstPlayed == firstPlayed)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&(identical(other.rank, rank) || other.rank == rank));
}


@override
int get hashCode => Object.hash(runtimeType,artistName,streamCount,msPlayed,firstPlayed,lastPlayed,rank);

@override
String toString() {
  return 'ArtistHistoryStats(artistName: $artistName, streamCount: $streamCount, msPlayed: $msPlayed, firstPlayed: $firstPlayed, lastPlayed: $lastPlayed, rank: $rank)';
}


}

/// @nodoc
abstract mixin class $ArtistHistoryStatsCopyWith<$Res>  {
  factory $ArtistHistoryStatsCopyWith(ArtistHistoryStats value, $Res Function(ArtistHistoryStats) _then) = _$ArtistHistoryStatsCopyWithImpl;
@useResult
$Res call({
 String artistName, int streamCount, int msPlayed, DateTime firstPlayed, DateTime lastPlayed, int rank
});




}
/// @nodoc
class _$ArtistHistoryStatsCopyWithImpl<$Res>
    implements $ArtistHistoryStatsCopyWith<$Res> {
  _$ArtistHistoryStatsCopyWithImpl(this._self, this._then);

  final ArtistHistoryStats _self;
  final $Res Function(ArtistHistoryStats) _then;

/// Create a copy of ArtistHistoryStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? artistName = null,Object? streamCount = null,Object? msPlayed = null,Object? firstPlayed = null,Object? lastPlayed = null,Object? rank = null,}) {
  return _then(_self.copyWith(
artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,streamCount: null == streamCount ? _self.streamCount : streamCount // ignore: cast_nullable_to_non_nullable
as int,msPlayed: null == msPlayed ? _self.msPlayed : msPlayed // ignore: cast_nullable_to_non_nullable
as int,firstPlayed: null == firstPlayed ? _self.firstPlayed : firstPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ArtistHistoryStats].
extension ArtistHistoryStatsPatterns on ArtistHistoryStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArtistHistoryStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArtistHistoryStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArtistHistoryStats value)  $default,){
final _that = this;
switch (_that) {
case _ArtistHistoryStats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArtistHistoryStats value)?  $default,){
final _that = this;
switch (_that) {
case _ArtistHistoryStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String artistName,  int streamCount,  int msPlayed,  DateTime firstPlayed,  DateTime lastPlayed,  int rank)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArtistHistoryStats() when $default != null:
return $default(_that.artistName,_that.streamCount,_that.msPlayed,_that.firstPlayed,_that.lastPlayed,_that.rank);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String artistName,  int streamCount,  int msPlayed,  DateTime firstPlayed,  DateTime lastPlayed,  int rank)  $default,) {final _that = this;
switch (_that) {
case _ArtistHistoryStats():
return $default(_that.artistName,_that.streamCount,_that.msPlayed,_that.firstPlayed,_that.lastPlayed,_that.rank);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String artistName,  int streamCount,  int msPlayed,  DateTime firstPlayed,  DateTime lastPlayed,  int rank)?  $default,) {final _that = this;
switch (_that) {
case _ArtistHistoryStats() when $default != null:
return $default(_that.artistName,_that.streamCount,_that.msPlayed,_that.firstPlayed,_that.lastPlayed,_that.rank);case _:
  return null;

}
}

}

/// @nodoc


class _ArtistHistoryStats implements ArtistHistoryStats {
  const _ArtistHistoryStats({required this.artistName, required this.streamCount, required this.msPlayed, required this.firstPlayed, required this.lastPlayed, required this.rank});
  

@override final  String artistName;
@override final  int streamCount;
@override final  int msPlayed;
@override final  DateTime firstPlayed;
@override final  DateTime lastPlayed;
@override final  int rank;

/// Create a copy of ArtistHistoryStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtistHistoryStatsCopyWith<_ArtistHistoryStats> get copyWith => __$ArtistHistoryStatsCopyWithImpl<_ArtistHistoryStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtistHistoryStats&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.streamCount, streamCount) || other.streamCount == streamCount)&&(identical(other.msPlayed, msPlayed) || other.msPlayed == msPlayed)&&(identical(other.firstPlayed, firstPlayed) || other.firstPlayed == firstPlayed)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&(identical(other.rank, rank) || other.rank == rank));
}


@override
int get hashCode => Object.hash(runtimeType,artistName,streamCount,msPlayed,firstPlayed,lastPlayed,rank);

@override
String toString() {
  return 'ArtistHistoryStats(artistName: $artistName, streamCount: $streamCount, msPlayed: $msPlayed, firstPlayed: $firstPlayed, lastPlayed: $lastPlayed, rank: $rank)';
}


}

/// @nodoc
abstract mixin class _$ArtistHistoryStatsCopyWith<$Res> implements $ArtistHistoryStatsCopyWith<$Res> {
  factory _$ArtistHistoryStatsCopyWith(_ArtistHistoryStats value, $Res Function(_ArtistHistoryStats) _then) = __$ArtistHistoryStatsCopyWithImpl;
@override @useResult
$Res call({
 String artistName, int streamCount, int msPlayed, DateTime firstPlayed, DateTime lastPlayed, int rank
});




}
/// @nodoc
class __$ArtistHistoryStatsCopyWithImpl<$Res>
    implements _$ArtistHistoryStatsCopyWith<$Res> {
  __$ArtistHistoryStatsCopyWithImpl(this._self, this._then);

  final _ArtistHistoryStats _self;
  final $Res Function(_ArtistHistoryStats) _then;

/// Create a copy of ArtistHistoryStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? artistName = null,Object? streamCount = null,Object? msPlayed = null,Object? firstPlayed = null,Object? lastPlayed = null,Object? rank = null,}) {
  return _then(_ArtistHistoryStats(
artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,streamCount: null == streamCount ? _self.streamCount : streamCount // ignore: cast_nullable_to_non_nullable
as int,msPlayed: null == msPlayed ? _self.msPlayed : msPlayed // ignore: cast_nullable_to_non_nullable
as int,firstPlayed: null == firstPlayed ? _self.firstPlayed : firstPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$TrackHistoryStats {

 String get trackName; String get artistName; String? get albumName; String? get spotifyTrackUri; int get streamCount; int get msPlayed; DateTime get firstPlayed; DateTime get lastPlayed; int get rank;
/// Create a copy of TrackHistoryStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackHistoryStatsCopyWith<TrackHistoryStats> get copyWith => _$TrackHistoryStatsCopyWithImpl<TrackHistoryStats>(this as TrackHistoryStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackHistoryStats&&(identical(other.trackName, trackName) || other.trackName == trackName)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.spotifyTrackUri, spotifyTrackUri) || other.spotifyTrackUri == spotifyTrackUri)&&(identical(other.streamCount, streamCount) || other.streamCount == streamCount)&&(identical(other.msPlayed, msPlayed) || other.msPlayed == msPlayed)&&(identical(other.firstPlayed, firstPlayed) || other.firstPlayed == firstPlayed)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&(identical(other.rank, rank) || other.rank == rank));
}


@override
int get hashCode => Object.hash(runtimeType,trackName,artistName,albumName,spotifyTrackUri,streamCount,msPlayed,firstPlayed,lastPlayed,rank);

@override
String toString() {
  return 'TrackHistoryStats(trackName: $trackName, artistName: $artistName, albumName: $albumName, spotifyTrackUri: $spotifyTrackUri, streamCount: $streamCount, msPlayed: $msPlayed, firstPlayed: $firstPlayed, lastPlayed: $lastPlayed, rank: $rank)';
}


}

/// @nodoc
abstract mixin class $TrackHistoryStatsCopyWith<$Res>  {
  factory $TrackHistoryStatsCopyWith(TrackHistoryStats value, $Res Function(TrackHistoryStats) _then) = _$TrackHistoryStatsCopyWithImpl;
@useResult
$Res call({
 String trackName, String artistName, String? albumName, String? spotifyTrackUri, int streamCount, int msPlayed, DateTime firstPlayed, DateTime lastPlayed, int rank
});




}
/// @nodoc
class _$TrackHistoryStatsCopyWithImpl<$Res>
    implements $TrackHistoryStatsCopyWith<$Res> {
  _$TrackHistoryStatsCopyWithImpl(this._self, this._then);

  final TrackHistoryStats _self;
  final $Res Function(TrackHistoryStats) _then;

/// Create a copy of TrackHistoryStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trackName = null,Object? artistName = null,Object? albumName = freezed,Object? spotifyTrackUri = freezed,Object? streamCount = null,Object? msPlayed = null,Object? firstPlayed = null,Object? lastPlayed = null,Object? rank = null,}) {
  return _then(_self.copyWith(
trackName: null == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,albumName: freezed == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String?,spotifyTrackUri: freezed == spotifyTrackUri ? _self.spotifyTrackUri : spotifyTrackUri // ignore: cast_nullable_to_non_nullable
as String?,streamCount: null == streamCount ? _self.streamCount : streamCount // ignore: cast_nullable_to_non_nullable
as int,msPlayed: null == msPlayed ? _self.msPlayed : msPlayed // ignore: cast_nullable_to_non_nullable
as int,firstPlayed: null == firstPlayed ? _self.firstPlayed : firstPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackHistoryStats].
extension TrackHistoryStatsPatterns on TrackHistoryStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackHistoryStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackHistoryStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackHistoryStats value)  $default,){
final _that = this;
switch (_that) {
case _TrackHistoryStats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackHistoryStats value)?  $default,){
final _that = this;
switch (_that) {
case _TrackHistoryStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String trackName,  String artistName,  String? albumName,  String? spotifyTrackUri,  int streamCount,  int msPlayed,  DateTime firstPlayed,  DateTime lastPlayed,  int rank)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackHistoryStats() when $default != null:
return $default(_that.trackName,_that.artistName,_that.albumName,_that.spotifyTrackUri,_that.streamCount,_that.msPlayed,_that.firstPlayed,_that.lastPlayed,_that.rank);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String trackName,  String artistName,  String? albumName,  String? spotifyTrackUri,  int streamCount,  int msPlayed,  DateTime firstPlayed,  DateTime lastPlayed,  int rank)  $default,) {final _that = this;
switch (_that) {
case _TrackHistoryStats():
return $default(_that.trackName,_that.artistName,_that.albumName,_that.spotifyTrackUri,_that.streamCount,_that.msPlayed,_that.firstPlayed,_that.lastPlayed,_that.rank);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String trackName,  String artistName,  String? albumName,  String? spotifyTrackUri,  int streamCount,  int msPlayed,  DateTime firstPlayed,  DateTime lastPlayed,  int rank)?  $default,) {final _that = this;
switch (_that) {
case _TrackHistoryStats() when $default != null:
return $default(_that.trackName,_that.artistName,_that.albumName,_that.spotifyTrackUri,_that.streamCount,_that.msPlayed,_that.firstPlayed,_that.lastPlayed,_that.rank);case _:
  return null;

}
}

}

/// @nodoc


class _TrackHistoryStats implements TrackHistoryStats {
  const _TrackHistoryStats({required this.trackName, required this.artistName, required this.albumName, required this.spotifyTrackUri, required this.streamCount, required this.msPlayed, required this.firstPlayed, required this.lastPlayed, required this.rank});
  

@override final  String trackName;
@override final  String artistName;
@override final  String? albumName;
@override final  String? spotifyTrackUri;
@override final  int streamCount;
@override final  int msPlayed;
@override final  DateTime firstPlayed;
@override final  DateTime lastPlayed;
@override final  int rank;

/// Create a copy of TrackHistoryStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackHistoryStatsCopyWith<_TrackHistoryStats> get copyWith => __$TrackHistoryStatsCopyWithImpl<_TrackHistoryStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackHistoryStats&&(identical(other.trackName, trackName) || other.trackName == trackName)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.spotifyTrackUri, spotifyTrackUri) || other.spotifyTrackUri == spotifyTrackUri)&&(identical(other.streamCount, streamCount) || other.streamCount == streamCount)&&(identical(other.msPlayed, msPlayed) || other.msPlayed == msPlayed)&&(identical(other.firstPlayed, firstPlayed) || other.firstPlayed == firstPlayed)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&(identical(other.rank, rank) || other.rank == rank));
}


@override
int get hashCode => Object.hash(runtimeType,trackName,artistName,albumName,spotifyTrackUri,streamCount,msPlayed,firstPlayed,lastPlayed,rank);

@override
String toString() {
  return 'TrackHistoryStats(trackName: $trackName, artistName: $artistName, albumName: $albumName, spotifyTrackUri: $spotifyTrackUri, streamCount: $streamCount, msPlayed: $msPlayed, firstPlayed: $firstPlayed, lastPlayed: $lastPlayed, rank: $rank)';
}


}

/// @nodoc
abstract mixin class _$TrackHistoryStatsCopyWith<$Res> implements $TrackHistoryStatsCopyWith<$Res> {
  factory _$TrackHistoryStatsCopyWith(_TrackHistoryStats value, $Res Function(_TrackHistoryStats) _then) = __$TrackHistoryStatsCopyWithImpl;
@override @useResult
$Res call({
 String trackName, String artistName, String? albumName, String? spotifyTrackUri, int streamCount, int msPlayed, DateTime firstPlayed, DateTime lastPlayed, int rank
});




}
/// @nodoc
class __$TrackHistoryStatsCopyWithImpl<$Res>
    implements _$TrackHistoryStatsCopyWith<$Res> {
  __$TrackHistoryStatsCopyWithImpl(this._self, this._then);

  final _TrackHistoryStats _self;
  final $Res Function(_TrackHistoryStats) _then;

/// Create a copy of TrackHistoryStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trackName = null,Object? artistName = null,Object? albumName = freezed,Object? spotifyTrackUri = freezed,Object? streamCount = null,Object? msPlayed = null,Object? firstPlayed = null,Object? lastPlayed = null,Object? rank = null,}) {
  return _then(_TrackHistoryStats(
trackName: null == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,albumName: freezed == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String?,spotifyTrackUri: freezed == spotifyTrackUri ? _self.spotifyTrackUri : spotifyTrackUri // ignore: cast_nullable_to_non_nullable
as String?,streamCount: null == streamCount ? _self.streamCount : streamCount // ignore: cast_nullable_to_non_nullable
as int,msPlayed: null == msPlayed ? _self.msPlayed : msPlayed // ignore: cast_nullable_to_non_nullable
as int,firstPlayed: null == firstPlayed ? _self.firstPlayed : firstPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ListeningClockData {

 List<int> get hourCounts;
/// Create a copy of ListeningClockData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListeningClockDataCopyWith<ListeningClockData> get copyWith => _$ListeningClockDataCopyWithImpl<ListeningClockData>(this as ListeningClockData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListeningClockData&&const DeepCollectionEquality().equals(other.hourCounts, hourCounts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(hourCounts));

@override
String toString() {
  return 'ListeningClockData(hourCounts: $hourCounts)';
}


}

/// @nodoc
abstract mixin class $ListeningClockDataCopyWith<$Res>  {
  factory $ListeningClockDataCopyWith(ListeningClockData value, $Res Function(ListeningClockData) _then) = _$ListeningClockDataCopyWithImpl;
@useResult
$Res call({
 List<int> hourCounts
});




}
/// @nodoc
class _$ListeningClockDataCopyWithImpl<$Res>
    implements $ListeningClockDataCopyWith<$Res> {
  _$ListeningClockDataCopyWithImpl(this._self, this._then);

  final ListeningClockData _self;
  final $Res Function(ListeningClockData) _then;

/// Create a copy of ListeningClockData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hourCounts = null,}) {
  return _then(_self.copyWith(
hourCounts: null == hourCounts ? _self.hourCounts : hourCounts // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListeningClockData].
extension ListeningClockDataPatterns on ListeningClockData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListeningClockData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListeningClockData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListeningClockData value)  $default,){
final _that = this;
switch (_that) {
case _ListeningClockData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListeningClockData value)?  $default,){
final _that = this;
switch (_that) {
case _ListeningClockData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> hourCounts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListeningClockData() when $default != null:
return $default(_that.hourCounts);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> hourCounts)  $default,) {final _that = this;
switch (_that) {
case _ListeningClockData():
return $default(_that.hourCounts);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> hourCounts)?  $default,) {final _that = this;
switch (_that) {
case _ListeningClockData() when $default != null:
return $default(_that.hourCounts);case _:
  return null;

}
}

}

/// @nodoc


class _ListeningClockData implements ListeningClockData {
  const _ListeningClockData({required final  List<int> hourCounts}): _hourCounts = hourCounts;
  

 final  List<int> _hourCounts;
@override List<int> get hourCounts {
  if (_hourCounts is EqualUnmodifiableListView) return _hourCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hourCounts);
}


/// Create a copy of ListeningClockData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListeningClockDataCopyWith<_ListeningClockData> get copyWith => __$ListeningClockDataCopyWithImpl<_ListeningClockData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListeningClockData&&const DeepCollectionEquality().equals(other._hourCounts, _hourCounts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hourCounts));

@override
String toString() {
  return 'ListeningClockData(hourCounts: $hourCounts)';
}


}

/// @nodoc
abstract mixin class _$ListeningClockDataCopyWith<$Res> implements $ListeningClockDataCopyWith<$Res> {
  factory _$ListeningClockDataCopyWith(_ListeningClockData value, $Res Function(_ListeningClockData) _then) = __$ListeningClockDataCopyWithImpl;
@override @useResult
$Res call({
 List<int> hourCounts
});




}
/// @nodoc
class __$ListeningClockDataCopyWithImpl<$Res>
    implements _$ListeningClockDataCopyWith<$Res> {
  __$ListeningClockDataCopyWithImpl(this._self, this._then);

  final _ListeningClockData _self;
  final $Res Function(_ListeningClockData) _then;

/// Create a copy of ListeningClockData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hourCounts = null,}) {
  return _then(_ListeningClockData(
hourCounts: null == hourCounts ? _self._hourCounts : hourCounts // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
