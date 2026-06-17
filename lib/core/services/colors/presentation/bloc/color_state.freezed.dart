// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ColorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ColorModel> colors) loaded,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ColorModel> colors)? loaded,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ColorModel> colors)? loaded,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorInitial value) initial,
    required TResult Function(ColorLoading value) loading,
    required TResult Function(ColorLoaded value) loaded,
    required TResult Function(ColorError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorInitial value)? initial,
    TResult? Function(ColorLoading value)? loading,
    TResult? Function(ColorLoaded value)? loaded,
    TResult? Function(ColorError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorInitial value)? initial,
    TResult Function(ColorLoading value)? loading,
    TResult Function(ColorLoaded value)? loaded,
    TResult Function(ColorError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorStateCopyWith<$Res> {
  factory $ColorStateCopyWith(
          ColorState value, $Res Function(ColorState) then) =
      _$ColorStateCopyWithImpl<$Res, ColorState>;
}

/// @nodoc
class _$ColorStateCopyWithImpl<$Res, $Val extends ColorState>
    implements $ColorStateCopyWith<$Res> {
  _$ColorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ColorInitialImplCopyWith<$Res> {
  factory _$$ColorInitialImplCopyWith(
          _$ColorInitialImpl value, $Res Function(_$ColorInitialImpl) then) =
      __$$ColorInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ColorInitialImplCopyWithImpl<$Res>
    extends _$ColorStateCopyWithImpl<$Res, _$ColorInitialImpl>
    implements _$$ColorInitialImplCopyWith<$Res> {
  __$$ColorInitialImplCopyWithImpl(
      _$ColorInitialImpl _value, $Res Function(_$ColorInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ColorInitialImpl implements ColorInitial {
  const _$ColorInitialImpl();

  @override
  String toString() {
    return 'ColorState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ColorInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ColorModel> colors) loaded,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ColorModel> colors)? loaded,
    TResult? Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ColorModel> colors)? loaded,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorInitial value) initial,
    required TResult Function(ColorLoading value) loading,
    required TResult Function(ColorLoaded value) loaded,
    required TResult Function(ColorError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorInitial value)? initial,
    TResult? Function(ColorLoading value)? loading,
    TResult? Function(ColorLoaded value)? loaded,
    TResult? Function(ColorError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorInitial value)? initial,
    TResult Function(ColorLoading value)? loading,
    TResult Function(ColorLoaded value)? loaded,
    TResult Function(ColorError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ColorInitial implements ColorState {
  const factory ColorInitial() = _$ColorInitialImpl;
}

/// @nodoc
abstract class _$$ColorLoadingImplCopyWith<$Res> {
  factory _$$ColorLoadingImplCopyWith(
          _$ColorLoadingImpl value, $Res Function(_$ColorLoadingImpl) then) =
      __$$ColorLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ColorLoadingImplCopyWithImpl<$Res>
    extends _$ColorStateCopyWithImpl<$Res, _$ColorLoadingImpl>
    implements _$$ColorLoadingImplCopyWith<$Res> {
  __$$ColorLoadingImplCopyWithImpl(
      _$ColorLoadingImpl _value, $Res Function(_$ColorLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ColorLoadingImpl implements ColorLoading {
  const _$ColorLoadingImpl();

  @override
  String toString() {
    return 'ColorState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ColorLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ColorModel> colors) loaded,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ColorModel> colors)? loaded,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ColorModel> colors)? loaded,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorInitial value) initial,
    required TResult Function(ColorLoading value) loading,
    required TResult Function(ColorLoaded value) loaded,
    required TResult Function(ColorError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorInitial value)? initial,
    TResult? Function(ColorLoading value)? loading,
    TResult? Function(ColorLoaded value)? loaded,
    TResult? Function(ColorError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorInitial value)? initial,
    TResult Function(ColorLoading value)? loading,
    TResult Function(ColorLoaded value)? loaded,
    TResult Function(ColorError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ColorLoading implements ColorState {
  const factory ColorLoading() = _$ColorLoadingImpl;
}

/// @nodoc
abstract class _$$ColorLoadedImplCopyWith<$Res> {
  factory _$$ColorLoadedImplCopyWith(
          _$ColorLoadedImpl value, $Res Function(_$ColorLoadedImpl) then) =
      __$$ColorLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ColorModel> colors});
}

/// @nodoc
class __$$ColorLoadedImplCopyWithImpl<$Res>
    extends _$ColorStateCopyWithImpl<$Res, _$ColorLoadedImpl>
    implements _$$ColorLoadedImplCopyWith<$Res> {
  __$$ColorLoadedImplCopyWithImpl(
      _$ColorLoadedImpl _value, $Res Function(_$ColorLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = null,
  }) {
    return _then(_$ColorLoadedImpl(
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ColorModel>,
    ));
  }
}

/// @nodoc

class _$ColorLoadedImpl implements ColorLoaded {
  const _$ColorLoadedImpl({required final List<ColorModel> colors})
      : _colors = colors;

  final List<ColorModel> _colors;
  @override
  List<ColorModel> get colors {
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  String toString() {
    return 'ColorState.loaded(colors: $colors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorLoadedImpl &&
            const DeepCollectionEquality().equals(other._colors, _colors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_colors));

  /// Create a copy of ColorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorLoadedImplCopyWith<_$ColorLoadedImpl> get copyWith =>
      __$$ColorLoadedImplCopyWithImpl<_$ColorLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ColorModel> colors) loaded,
    required TResult Function(String? message) error,
  }) {
    return loaded(colors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ColorModel> colors)? loaded,
    TResult? Function(String? message)? error,
  }) {
    return loaded?.call(colors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ColorModel> colors)? loaded,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(colors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorInitial value) initial,
    required TResult Function(ColorLoading value) loading,
    required TResult Function(ColorLoaded value) loaded,
    required TResult Function(ColorError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorInitial value)? initial,
    TResult? Function(ColorLoading value)? loading,
    TResult? Function(ColorLoaded value)? loaded,
    TResult? Function(ColorError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorInitial value)? initial,
    TResult Function(ColorLoading value)? loading,
    TResult Function(ColorLoaded value)? loaded,
    TResult Function(ColorError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ColorLoaded implements ColorState {
  const factory ColorLoaded({required final List<ColorModel> colors}) =
      _$ColorLoadedImpl;

  List<ColorModel> get colors;

  /// Create a copy of ColorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorLoadedImplCopyWith<_$ColorLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ColorErrorImplCopyWith<$Res> {
  factory _$$ColorErrorImplCopyWith(
          _$ColorErrorImpl value, $Res Function(_$ColorErrorImpl) then) =
      __$$ColorErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ColorErrorImplCopyWithImpl<$Res>
    extends _$ColorStateCopyWithImpl<$Res, _$ColorErrorImpl>
    implements _$$ColorErrorImplCopyWith<$Res> {
  __$$ColorErrorImplCopyWithImpl(
      _$ColorErrorImpl _value, $Res Function(_$ColorErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ColorErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ColorErrorImpl implements ColorError {
  const _$ColorErrorImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'ColorState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ColorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorErrorImplCopyWith<_$ColorErrorImpl> get copyWith =>
      __$$ColorErrorImplCopyWithImpl<_$ColorErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ColorModel> colors) loaded,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ColorModel> colors)? loaded,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ColorModel> colors)? loaded,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorInitial value) initial,
    required TResult Function(ColorLoading value) loading,
    required TResult Function(ColorLoaded value) loaded,
    required TResult Function(ColorError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorInitial value)? initial,
    TResult? Function(ColorLoading value)? loading,
    TResult? Function(ColorLoaded value)? loaded,
    TResult? Function(ColorError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorInitial value)? initial,
    TResult Function(ColorLoading value)? loading,
    TResult Function(ColorLoaded value)? loaded,
    TResult Function(ColorError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ColorError implements ColorState {
  const factory ColorError({final String? message}) = _$ColorErrorImpl;

  String? get message;

  /// Create a copy of ColorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorErrorImplCopyWith<_$ColorErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
