// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recently_played.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecentlyPlayedItem {

 Track get track; DateTime get playedAt;
/// Create a copy of RecentlyPlayedItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentlyPlayedItemCopyWith<RecentlyPlayedItem> get copyWith => _$RecentlyPlayedItemCopyWithImpl<RecentlyPlayedItem>(this as RecentlyPlayedItem, _$identity);

  /// Serializes this RecentlyPlayedItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentlyPlayedItem&&(identical(other.track, track) || other.track == track)&&(identical(other.playedAt, playedAt) || other.playedAt == playedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,track,playedAt);

@override
String toString() {
  return 'RecentlyPlayedItem(track: $track, playedAt: $playedAt)';
}


}

/// @nodoc
abstract mixin class $RecentlyPlayedItemCopyWith<$Res>  {
  factory $RecentlyPlayedItemCopyWith(RecentlyPlayedItem value, $Res Function(RecentlyPlayedItem) _then) = _$RecentlyPlayedItemCopyWithImpl;
@useResult
$Res call({
 Track track, DateTime playedAt
});


$TrackCopyWith<$Res> get track;

}
/// @nodoc
class _$RecentlyPlayedItemCopyWithImpl<$Res>
    implements $RecentlyPlayedItemCopyWith<$Res> {
  _$RecentlyPlayedItemCopyWithImpl(this._self, this._then);

  final RecentlyPlayedItem _self;
  final $Res Function(RecentlyPlayedItem) _then;

/// Create a copy of RecentlyPlayedItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? track = null,Object? playedAt = null,}) {
  return _then(_self.copyWith(
track: null == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as Track,playedAt: null == playedAt ? _self.playedAt : playedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of RecentlyPlayedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackCopyWith<$Res> get track {
  
  return $TrackCopyWith<$Res>(_self.track, (value) {
    return _then(_self.copyWith(track: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecentlyPlayedItem].
extension RecentlyPlayedItemPatterns on RecentlyPlayedItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecentlyPlayedItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecentlyPlayedItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecentlyPlayedItem value)  $default,){
final _that = this;
switch (_that) {
case _RecentlyPlayedItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecentlyPlayedItem value)?  $default,){
final _that = this;
switch (_that) {
case _RecentlyPlayedItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Track track,  DateTime playedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecentlyPlayedItem() when $default != null:
return $default(_that.track,_that.playedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Track track,  DateTime playedAt)  $default,) {final _that = this;
switch (_that) {
case _RecentlyPlayedItem():
return $default(_that.track,_that.playedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Track track,  DateTime playedAt)?  $default,) {final _that = this;
switch (_that) {
case _RecentlyPlayedItem() when $default != null:
return $default(_that.track,_that.playedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecentlyPlayedItem implements RecentlyPlayedItem {
  const _RecentlyPlayedItem({required this.track, required this.playedAt});
  factory _RecentlyPlayedItem.fromJson(Map<String, dynamic> json) => _$RecentlyPlayedItemFromJson(json);

@override final  Track track;
@override final  DateTime playedAt;

/// Create a copy of RecentlyPlayedItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecentlyPlayedItemCopyWith<_RecentlyPlayedItem> get copyWith => __$RecentlyPlayedItemCopyWithImpl<_RecentlyPlayedItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecentlyPlayedItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecentlyPlayedItem&&(identical(other.track, track) || other.track == track)&&(identical(other.playedAt, playedAt) || other.playedAt == playedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,track,playedAt);

@override
String toString() {
  return 'RecentlyPlayedItem(track: $track, playedAt: $playedAt)';
}


}

/// @nodoc
abstract mixin class _$RecentlyPlayedItemCopyWith<$Res> implements $RecentlyPlayedItemCopyWith<$Res> {
  factory _$RecentlyPlayedItemCopyWith(_RecentlyPlayedItem value, $Res Function(_RecentlyPlayedItem) _then) = __$RecentlyPlayedItemCopyWithImpl;
@override @useResult
$Res call({
 Track track, DateTime playedAt
});


@override $TrackCopyWith<$Res> get track;

}
/// @nodoc
class __$RecentlyPlayedItemCopyWithImpl<$Res>
    implements _$RecentlyPlayedItemCopyWith<$Res> {
  __$RecentlyPlayedItemCopyWithImpl(this._self, this._then);

  final _RecentlyPlayedItem _self;
  final $Res Function(_RecentlyPlayedItem) _then;

/// Create a copy of RecentlyPlayedItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? track = null,Object? playedAt = null,}) {
  return _then(_RecentlyPlayedItem(
track: null == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as Track,playedAt: null == playedAt ? _self.playedAt : playedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of RecentlyPlayedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackCopyWith<$Res> get track {
  
  return $TrackCopyWith<$Res>(_self.track, (value) {
    return _then(_self.copyWith(track: value));
  });
}
}

// dart format on
