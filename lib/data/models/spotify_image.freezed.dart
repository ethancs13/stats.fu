// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spotify_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpotifyImage {

 String get url; int? get width; int? get height;
/// Create a copy of SpotifyImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpotifyImageCopyWith<SpotifyImage> get copyWith => _$SpotifyImageCopyWithImpl<SpotifyImage>(this as SpotifyImage, _$identity);

  /// Serializes this SpotifyImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpotifyImage&&(identical(other.url, url) || other.url == url)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,width,height);

@override
String toString() {
  return 'SpotifyImage(url: $url, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $SpotifyImageCopyWith<$Res>  {
  factory $SpotifyImageCopyWith(SpotifyImage value, $Res Function(SpotifyImage) _then) = _$SpotifyImageCopyWithImpl;
@useResult
$Res call({
 String url, int? width, int? height
});




}
/// @nodoc
class _$SpotifyImageCopyWithImpl<$Res>
    implements $SpotifyImageCopyWith<$Res> {
  _$SpotifyImageCopyWithImpl(this._self, this._then);

  final SpotifyImage _self;
  final $Res Function(SpotifyImage) _then;

/// Create a copy of SpotifyImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? width = freezed,Object? height = freezed,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SpotifyImage].
extension SpotifyImagePatterns on SpotifyImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpotifyImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpotifyImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpotifyImage value)  $default,){
final _that = this;
switch (_that) {
case _SpotifyImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpotifyImage value)?  $default,){
final _that = this;
switch (_that) {
case _SpotifyImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  int? width,  int? height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpotifyImage() when $default != null:
return $default(_that.url,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  int? width,  int? height)  $default,) {final _that = this;
switch (_that) {
case _SpotifyImage():
return $default(_that.url,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  int? width,  int? height)?  $default,) {final _that = this;
switch (_that) {
case _SpotifyImage() when $default != null:
return $default(_that.url,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpotifyImage implements SpotifyImage {
  const _SpotifyImage({required this.url, this.width, this.height});
  factory _SpotifyImage.fromJson(Map<String, dynamic> json) => _$SpotifyImageFromJson(json);

@override final  String url;
@override final  int? width;
@override final  int? height;

/// Create a copy of SpotifyImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpotifyImageCopyWith<_SpotifyImage> get copyWith => __$SpotifyImageCopyWithImpl<_SpotifyImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpotifyImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpotifyImage&&(identical(other.url, url) || other.url == url)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,width,height);

@override
String toString() {
  return 'SpotifyImage(url: $url, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$SpotifyImageCopyWith<$Res> implements $SpotifyImageCopyWith<$Res> {
  factory _$SpotifyImageCopyWith(_SpotifyImage value, $Res Function(_SpotifyImage) _then) = __$SpotifyImageCopyWithImpl;
@override @useResult
$Res call({
 String url, int? width, int? height
});




}
/// @nodoc
class __$SpotifyImageCopyWithImpl<$Res>
    implements _$SpotifyImageCopyWith<$Res> {
  __$SpotifyImageCopyWithImpl(this._self, this._then);

  final _SpotifyImage _self;
  final $Res Function(_SpotifyImage) _then;

/// Create a copy of SpotifyImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? width = freezed,Object? height = freezed,}) {
  return _then(_SpotifyImage(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
