// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) setThemeMode,
    required TResult Function() loadThemeMode,
    required TResult Function(FontScale scale) setFontScale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeMode themeMode)? setThemeMode,
    TResult? Function()? loadThemeMode,
    TResult? Function(FontScale scale)? setFontScale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? setThemeMode,
    TResult Function()? loadThemeMode,
    TResult Function(FontScale scale)? setFontScale,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetThemeModeEvt value) setThemeMode,
    required TResult Function(LoadThemeModeEvt value) loadThemeMode,
    required TResult Function(SetFontScaleEvt value) setFontScale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetThemeModeEvt value)? setThemeMode,
    TResult? Function(LoadThemeModeEvt value)? loadThemeMode,
    TResult? Function(SetFontScaleEvt value)? setFontScale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetThemeModeEvt value)? setThemeMode,
    TResult Function(LoadThemeModeEvt value)? loadThemeMode,
    TResult Function(SetFontScaleEvt value)? setFontScale,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res, ThemeEvent>;
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res, $Val extends ThemeEvent>
    implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SetThemeModeEvtImplCopyWith<$Res> {
  factory _$$SetThemeModeEvtImplCopyWith(_$SetThemeModeEvtImpl value,
          $Res Function(_$SetThemeModeEvtImpl) then) =
      __$$SetThemeModeEvtImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$SetThemeModeEvtImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$SetThemeModeEvtImpl>
    implements _$$SetThemeModeEvtImplCopyWith<$Res> {
  __$$SetThemeModeEvtImplCopyWithImpl(
      _$SetThemeModeEvtImpl _value, $Res Function(_$SetThemeModeEvtImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$SetThemeModeEvtImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$SetThemeModeEvtImpl implements SetThemeModeEvt {
  const _$SetThemeModeEvtImpl({required this.themeMode});

  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'ThemeEvent.setThemeMode(themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetThemeModeEvtImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetThemeModeEvtImplCopyWith<_$SetThemeModeEvtImpl> get copyWith =>
      __$$SetThemeModeEvtImplCopyWithImpl<_$SetThemeModeEvtImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) setThemeMode,
    required TResult Function() loadThemeMode,
    required TResult Function(FontScale scale) setFontScale,
  }) {
    return setThemeMode(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeMode themeMode)? setThemeMode,
    TResult? Function()? loadThemeMode,
    TResult? Function(FontScale scale)? setFontScale,
  }) {
    return setThemeMode?.call(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? setThemeMode,
    TResult Function()? loadThemeMode,
    TResult Function(FontScale scale)? setFontScale,
    required TResult orElse(),
  }) {
    if (setThemeMode != null) {
      return setThemeMode(themeMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetThemeModeEvt value) setThemeMode,
    required TResult Function(LoadThemeModeEvt value) loadThemeMode,
    required TResult Function(SetFontScaleEvt value) setFontScale,
  }) {
    return setThemeMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetThemeModeEvt value)? setThemeMode,
    TResult? Function(LoadThemeModeEvt value)? loadThemeMode,
    TResult? Function(SetFontScaleEvt value)? setFontScale,
  }) {
    return setThemeMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetThemeModeEvt value)? setThemeMode,
    TResult Function(LoadThemeModeEvt value)? loadThemeMode,
    TResult Function(SetFontScaleEvt value)? setFontScale,
    required TResult orElse(),
  }) {
    if (setThemeMode != null) {
      return setThemeMode(this);
    }
    return orElse();
  }
}

abstract class SetThemeModeEvt implements ThemeEvent {
  const factory SetThemeModeEvt({required final ThemeMode themeMode}) =
      _$SetThemeModeEvtImpl;

  ThemeMode get themeMode;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetThemeModeEvtImplCopyWith<_$SetThemeModeEvtImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadThemeModeEvtImplCopyWith<$Res> {
  factory _$$LoadThemeModeEvtImplCopyWith(_$LoadThemeModeEvtImpl value,
          $Res Function(_$LoadThemeModeEvtImpl) then) =
      __$$LoadThemeModeEvtImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadThemeModeEvtImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$LoadThemeModeEvtImpl>
    implements _$$LoadThemeModeEvtImplCopyWith<$Res> {
  __$$LoadThemeModeEvtImplCopyWithImpl(_$LoadThemeModeEvtImpl _value,
      $Res Function(_$LoadThemeModeEvtImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadThemeModeEvtImpl implements LoadThemeModeEvt {
  const _$LoadThemeModeEvtImpl();

  @override
  String toString() {
    return 'ThemeEvent.loadThemeMode()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadThemeModeEvtImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) setThemeMode,
    required TResult Function() loadThemeMode,
    required TResult Function(FontScale scale) setFontScale,
  }) {
    return loadThemeMode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeMode themeMode)? setThemeMode,
    TResult? Function()? loadThemeMode,
    TResult? Function(FontScale scale)? setFontScale,
  }) {
    return loadThemeMode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? setThemeMode,
    TResult Function()? loadThemeMode,
    TResult Function(FontScale scale)? setFontScale,
    required TResult orElse(),
  }) {
    if (loadThemeMode != null) {
      return loadThemeMode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetThemeModeEvt value) setThemeMode,
    required TResult Function(LoadThemeModeEvt value) loadThemeMode,
    required TResult Function(SetFontScaleEvt value) setFontScale,
  }) {
    return loadThemeMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetThemeModeEvt value)? setThemeMode,
    TResult? Function(LoadThemeModeEvt value)? loadThemeMode,
    TResult? Function(SetFontScaleEvt value)? setFontScale,
  }) {
    return loadThemeMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetThemeModeEvt value)? setThemeMode,
    TResult Function(LoadThemeModeEvt value)? loadThemeMode,
    TResult Function(SetFontScaleEvt value)? setFontScale,
    required TResult orElse(),
  }) {
    if (loadThemeMode != null) {
      return loadThemeMode(this);
    }
    return orElse();
  }
}

abstract class LoadThemeModeEvt implements ThemeEvent {
  const factory LoadThemeModeEvt() = _$LoadThemeModeEvtImpl;
}

/// @nodoc
abstract class _$$SetFontScaleEvtImplCopyWith<$Res> {
  factory _$$SetFontScaleEvtImplCopyWith(_$SetFontScaleEvtImpl value,
          $Res Function(_$SetFontScaleEvtImpl) then) =
      __$$SetFontScaleEvtImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FontScale scale});
}

/// @nodoc
class __$$SetFontScaleEvtImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$SetFontScaleEvtImpl>
    implements _$$SetFontScaleEvtImplCopyWith<$Res> {
  __$$SetFontScaleEvtImplCopyWithImpl(
      _$SetFontScaleEvtImpl _value, $Res Function(_$SetFontScaleEvtImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scale = null,
  }) {
    return _then(_$SetFontScaleEvtImpl(
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as FontScale,
    ));
  }
}

/// @nodoc

class _$SetFontScaleEvtImpl implements SetFontScaleEvt {
  const _$SetFontScaleEvtImpl({required this.scale});

  @override
  final FontScale scale;

  @override
  String toString() {
    return 'ThemeEvent.setFontScale(scale: $scale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetFontScaleEvtImpl &&
            (identical(other.scale, scale) || other.scale == scale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scale);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetFontScaleEvtImplCopyWith<_$SetFontScaleEvtImpl> get copyWith =>
      __$$SetFontScaleEvtImplCopyWithImpl<_$SetFontScaleEvtImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) setThemeMode,
    required TResult Function() loadThemeMode,
    required TResult Function(FontScale scale) setFontScale,
  }) {
    return setFontScale(scale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeMode themeMode)? setThemeMode,
    TResult? Function()? loadThemeMode,
    TResult? Function(FontScale scale)? setFontScale,
  }) {
    return setFontScale?.call(scale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? setThemeMode,
    TResult Function()? loadThemeMode,
    TResult Function(FontScale scale)? setFontScale,
    required TResult orElse(),
  }) {
    if (setFontScale != null) {
      return setFontScale(scale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetThemeModeEvt value) setThemeMode,
    required TResult Function(LoadThemeModeEvt value) loadThemeMode,
    required TResult Function(SetFontScaleEvt value) setFontScale,
  }) {
    return setFontScale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetThemeModeEvt value)? setThemeMode,
    TResult? Function(LoadThemeModeEvt value)? loadThemeMode,
    TResult? Function(SetFontScaleEvt value)? setFontScale,
  }) {
    return setFontScale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetThemeModeEvt value)? setThemeMode,
    TResult Function(LoadThemeModeEvt value)? loadThemeMode,
    TResult Function(SetFontScaleEvt value)? setFontScale,
    required TResult orElse(),
  }) {
    if (setFontScale != null) {
      return setFontScale(this);
    }
    return orElse();
  }
}

abstract class SetFontScaleEvt implements ThemeEvent {
  const factory SetFontScaleEvt({required final FontScale scale}) =
      _$SetFontScaleEvtImpl;

  FontScale get scale;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetFontScaleEvtImplCopyWith<_$SetFontScaleEvtImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
