// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeEvent()';
}


}

/// @nodoc
class $ThemeEventCopyWith<$Res>  {
$ThemeEventCopyWith(ThemeEvent _, $Res Function(ThemeEvent) __);
}


/// Adds pattern-matching-related methods to [ThemeEvent].
extension ThemeEventPatterns on ThemeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SetThemeModeEvt value)?  setThemeMode,TResult Function( LoadThemeModeEvt value)?  loadThemeMode,TResult Function( SetFontScaleEvt value)?  setFontScale,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SetThemeModeEvt() when setThemeMode != null:
return setThemeMode(_that);case LoadThemeModeEvt() when loadThemeMode != null:
return loadThemeMode(_that);case SetFontScaleEvt() when setFontScale != null:
return setFontScale(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SetThemeModeEvt value)  setThemeMode,required TResult Function( LoadThemeModeEvt value)  loadThemeMode,required TResult Function( SetFontScaleEvt value)  setFontScale,}){
final _that = this;
switch (_that) {
case SetThemeModeEvt():
return setThemeMode(_that);case LoadThemeModeEvt():
return loadThemeMode(_that);case SetFontScaleEvt():
return setFontScale(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SetThemeModeEvt value)?  setThemeMode,TResult? Function( LoadThemeModeEvt value)?  loadThemeMode,TResult? Function( SetFontScaleEvt value)?  setFontScale,}){
final _that = this;
switch (_that) {
case SetThemeModeEvt() when setThemeMode != null:
return setThemeMode(_that);case LoadThemeModeEvt() when loadThemeMode != null:
return loadThemeMode(_that);case SetFontScaleEvt() when setFontScale != null:
return setFontScale(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ThemeMode themeMode)?  setThemeMode,TResult Function()?  loadThemeMode,TResult Function( FontScale scale)?  setFontScale,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SetThemeModeEvt() when setThemeMode != null:
return setThemeMode(_that.themeMode);case LoadThemeModeEvt() when loadThemeMode != null:
return loadThemeMode();case SetFontScaleEvt() when setFontScale != null:
return setFontScale(_that.scale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ThemeMode themeMode)  setThemeMode,required TResult Function()  loadThemeMode,required TResult Function( FontScale scale)  setFontScale,}) {final _that = this;
switch (_that) {
case SetThemeModeEvt():
return setThemeMode(_that.themeMode);case LoadThemeModeEvt():
return loadThemeMode();case SetFontScaleEvt():
return setFontScale(_that.scale);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ThemeMode themeMode)?  setThemeMode,TResult? Function()?  loadThemeMode,TResult? Function( FontScale scale)?  setFontScale,}) {final _that = this;
switch (_that) {
case SetThemeModeEvt() when setThemeMode != null:
return setThemeMode(_that.themeMode);case LoadThemeModeEvt() when loadThemeMode != null:
return loadThemeMode();case SetFontScaleEvt() when setFontScale != null:
return setFontScale(_that.scale);case _:
  return null;

}
}

}

/// @nodoc


class SetThemeModeEvt implements ThemeEvent {
  const SetThemeModeEvt({required this.themeMode});
  

 final  ThemeMode themeMode;

/// Create a copy of ThemeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetThemeModeEvtCopyWith<SetThemeModeEvt> get copyWith => _$SetThemeModeEvtCopyWithImpl<SetThemeModeEvt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetThemeModeEvt&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode);

@override
String toString() {
  return 'ThemeEvent.setThemeMode(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $SetThemeModeEvtCopyWith<$Res> implements $ThemeEventCopyWith<$Res> {
  factory $SetThemeModeEvtCopyWith(SetThemeModeEvt value, $Res Function(SetThemeModeEvt) _then) = _$SetThemeModeEvtCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode
});




}
/// @nodoc
class _$SetThemeModeEvtCopyWithImpl<$Res>
    implements $SetThemeModeEvtCopyWith<$Res> {
  _$SetThemeModeEvtCopyWithImpl(this._self, this._then);

  final SetThemeModeEvt _self;
  final $Res Function(SetThemeModeEvt) _then;

/// Create a copy of ThemeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? themeMode = null,}) {
  return _then(SetThemeModeEvt(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

/// @nodoc


class LoadThemeModeEvt implements ThemeEvent {
  const LoadThemeModeEvt();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadThemeModeEvt);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeEvent.loadThemeMode()';
}


}




/// @nodoc


class SetFontScaleEvt implements ThemeEvent {
  const SetFontScaleEvt({required this.scale});
  

 final  FontScale scale;

/// Create a copy of ThemeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetFontScaleEvtCopyWith<SetFontScaleEvt> get copyWith => _$SetFontScaleEvtCopyWithImpl<SetFontScaleEvt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetFontScaleEvt&&(identical(other.scale, scale) || other.scale == scale));
}


@override
int get hashCode => Object.hash(runtimeType,scale);

@override
String toString() {
  return 'ThemeEvent.setFontScale(scale: $scale)';
}


}

/// @nodoc
abstract mixin class $SetFontScaleEvtCopyWith<$Res> implements $ThemeEventCopyWith<$Res> {
  factory $SetFontScaleEvtCopyWith(SetFontScaleEvt value, $Res Function(SetFontScaleEvt) _then) = _$SetFontScaleEvtCopyWithImpl;
@useResult
$Res call({
 FontScale scale
});




}
/// @nodoc
class _$SetFontScaleEvtCopyWithImpl<$Res>
    implements $SetFontScaleEvtCopyWith<$Res> {
  _$SetFontScaleEvtCopyWithImpl(this._self, this._then);

  final SetFontScaleEvt _self;
  final $Res Function(SetFontScaleEvt) _then;

/// Create a copy of ThemeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scale = null,}) {
  return _then(SetFontScaleEvt(
scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as FontScale,
  ));
}


}

// dart format on
