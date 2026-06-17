// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ColorState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ColorState()';
}


}

/// @nodoc
class $ColorStateCopyWith<$Res>  {
$ColorStateCopyWith(ColorState _, $Res Function(ColorState) __);
}


/// Adds pattern-matching-related methods to [ColorState].
extension ColorStatePatterns on ColorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ColorInitial value)?  initial,TResult Function( ColorLoading value)?  loading,TResult Function( ColorLoaded value)?  loaded,TResult Function( ColorError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ColorInitial() when initial != null:
return initial(_that);case ColorLoading() when loading != null:
return loading(_that);case ColorLoaded() when loaded != null:
return loaded(_that);case ColorError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ColorInitial value)  initial,required TResult Function( ColorLoading value)  loading,required TResult Function( ColorLoaded value)  loaded,required TResult Function( ColorError value)  error,}){
final _that = this;
switch (_that) {
case ColorInitial():
return initial(_that);case ColorLoading():
return loading(_that);case ColorLoaded():
return loaded(_that);case ColorError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ColorInitial value)?  initial,TResult? Function( ColorLoading value)?  loading,TResult? Function( ColorLoaded value)?  loaded,TResult? Function( ColorError value)?  error,}){
final _that = this;
switch (_that) {
case ColorInitial() when initial != null:
return initial(_that);case ColorLoading() when loading != null:
return loading(_that);case ColorLoaded() when loaded != null:
return loaded(_that);case ColorError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ColorModel> colors)?  loaded,TResult Function( String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ColorInitial() when initial != null:
return initial();case ColorLoading() when loading != null:
return loading();case ColorLoaded() when loaded != null:
return loaded(_that.colors);case ColorError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ColorModel> colors)  loaded,required TResult Function( String? message)  error,}) {final _that = this;
switch (_that) {
case ColorInitial():
return initial();case ColorLoading():
return loading();case ColorLoaded():
return loaded(_that.colors);case ColorError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ColorModel> colors)?  loaded,TResult? Function( String? message)?  error,}) {final _that = this;
switch (_that) {
case ColorInitial() when initial != null:
return initial();case ColorLoading() when loading != null:
return loading();case ColorLoaded() when loaded != null:
return loaded(_that.colors);case ColorError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ColorInitial implements ColorState {
  const ColorInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ColorState.initial()';
}


}




/// @nodoc


class ColorLoading implements ColorState {
  const ColorLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ColorState.loading()';
}


}




/// @nodoc


class ColorLoaded implements ColorState {
  const ColorLoaded({required final  List<ColorModel> colors}): _colors = colors;
  

 final  List<ColorModel> _colors;
 List<ColorModel> get colors {
  if (_colors is EqualUnmodifiableListView) return _colors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colors);
}


/// Create a copy of ColorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorLoadedCopyWith<ColorLoaded> get copyWith => _$ColorLoadedCopyWithImpl<ColorLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorLoaded&&const DeepCollectionEquality().equals(other._colors, _colors));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_colors));

@override
String toString() {
  return 'ColorState.loaded(colors: $colors)';
}


}

/// @nodoc
abstract mixin class $ColorLoadedCopyWith<$Res> implements $ColorStateCopyWith<$Res> {
  factory $ColorLoadedCopyWith(ColorLoaded value, $Res Function(ColorLoaded) _then) = _$ColorLoadedCopyWithImpl;
@useResult
$Res call({
 List<ColorModel> colors
});




}
/// @nodoc
class _$ColorLoadedCopyWithImpl<$Res>
    implements $ColorLoadedCopyWith<$Res> {
  _$ColorLoadedCopyWithImpl(this._self, this._then);

  final ColorLoaded _self;
  final $Res Function(ColorLoaded) _then;

/// Create a copy of ColorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? colors = null,}) {
  return _then(ColorLoaded(
colors: null == colors ? _self._colors : colors // ignore: cast_nullable_to_non_nullable
as List<ColorModel>,
  ));
}


}

/// @nodoc


class ColorError implements ColorState {
  const ColorError({this.message});
  

 final  String? message;

/// Create a copy of ColorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorErrorCopyWith<ColorError> get copyWith => _$ColorErrorCopyWithImpl<ColorError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ColorState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ColorErrorCopyWith<$Res> implements $ColorStateCopyWith<$Res> {
  factory $ColorErrorCopyWith(ColorError value, $Res Function(ColorError) _then) = _$ColorErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ColorErrorCopyWithImpl<$Res>
    implements $ColorErrorCopyWith<$Res> {
  _$ColorErrorCopyWithImpl(this._self, this._then);

  final ColorError _self;
  final $Res Function(ColorError) _then;

/// Create a copy of ColorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(ColorError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
