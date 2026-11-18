// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Artist {

 String get id; String get name; List<String> get genres; List<SpotifyImage> get images; int? get popularity; int? get followersTotal; String? get externalUrl;
/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistCopyWith<Artist> get copyWith => _$ArtistCopyWithImpl<Artist>(this as Artist, _$identity);

  /// Serializes this Artist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Artist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.followersTotal, followersTotal) || other.followersTotal == followersTotal)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(images),popularity,followersTotal,externalUrl);

@override
String toString() {
  return 'Artist(id: $id, name: $name, genres: $genres, images: $images, popularity: $popularity, followersTotal: $followersTotal, externalUrl: $externalUrl)';
}


}

/// @nodoc
abstract mixin class $ArtistCopyWith<$Res>  {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) _then) = _$ArtistCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<String> genres, List<SpotifyImage> images, int? popularity, int? followersTotal, String? externalUrl
});




}
/// @nodoc
class _$ArtistCopyWithImpl<$Res>
    implements $ArtistCopyWith<$Res> {
  _$ArtistCopyWithImpl(this._self, this._then);

  final Artist _self;
  final $Res Function(Artist) _then;

/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? genres = null,Object? images = null,Object? popularity = freezed,Object? followersTotal = freezed,Object? externalUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<SpotifyImage>,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,followersTotal: freezed == followersTotal ? _self.followersTotal : followersTotal // ignore: cast_nullable_to_non_nullable
as int?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Artist].
extension ArtistPatterns on Artist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Artist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Artist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Artist value)  $default,){
final _that = this;
switch (_that) {
case _Artist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Artist value)?  $default,){
final _that = this;
switch (_that) {
case _Artist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<String> genres,  List<SpotifyImage> images,  int? popularity,  int? followersTotal,  String? externalUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Artist() when $default != null:
return $default(_that.id,_that.name,_that.genres,_that.images,_that.popularity,_that.followersTotal,_that.externalUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<String> genres,  List<SpotifyImage> images,  int? popularity,  int? followersTotal,  String? externalUrl)  $default,) {final _that = this;
switch (_that) {
case _Artist():
return $default(_that.id,_that.name,_that.genres,_that.images,_that.popularity,_that.followersTotal,_that.externalUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<String> genres,  List<SpotifyImage> images,  int? popularity,  int? followersTotal,  String? externalUrl)?  $default,) {final _that = this;
switch (_that) {
case _Artist() when $default != null:
return $default(_that.id,_that.name,_that.genres,_that.images,_that.popularity,_that.followersTotal,_that.externalUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Artist implements Artist {
  const _Artist({required this.id, required this.name, final  List<String> genres = const [], final  List<SpotifyImage> images = const [], this.popularity, this.followersTotal, this.externalUrl}): _genres = genres,_images = images;
  factory _Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

@override final  String id;
@override final  String name;
 final  List<String> _genres;
@override@JsonKey() List<String> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<SpotifyImage> _images;
@override@JsonKey() List<SpotifyImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  int? popularity;
@override final  int? followersTotal;
@override final  String? externalUrl;

/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtistCopyWith<_Artist> get copyWith => __$ArtistCopyWithImpl<_Artist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArtistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Artist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.followersTotal, followersTotal) || other.followersTotal == followersTotal)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_images),popularity,followersTotal,externalUrl);

@override
String toString() {
  return 'Artist(id: $id, name: $name, genres: $genres, images: $images, popularity: $popularity, followersTotal: $followersTotal, externalUrl: $externalUrl)';
}


}

/// @nodoc
abstract mixin class _$ArtistCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$ArtistCopyWith(_Artist value, $Res Function(_Artist) _then) = __$ArtistCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<String> genres, List<SpotifyImage> images, int? popularity, int? followersTotal, String? externalUrl
});




}
/// @nodoc
class __$ArtistCopyWithImpl<$Res>
    implements _$ArtistCopyWith<$Res> {
  __$ArtistCopyWithImpl(this._self, this._then);

  final _Artist _self;
  final $Res Function(_Artist) _then;

/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? genres = null,Object? images = null,Object? popularity = freezed,Object? followersTotal = freezed,Object? externalUrl = freezed,}) {
  return _then(_Artist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<SpotifyImage>,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,followersTotal: freezed == followersTotal ? _self.followersTotal : followersTotal // ignore: cast_nullable_to_non_nullable
as int?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ArtistWithStats {

 Artist get artist; int get rank; int? get streamCount; int? get msPlayed; int? get appearsInRecentCount;
/// Create a copy of ArtistWithStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistWithStatsCopyWith<ArtistWithStats> get copyWith => _$ArtistWithStatsCopyWithImpl<ArtistWithStats>(this as ArtistWithStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtistWithStats&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.streamCount, streamCount) || other.streamCount == streamCount)&&(identical(other.msPlayed, msPlayed) || other.msPlayed == msPlayed)&&(identical(other.appearsInRecentCount, appearsInRecentCount) || other.appearsInRecentCount == appearsInRecentCount));
}


@override
int get hashCode => Object.hash(runtimeType,artist,rank,streamCount,msPlayed,appearsInRecentCount);

@override
String toString() {
  return 'ArtistWithStats(artist: $artist, rank: $rank, streamCount: $streamCount, msPlayed: $msPlayed, appearsInRecentCount: $appearsInRecentCount)';
}


}

/// @nodoc
abstract mixin class $ArtistWithStatsCopyWith<$Res>  {
  factory $ArtistWithStatsCopyWith(ArtistWithStats value, $Res Function(ArtistWithStats) _then) = _$ArtistWithStatsCopyWithImpl;
@useResult
$Res call({
 Artist artist, int rank, int? streamCount, int? msPlayed, int? appearsInRecentCount
});


$ArtistCopyWith<$Res> get artist;

}
/// @nodoc
class _$ArtistWithStatsCopyWithImpl<$Res>
    implements $ArtistWithStatsCopyWith<$Res> {
  _$ArtistWithStatsCopyWithImpl(this._self, this._then);

  final ArtistWithStats _self;
  final $Res Function(ArtistWithStats) _then;

/// Create a copy of ArtistWithStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? artist = null,Object? rank = null,Object? streamCount = freezed,Object? msPlayed = freezed,Object? appearsInRecentCount = freezed,}) {
  return _then(_self.copyWith(
artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as Artist,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,streamCount: freezed == streamCount ? _self.streamCount : streamCount // ignore: cast_nullable_to_non_nullable
as int?,msPlayed: freezed == msPlayed ? _self.msPlayed : msPlayed // ignore: cast_nullable_to_non_nullable
as int?,appearsInRecentCount: freezed == appearsInRecentCount ? _self.appearsInRecentCount : appearsInRecentCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ArtistWithStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArtistCopyWith<$Res> get artist {
  
  return $ArtistCopyWith<$Res>(_self.artist, (value) {
    return _then(_self.copyWith(artist: value));
  });
}
}


/// Adds pattern-matching-related methods to [ArtistWithStats].
extension ArtistWithStatsPatterns on ArtistWithStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArtistWithStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArtistWithStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArtistWithStats value)  $default,){
final _that = this;
switch (_that) {
case _ArtistWithStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArtistWithStats value)?  $default,){
final _that = this;
switch (_that) {
case _ArtistWithStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Artist artist,  int rank,  int? streamCount,  int? msPlayed,  int? appearsInRecentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArtistWithStats() when $default != null:
return $default(_that.artist,_that.rank,_that.streamCount,_that.msPlayed,_that.appearsInRecentCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Artist artist,  int rank,  int? streamCount,  int? msPlayed,  int? appearsInRecentCount)  $default,) {final _that = this;
switch (_that) {
case _ArtistWithStats():
return $default(_that.artist,_that.rank,_that.streamCount,_that.msPlayed,_that.appearsInRecentCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Artist artist,  int rank,  int? streamCount,  int? msPlayed,  int? appearsInRecentCount)?  $default,) {final _that = this;
switch (_that) {
case _ArtistWithStats() when $default != null:
return $default(_that.artist,_that.rank,_that.streamCount,_that.msPlayed,_that.appearsInRecentCount);case _:
  return null;

}
}

}

/// @nodoc


class _ArtistWithStats implements ArtistWithStats {
  const _ArtistWithStats({required this.artist, required this.rank, this.streamCount, this.msPlayed, this.appearsInRecentCount});
  

@override final  Artist artist;
@override final  int rank;
@override final  int? streamCount;
@override final  int? msPlayed;
@override final  int? appearsInRecentCount;

/// Create a copy of ArtistWithStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtistWithStatsCopyWith<_ArtistWithStats> get copyWith => __$ArtistWithStatsCopyWithImpl<_ArtistWithStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtistWithStats&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.streamCount, streamCount) || other.streamCount == streamCount)&&(identical(other.msPlayed, msPlayed) || other.msPlayed == msPlayed)&&(identical(other.appearsInRecentCount, appearsInRecentCount) || other.appearsInRecentCount == appearsInRecentCount));
}


@override
int get hashCode => Object.hash(runtimeType,artist,rank,streamCount,msPlayed,appearsInRecentCount);

@override
String toString() {
  return 'ArtistWithStats(artist: $artist, rank: $rank, streamCount: $streamCount, msPlayed: $msPlayed, appearsInRecentCount: $appearsInRecentCount)';
}


}

/// @nodoc
abstract mixin class _$ArtistWithStatsCopyWith<$Res> implements $ArtistWithStatsCopyWith<$Res> {
  factory _$ArtistWithStatsCopyWith(_ArtistWithStats value, $Res Function(_ArtistWithStats) _then) = __$ArtistWithStatsCopyWithImpl;
@override @useResult
$Res call({
 Artist artist, int rank, int? streamCount, int? msPlayed, int? appearsInRecentCount
});


@override $ArtistCopyWith<$Res> get artist;

}
/// @nodoc
class __$ArtistWithStatsCopyWithImpl<$Res>
    implements _$ArtistWithStatsCopyWith<$Res> {
  __$ArtistWithStatsCopyWithImpl(this._self, this._then);

  final _ArtistWithStats _self;
  final $Res Function(_ArtistWithStats) _then;

/// Create a copy of ArtistWithStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? artist = null,Object? rank = null,Object? streamCount = freezed,Object? msPlayed = freezed,Object? appearsInRecentCount = freezed,}) {
  return _then(_ArtistWithStats(
artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as Artist,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,streamCount: freezed == streamCount ? _self.streamCount : streamCount // ignore: cast_nullable_to_non_nullable
as int?,msPlayed: freezed == msPlayed ? _self.msPlayed : msPlayed // ignore: cast_nullable_to_non_nullable
as int?,appearsInRecentCount: freezed == appearsInRecentCount ? _self.appearsInRecentCount : appearsInRecentCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ArtistWithStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArtistCopyWith<$Res> get artist {
  
  return $ArtistCopyWith<$Res>(_self.artist, (value) {
    return _then(_self.copyWith(artist: value));
  });
}
}

// dart format on
