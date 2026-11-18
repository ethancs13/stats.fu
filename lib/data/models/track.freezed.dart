// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Album {

 String get id; String get name; List<SpotifyImage> get images; String? get releaseDate; String? get externalUrl;
/// Create a copy of Album
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumCopyWith<Album> get copyWith => _$AlbumCopyWithImpl<Album>(this as Album, _$identity);

  /// Serializes this Album to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Album&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(images),releaseDate,externalUrl);

@override
String toString() {
  return 'Album(id: $id, name: $name, images: $images, releaseDate: $releaseDate, externalUrl: $externalUrl)';
}


}

/// @nodoc
abstract mixin class $AlbumCopyWith<$Res>  {
  factory $AlbumCopyWith(Album value, $Res Function(Album) _then) = _$AlbumCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<SpotifyImage> images, String? releaseDate, String? externalUrl
});




}
/// @nodoc
class _$AlbumCopyWithImpl<$Res>
    implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._self, this._then);

  final Album _self;
  final $Res Function(Album) _then;

/// Create a copy of Album
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? images = null,Object? releaseDate = freezed,Object? externalUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<SpotifyImage>,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Album].
extension AlbumPatterns on Album {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Album value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Album() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Album value)  $default,){
final _that = this;
switch (_that) {
case _Album():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Album value)?  $default,){
final _that = this;
switch (_that) {
case _Album() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<SpotifyImage> images,  String? releaseDate,  String? externalUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Album() when $default != null:
return $default(_that.id,_that.name,_that.images,_that.releaseDate,_that.externalUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<SpotifyImage> images,  String? releaseDate,  String? externalUrl)  $default,) {final _that = this;
switch (_that) {
case _Album():
return $default(_that.id,_that.name,_that.images,_that.releaseDate,_that.externalUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<SpotifyImage> images,  String? releaseDate,  String? externalUrl)?  $default,) {final _that = this;
switch (_that) {
case _Album() when $default != null:
return $default(_that.id,_that.name,_that.images,_that.releaseDate,_that.externalUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Album implements Album {
  const _Album({required this.id, required this.name, final  List<SpotifyImage> images = const [], this.releaseDate, this.externalUrl}): _images = images;
  factory _Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

@override final  String id;
@override final  String name;
 final  List<SpotifyImage> _images;
@override@JsonKey() List<SpotifyImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  String? releaseDate;
@override final  String? externalUrl;

/// Create a copy of Album
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlbumCopyWith<_Album> get copyWith => __$AlbumCopyWithImpl<_Album>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlbumToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Album&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_images),releaseDate,externalUrl);

@override
String toString() {
  return 'Album(id: $id, name: $name, images: $images, releaseDate: $releaseDate, externalUrl: $externalUrl)';
}


}

/// @nodoc
abstract mixin class _$AlbumCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$AlbumCopyWith(_Album value, $Res Function(_Album) _then) = __$AlbumCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<SpotifyImage> images, String? releaseDate, String? externalUrl
});




}
/// @nodoc
class __$AlbumCopyWithImpl<$Res>
    implements _$AlbumCopyWith<$Res> {
  __$AlbumCopyWithImpl(this._self, this._then);

  final _Album _self;
  final $Res Function(_Album) _then;

/// Create a copy of Album
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? images = null,Object? releaseDate = freezed,Object? externalUrl = freezed,}) {
  return _then(_Album(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<SpotifyImage>,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Track {

 String get id; String get name; Album get album; List<Artist> get artists; int get durationMs; int? get popularity; String? get previewUrl; String? get externalUrl; bool get explicit;
/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackCopyWith<Track> get copyWith => _$TrackCopyWithImpl<Track>(this as Track, _$identity);

  /// Serializes this Track to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Track&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.album, album) || other.album == album)&&const DeepCollectionEquality().equals(other.artists, artists)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.explicit, explicit) || other.explicit == explicit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,album,const DeepCollectionEquality().hash(artists),durationMs,popularity,previewUrl,externalUrl,explicit);

@override
String toString() {
  return 'Track(id: $id, name: $name, album: $album, artists: $artists, durationMs: $durationMs, popularity: $popularity, previewUrl: $previewUrl, externalUrl: $externalUrl, explicit: $explicit)';
}


}

/// @nodoc
abstract mixin class $TrackCopyWith<$Res>  {
  factory $TrackCopyWith(Track value, $Res Function(Track) _then) = _$TrackCopyWithImpl;
@useResult
$Res call({
 String id, String name, Album album, List<Artist> artists, int durationMs, int? popularity, String? previewUrl, String? externalUrl, bool explicit
});


$AlbumCopyWith<$Res> get album;

}
/// @nodoc
class _$TrackCopyWithImpl<$Res>
    implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._self, this._then);

  final Track _self;
  final $Res Function(Track) _then;

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? album = null,Object? artists = null,Object? durationMs = null,Object? popularity = freezed,Object? previewUrl = freezed,Object? externalUrl = freezed,Object? explicit = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as Album,artists: null == artists ? _self.artists : artists // ignore: cast_nullable_to_non_nullable
as List<Artist>,durationMs: null == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlbumCopyWith<$Res> get album {
  
  return $AlbumCopyWith<$Res>(_self.album, (value) {
    return _then(_self.copyWith(album: value));
  });
}
}


/// Adds pattern-matching-related methods to [Track].
extension TrackPatterns on Track {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Track value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Track() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Track value)  $default,){
final _that = this;
switch (_that) {
case _Track():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Track value)?  $default,){
final _that = this;
switch (_that) {
case _Track() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  Album album,  List<Artist> artists,  int durationMs,  int? popularity,  String? previewUrl,  String? externalUrl,  bool explicit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Track() when $default != null:
return $default(_that.id,_that.name,_that.album,_that.artists,_that.durationMs,_that.popularity,_that.previewUrl,_that.externalUrl,_that.explicit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  Album album,  List<Artist> artists,  int durationMs,  int? popularity,  String? previewUrl,  String? externalUrl,  bool explicit)  $default,) {final _that = this;
switch (_that) {
case _Track():
return $default(_that.id,_that.name,_that.album,_that.artists,_that.durationMs,_that.popularity,_that.previewUrl,_that.externalUrl,_that.explicit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  Album album,  List<Artist> artists,  int durationMs,  int? popularity,  String? previewUrl,  String? externalUrl,  bool explicit)?  $default,) {final _that = this;
switch (_that) {
case _Track() when $default != null:
return $default(_that.id,_that.name,_that.album,_that.artists,_that.durationMs,_that.popularity,_that.previewUrl,_that.externalUrl,_that.explicit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Track implements Track {
  const _Track({required this.id, required this.name, required this.album, required final  List<Artist> artists, required this.durationMs, this.popularity, this.previewUrl, this.externalUrl, this.explicit = false}): _artists = artists;
  factory _Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

@override final  String id;
@override final  String name;
@override final  Album album;
 final  List<Artist> _artists;
@override List<Artist> get artists {
  if (_artists is EqualUnmodifiableListView) return _artists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_artists);
}

@override final  int durationMs;
@override final  int? popularity;
@override final  String? previewUrl;
@override final  String? externalUrl;
@override@JsonKey() final  bool explicit;

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackCopyWith<_Track> get copyWith => __$TrackCopyWithImpl<_Track>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Track&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.album, album) || other.album == album)&&const DeepCollectionEquality().equals(other._artists, _artists)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.explicit, explicit) || other.explicit == explicit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,album,const DeepCollectionEquality().hash(_artists),durationMs,popularity,previewUrl,externalUrl,explicit);

@override
String toString() {
  return 'Track(id: $id, name: $name, album: $album, artists: $artists, durationMs: $durationMs, popularity: $popularity, previewUrl: $previewUrl, externalUrl: $externalUrl, explicit: $explicit)';
}


}

/// @nodoc
abstract mixin class _$TrackCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$TrackCopyWith(_Track value, $Res Function(_Track) _then) = __$TrackCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, Album album, List<Artist> artists, int durationMs, int? popularity, String? previewUrl, String? externalUrl, bool explicit
});


@override $AlbumCopyWith<$Res> get album;

}
/// @nodoc
class __$TrackCopyWithImpl<$Res>
    implements _$TrackCopyWith<$Res> {
  __$TrackCopyWithImpl(this._self, this._then);

  final _Track _self;
  final $Res Function(_Track) _then;

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? album = null,Object? artists = null,Object? durationMs = null,Object? popularity = freezed,Object? previewUrl = freezed,Object? externalUrl = freezed,Object? explicit = null,}) {
  return _then(_Track(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as Album,artists: null == artists ? _self._artists : artists // ignore: cast_nullable_to_non_nullable
as List<Artist>,durationMs: null == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlbumCopyWith<$Res> get album {
  
  return $AlbumCopyWith<$Res>(_self.album, (value) {
    return _then(_self.copyWith(album: value));
  });
}
}

/// @nodoc
mixin _$TrackWithStats {

 Track get track; int get rank; int? get streamCount; int? get msPlayed; DateTime? get firstPlayed; DateTime? get lastPlayed;
/// Create a copy of TrackWithStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackWithStatsCopyWith<TrackWithStats> get copyWith => _$TrackWithStatsCopyWithImpl<TrackWithStats>(this as TrackWithStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackWithStats&&(identical(other.track, track) || other.track == track)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.streamCount, streamCount) || other.streamCount == streamCount)&&(identical(other.msPlayed, msPlayed) || other.msPlayed == msPlayed)&&(identical(other.firstPlayed, firstPlayed) || other.firstPlayed == firstPlayed)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed));
}


@override
int get hashCode => Object.hash(runtimeType,track,rank,streamCount,msPlayed,firstPlayed,lastPlayed);

@override
String toString() {
  return 'TrackWithStats(track: $track, rank: $rank, streamCount: $streamCount, msPlayed: $msPlayed, firstPlayed: $firstPlayed, lastPlayed: $lastPlayed)';
}


}

/// @nodoc
abstract mixin class $TrackWithStatsCopyWith<$Res>  {
  factory $TrackWithStatsCopyWith(TrackWithStats value, $Res Function(TrackWithStats) _then) = _$TrackWithStatsCopyWithImpl;
@useResult
$Res call({
 Track track, int rank, int? streamCount, int? msPlayed, DateTime? firstPlayed, DateTime? lastPlayed
});


$TrackCopyWith<$Res> get track;

}
/// @nodoc
class _$TrackWithStatsCopyWithImpl<$Res>
    implements $TrackWithStatsCopyWith<$Res> {
  _$TrackWithStatsCopyWithImpl(this._self, this._then);

  final TrackWithStats _self;
  final $Res Function(TrackWithStats) _then;

/// Create a copy of TrackWithStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? track = null,Object? rank = null,Object? streamCount = freezed,Object? msPlayed = freezed,Object? firstPlayed = freezed,Object? lastPlayed = freezed,}) {
  return _then(_self.copyWith(
track: null == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as Track,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,streamCount: freezed == streamCount ? _self.streamCount : streamCount // ignore: cast_nullable_to_non_nullable
as int?,msPlayed: freezed == msPlayed ? _self.msPlayed : msPlayed // ignore: cast_nullable_to_non_nullable
as int?,firstPlayed: freezed == firstPlayed ? _self.firstPlayed : firstPlayed // ignore: cast_nullable_to_non_nullable
as DateTime?,lastPlayed: freezed == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of TrackWithStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackCopyWith<$Res> get track {
  
  return $TrackCopyWith<$Res>(_self.track, (value) {
    return _then(_self.copyWith(track: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrackWithStats].
extension TrackWithStatsPatterns on TrackWithStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackWithStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackWithStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackWithStats value)  $default,){
final _that = this;
switch (_that) {
case _TrackWithStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackWithStats value)?  $default,){
final _that = this;
switch (_that) {
case _TrackWithStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Track track,  int rank,  int? streamCount,  int? msPlayed,  DateTime? firstPlayed,  DateTime? lastPlayed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackWithStats() when $default != null:
return $default(_that.track,_that.rank,_that.streamCount,_that.msPlayed,_that.firstPlayed,_that.lastPlayed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Track track,  int rank,  int? streamCount,  int? msPlayed,  DateTime? firstPlayed,  DateTime? lastPlayed)  $default,) {final _that = this;
switch (_that) {
case _TrackWithStats():
return $default(_that.track,_that.rank,_that.streamCount,_that.msPlayed,_that.firstPlayed,_that.lastPlayed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Track track,  int rank,  int? streamCount,  int? msPlayed,  DateTime? firstPlayed,  DateTime? lastPlayed)?  $default,) {final _that = this;
switch (_that) {
case _TrackWithStats() when $default != null:
return $default(_that.track,_that.rank,_that.streamCount,_that.msPlayed,_that.firstPlayed,_that.lastPlayed);case _:
  return null;

}
}

}

/// @nodoc


class _TrackWithStats implements TrackWithStats {
  const _TrackWithStats({required this.track, required this.rank, this.streamCount, this.msPlayed, this.firstPlayed, this.lastPlayed});
  

@override final  Track track;
@override final  int rank;
@override final  int? streamCount;
@override final  int? msPlayed;
@override final  DateTime? firstPlayed;
@override final  DateTime? lastPlayed;

/// Create a copy of TrackWithStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackWithStatsCopyWith<_TrackWithStats> get copyWith => __$TrackWithStatsCopyWithImpl<_TrackWithStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackWithStats&&(identical(other.track, track) || other.track == track)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.streamCount, streamCount) || other.streamCount == streamCount)&&(identical(other.msPlayed, msPlayed) || other.msPlayed == msPlayed)&&(identical(other.firstPlayed, firstPlayed) || other.firstPlayed == firstPlayed)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed));
}


@override
int get hashCode => Object.hash(runtimeType,track,rank,streamCount,msPlayed,firstPlayed,lastPlayed);

@override
String toString() {
  return 'TrackWithStats(track: $track, rank: $rank, streamCount: $streamCount, msPlayed: $msPlayed, firstPlayed: $firstPlayed, lastPlayed: $lastPlayed)';
}


}

/// @nodoc
abstract mixin class _$TrackWithStatsCopyWith<$Res> implements $TrackWithStatsCopyWith<$Res> {
  factory _$TrackWithStatsCopyWith(_TrackWithStats value, $Res Function(_TrackWithStats) _then) = __$TrackWithStatsCopyWithImpl;
@override @useResult
$Res call({
 Track track, int rank, int? streamCount, int? msPlayed, DateTime? firstPlayed, DateTime? lastPlayed
});


@override $TrackCopyWith<$Res> get track;

}
/// @nodoc
class __$TrackWithStatsCopyWithImpl<$Res>
    implements _$TrackWithStatsCopyWith<$Res> {
  __$TrackWithStatsCopyWithImpl(this._self, this._then);

  final _TrackWithStats _self;
  final $Res Function(_TrackWithStats) _then;

/// Create a copy of TrackWithStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? track = null,Object? rank = null,Object? streamCount = freezed,Object? msPlayed = freezed,Object? firstPlayed = freezed,Object? lastPlayed = freezed,}) {
  return _then(_TrackWithStats(
track: null == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as Track,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,streamCount: freezed == streamCount ? _self.streamCount : streamCount // ignore: cast_nullable_to_non_nullable
as int?,msPlayed: freezed == msPlayed ? _self.msPlayed : msPlayed // ignore: cast_nullable_to_non_nullable
as int?,firstPlayed: freezed == firstPlayed ? _self.firstPlayed : firstPlayed // ignore: cast_nullable_to_non_nullable
as DateTime?,lastPlayed: freezed == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of TrackWithStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackCopyWith<$Res> get track {
  
  return $TrackCopyWith<$Res>(_self.track, (value) {
    return _then(_self.copyWith(track: value));
  });
}
}


/// @nodoc
mixin _$AudioFeatures {

 String get id; double get danceability; double get energy; double get valence; double get acousticness; double get instrumentalness; double get speechiness; double get liveness; double get loudness; int get tempo; int get key; int get timeSignature;
/// Create a copy of AudioFeatures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioFeaturesCopyWith<AudioFeatures> get copyWith => _$AudioFeaturesCopyWithImpl<AudioFeatures>(this as AudioFeatures, _$identity);

  /// Serializes this AudioFeatures to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioFeatures&&(identical(other.id, id) || other.id == id)&&(identical(other.danceability, danceability) || other.danceability == danceability)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.valence, valence) || other.valence == valence)&&(identical(other.acousticness, acousticness) || other.acousticness == acousticness)&&(identical(other.instrumentalness, instrumentalness) || other.instrumentalness == instrumentalness)&&(identical(other.speechiness, speechiness) || other.speechiness == speechiness)&&(identical(other.liveness, liveness) || other.liveness == liveness)&&(identical(other.loudness, loudness) || other.loudness == loudness)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.key, key) || other.key == key)&&(identical(other.timeSignature, timeSignature) || other.timeSignature == timeSignature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,danceability,energy,valence,acousticness,instrumentalness,speechiness,liveness,loudness,tempo,key,timeSignature);

@override
String toString() {
  return 'AudioFeatures(id: $id, danceability: $danceability, energy: $energy, valence: $valence, acousticness: $acousticness, instrumentalness: $instrumentalness, speechiness: $speechiness, liveness: $liveness, loudness: $loudness, tempo: $tempo, key: $key, timeSignature: $timeSignature)';
}


}

/// @nodoc
abstract mixin class $AudioFeaturesCopyWith<$Res>  {
  factory $AudioFeaturesCopyWith(AudioFeatures value, $Res Function(AudioFeatures) _then) = _$AudioFeaturesCopyWithImpl;
@useResult
$Res call({
 String id, double danceability, double energy, double valence, double acousticness, double instrumentalness, double speechiness, double liveness, double loudness, int tempo, int key, int timeSignature
});




}
/// @nodoc
class _$AudioFeaturesCopyWithImpl<$Res>
    implements $AudioFeaturesCopyWith<$Res> {
  _$AudioFeaturesCopyWithImpl(this._self, this._then);

  final AudioFeatures _self;
  final $Res Function(AudioFeatures) _then;

/// Create a copy of AudioFeatures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? danceability = null,Object? energy = null,Object? valence = null,Object? acousticness = null,Object? instrumentalness = null,Object? speechiness = null,Object? liveness = null,Object? loudness = null,Object? tempo = null,Object? key = null,Object? timeSignature = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,danceability: null == danceability ? _self.danceability : danceability // ignore: cast_nullable_to_non_nullable
as double,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as double,valence: null == valence ? _self.valence : valence // ignore: cast_nullable_to_non_nullable
as double,acousticness: null == acousticness ? _self.acousticness : acousticness // ignore: cast_nullable_to_non_nullable
as double,instrumentalness: null == instrumentalness ? _self.instrumentalness : instrumentalness // ignore: cast_nullable_to_non_nullable
as double,speechiness: null == speechiness ? _self.speechiness : speechiness // ignore: cast_nullable_to_non_nullable
as double,liveness: null == liveness ? _self.liveness : liveness // ignore: cast_nullable_to_non_nullable
as double,loudness: null == loudness ? _self.loudness : loudness // ignore: cast_nullable_to_non_nullable
as double,tempo: null == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as int,timeSignature: null == timeSignature ? _self.timeSignature : timeSignature // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioFeatures].
extension AudioFeaturesPatterns on AudioFeatures {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioFeatures value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioFeatures() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioFeatures value)  $default,){
final _that = this;
switch (_that) {
case _AudioFeatures():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioFeatures value)?  $default,){
final _that = this;
switch (_that) {
case _AudioFeatures() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double danceability,  double energy,  double valence,  double acousticness,  double instrumentalness,  double speechiness,  double liveness,  double loudness,  int tempo,  int key,  int timeSignature)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioFeatures() when $default != null:
return $default(_that.id,_that.danceability,_that.energy,_that.valence,_that.acousticness,_that.instrumentalness,_that.speechiness,_that.liveness,_that.loudness,_that.tempo,_that.key,_that.timeSignature);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double danceability,  double energy,  double valence,  double acousticness,  double instrumentalness,  double speechiness,  double liveness,  double loudness,  int tempo,  int key,  int timeSignature)  $default,) {final _that = this;
switch (_that) {
case _AudioFeatures():
return $default(_that.id,_that.danceability,_that.energy,_that.valence,_that.acousticness,_that.instrumentalness,_that.speechiness,_that.liveness,_that.loudness,_that.tempo,_that.key,_that.timeSignature);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double danceability,  double energy,  double valence,  double acousticness,  double instrumentalness,  double speechiness,  double liveness,  double loudness,  int tempo,  int key,  int timeSignature)?  $default,) {final _that = this;
switch (_that) {
case _AudioFeatures() when $default != null:
return $default(_that.id,_that.danceability,_that.energy,_that.valence,_that.acousticness,_that.instrumentalness,_that.speechiness,_that.liveness,_that.loudness,_that.tempo,_that.key,_that.timeSignature);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioFeatures implements AudioFeatures {
  const _AudioFeatures({required this.id, required this.danceability, required this.energy, required this.valence, required this.acousticness, required this.instrumentalness, required this.speechiness, required this.liveness, required this.loudness, required this.tempo, required this.key, required this.timeSignature});
  factory _AudioFeatures.fromJson(Map<String, dynamic> json) => _$AudioFeaturesFromJson(json);

@override final  String id;
@override final  double danceability;
@override final  double energy;
@override final  double valence;
@override final  double acousticness;
@override final  double instrumentalness;
@override final  double speechiness;
@override final  double liveness;
@override final  double loudness;
@override final  int tempo;
@override final  int key;
@override final  int timeSignature;

/// Create a copy of AudioFeatures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioFeaturesCopyWith<_AudioFeatures> get copyWith => __$AudioFeaturesCopyWithImpl<_AudioFeatures>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioFeaturesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioFeatures&&(identical(other.id, id) || other.id == id)&&(identical(other.danceability, danceability) || other.danceability == danceability)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.valence, valence) || other.valence == valence)&&(identical(other.acousticness, acousticness) || other.acousticness == acousticness)&&(identical(other.instrumentalness, instrumentalness) || other.instrumentalness == instrumentalness)&&(identical(other.speechiness, speechiness) || other.speechiness == speechiness)&&(identical(other.liveness, liveness) || other.liveness == liveness)&&(identical(other.loudness, loudness) || other.loudness == loudness)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.key, key) || other.key == key)&&(identical(other.timeSignature, timeSignature) || other.timeSignature == timeSignature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,danceability,energy,valence,acousticness,instrumentalness,speechiness,liveness,loudness,tempo,key,timeSignature);

@override
String toString() {
  return 'AudioFeatures(id: $id, danceability: $danceability, energy: $energy, valence: $valence, acousticness: $acousticness, instrumentalness: $instrumentalness, speechiness: $speechiness, liveness: $liveness, loudness: $loudness, tempo: $tempo, key: $key, timeSignature: $timeSignature)';
}


}

/// @nodoc
abstract mixin class _$AudioFeaturesCopyWith<$Res> implements $AudioFeaturesCopyWith<$Res> {
  factory _$AudioFeaturesCopyWith(_AudioFeatures value, $Res Function(_AudioFeatures) _then) = __$AudioFeaturesCopyWithImpl;
@override @useResult
$Res call({
 String id, double danceability, double energy, double valence, double acousticness, double instrumentalness, double speechiness, double liveness, double loudness, int tempo, int key, int timeSignature
});




}
/// @nodoc
class __$AudioFeaturesCopyWithImpl<$Res>
    implements _$AudioFeaturesCopyWith<$Res> {
  __$AudioFeaturesCopyWithImpl(this._self, this._then);

  final _AudioFeatures _self;
  final $Res Function(_AudioFeatures) _then;

/// Create a copy of AudioFeatures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? danceability = null,Object? energy = null,Object? valence = null,Object? acousticness = null,Object? instrumentalness = null,Object? speechiness = null,Object? liveness = null,Object? loudness = null,Object? tempo = null,Object? key = null,Object? timeSignature = null,}) {
  return _then(_AudioFeatures(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,danceability: null == danceability ? _self.danceability : danceability // ignore: cast_nullable_to_non_nullable
as double,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as double,valence: null == valence ? _self.valence : valence // ignore: cast_nullable_to_non_nullable
as double,acousticness: null == acousticness ? _self.acousticness : acousticness // ignore: cast_nullable_to_non_nullable
as double,instrumentalness: null == instrumentalness ? _self.instrumentalness : instrumentalness // ignore: cast_nullable_to_non_nullable
as double,speechiness: null == speechiness ? _self.speechiness : speechiness // ignore: cast_nullable_to_non_nullable
as double,liveness: null == liveness ? _self.liveness : liveness // ignore: cast_nullable_to_non_nullable
as double,loudness: null == loudness ? _self.loudness : loudness // ignore: cast_nullable_to_non_nullable
as double,tempo: null == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as int,timeSignature: null == timeSignature ? _self.timeSignature : timeSignature // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
