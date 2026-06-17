// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ColorDataModel {

 List<ColorModel>? get colors; String? get syncDateTime;
/// Create a copy of ColorDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorDataModelCopyWith<ColorDataModel> get copyWith => _$ColorDataModelCopyWithImpl<ColorDataModel>(this as ColorDataModel, _$identity);

  /// Serializes this ColorDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorDataModel&&const DeepCollectionEquality().equals(other.colors, colors)&&(identical(other.syncDateTime, syncDateTime) || other.syncDateTime == syncDateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(colors),syncDateTime);

@override
String toString() {
  return 'ColorDataModel(colors: $colors, syncDateTime: $syncDateTime)';
}


}

/// @nodoc
abstract mixin class $ColorDataModelCopyWith<$Res>  {
  factory $ColorDataModelCopyWith(ColorDataModel value, $Res Function(ColorDataModel) _then) = _$ColorDataModelCopyWithImpl;
@useResult
$Res call({
 List<ColorModel>? colors, String? syncDateTime
});




}
/// @nodoc
class _$ColorDataModelCopyWithImpl<$Res>
    implements $ColorDataModelCopyWith<$Res> {
  _$ColorDataModelCopyWithImpl(this._self, this._then);

  final ColorDataModel _self;
  final $Res Function(ColorDataModel) _then;

/// Create a copy of ColorDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? colors = freezed,Object? syncDateTime = freezed,}) {
  return _then(_self.copyWith(
colors: freezed == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as List<ColorModel>?,syncDateTime: freezed == syncDateTime ? _self.syncDateTime : syncDateTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorDataModel].
extension ColorDataModelPatterns on ColorDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColorDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColorDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColorDataModel value)  $default,){
final _that = this;
switch (_that) {
case _ColorDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColorDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _ColorDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ColorModel>? colors,  String? syncDateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorDataModel() when $default != null:
return $default(_that.colors,_that.syncDateTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ColorModel>? colors,  String? syncDateTime)  $default,) {final _that = this;
switch (_that) {
case _ColorDataModel():
return $default(_that.colors,_that.syncDateTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ColorModel>? colors,  String? syncDateTime)?  $default,) {final _that = this;
switch (_that) {
case _ColorDataModel() when $default != null:
return $default(_that.colors,_that.syncDateTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColorDataModel implements ColorDataModel {
  const _ColorDataModel({final  List<ColorModel>? colors, this.syncDateTime}): _colors = colors;
  factory _ColorDataModel.fromJson(Map<String, dynamic> json) => _$ColorDataModelFromJson(json);

 final  List<ColorModel>? _colors;
@override List<ColorModel>? get colors {
  final value = _colors;
  if (value == null) return null;
  if (_colors is EqualUnmodifiableListView) return _colors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? syncDateTime;

/// Create a copy of ColorDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorDataModelCopyWith<_ColorDataModel> get copyWith => __$ColorDataModelCopyWithImpl<_ColorDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColorDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorDataModel&&const DeepCollectionEquality().equals(other._colors, _colors)&&(identical(other.syncDateTime, syncDateTime) || other.syncDateTime == syncDateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_colors),syncDateTime);

@override
String toString() {
  return 'ColorDataModel(colors: $colors, syncDateTime: $syncDateTime)';
}


}

/// @nodoc
abstract mixin class _$ColorDataModelCopyWith<$Res> implements $ColorDataModelCopyWith<$Res> {
  factory _$ColorDataModelCopyWith(_ColorDataModel value, $Res Function(_ColorDataModel) _then) = __$ColorDataModelCopyWithImpl;
@override @useResult
$Res call({
 List<ColorModel>? colors, String? syncDateTime
});




}
/// @nodoc
class __$ColorDataModelCopyWithImpl<$Res>
    implements _$ColorDataModelCopyWith<$Res> {
  __$ColorDataModelCopyWithImpl(this._self, this._then);

  final _ColorDataModel _self;
  final $Res Function(_ColorDataModel) _then;

/// Create a copy of ColorDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? colors = freezed,Object? syncDateTime = freezed,}) {
  return _then(_ColorDataModel(
colors: freezed == colors ? _self._colors : colors // ignore: cast_nullable_to_non_nullable
as List<ColorModel>?,syncDateTime: freezed == syncDateTime ? _self.syncDateTime : syncDateTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
