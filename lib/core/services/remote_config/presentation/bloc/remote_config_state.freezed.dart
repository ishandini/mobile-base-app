// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RemoteConfigState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteConfigInitial value) initial,
    required TResult Function(RemoteConfigLoading value) loading,
    required TResult Function(RemoteConfigLoaded value) loaded,
    required TResult Function(RemoteConfigError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoteConfigInitial value)? initial,
    TResult? Function(RemoteConfigLoading value)? loading,
    TResult? Function(RemoteConfigLoaded value)? loaded,
    TResult? Function(RemoteConfigError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteConfigInitial value)? initial,
    TResult Function(RemoteConfigLoading value)? loading,
    TResult Function(RemoteConfigLoaded value)? loaded,
    TResult Function(RemoteConfigError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigStateCopyWith<$Res> {
  factory $RemoteConfigStateCopyWith(
          RemoteConfigState value, $Res Function(RemoteConfigState) then) =
      _$RemoteConfigStateCopyWithImpl<$Res, RemoteConfigState>;
}

/// @nodoc
class _$RemoteConfigStateCopyWithImpl<$Res, $Val extends RemoteConfigState>
    implements $RemoteConfigStateCopyWith<$Res> {
  _$RemoteConfigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteConfigState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RemoteConfigInitialImplCopyWith<$Res> {
  factory _$$RemoteConfigInitialImplCopyWith(_$RemoteConfigInitialImpl value,
          $Res Function(_$RemoteConfigInitialImpl) then) =
      __$$RemoteConfigInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoteConfigInitialImplCopyWithImpl<$Res>
    extends _$RemoteConfigStateCopyWithImpl<$Res, _$RemoteConfigInitialImpl>
    implements _$$RemoteConfigInitialImplCopyWith<$Res> {
  __$$RemoteConfigInitialImplCopyWithImpl(_$RemoteConfigInitialImpl _value,
      $Res Function(_$RemoteConfigInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteConfigState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RemoteConfigInitialImpl implements RemoteConfigInitial {
  const _$RemoteConfigInitialImpl();

  @override
  String toString() {
    return 'RemoteConfigState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
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
    required TResult Function(RemoteConfigInitial value) initial,
    required TResult Function(RemoteConfigLoading value) loading,
    required TResult Function(RemoteConfigLoaded value) loaded,
    required TResult Function(RemoteConfigError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoteConfigInitial value)? initial,
    TResult? Function(RemoteConfigLoading value)? loading,
    TResult? Function(RemoteConfigLoaded value)? loaded,
    TResult? Function(RemoteConfigError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteConfigInitial value)? initial,
    TResult Function(RemoteConfigLoading value)? loading,
    TResult Function(RemoteConfigLoaded value)? loaded,
    TResult Function(RemoteConfigError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RemoteConfigInitial implements RemoteConfigState {
  const factory RemoteConfigInitial() = _$RemoteConfigInitialImpl;
}

/// @nodoc
abstract class _$$RemoteConfigLoadingImplCopyWith<$Res> {
  factory _$$RemoteConfigLoadingImplCopyWith(_$RemoteConfigLoadingImpl value,
          $Res Function(_$RemoteConfigLoadingImpl) then) =
      __$$RemoteConfigLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoteConfigLoadingImplCopyWithImpl<$Res>
    extends _$RemoteConfigStateCopyWithImpl<$Res, _$RemoteConfigLoadingImpl>
    implements _$$RemoteConfigLoadingImplCopyWith<$Res> {
  __$$RemoteConfigLoadingImplCopyWithImpl(_$RemoteConfigLoadingImpl _value,
      $Res Function(_$RemoteConfigLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteConfigState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RemoteConfigLoadingImpl implements RemoteConfigLoading {
  const _$RemoteConfigLoadingImpl();

  @override
  String toString() {
    return 'RemoteConfigState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
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
    required TResult Function(RemoteConfigInitial value) initial,
    required TResult Function(RemoteConfigLoading value) loading,
    required TResult Function(RemoteConfigLoaded value) loaded,
    required TResult Function(RemoteConfigError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoteConfigInitial value)? initial,
    TResult? Function(RemoteConfigLoading value)? loading,
    TResult? Function(RemoteConfigLoaded value)? loaded,
    TResult? Function(RemoteConfigError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteConfigInitial value)? initial,
    TResult Function(RemoteConfigLoading value)? loading,
    TResult Function(RemoteConfigLoaded value)? loaded,
    TResult Function(RemoteConfigError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RemoteConfigLoading implements RemoteConfigState {
  const factory RemoteConfigLoading() = _$RemoteConfigLoadingImpl;
}

/// @nodoc
abstract class _$$RemoteConfigLoadedImplCopyWith<$Res> {
  factory _$$RemoteConfigLoadedImplCopyWith(_$RemoteConfigLoadedImpl value,
          $Res Function(_$RemoteConfigLoadedImpl) then) =
      __$$RemoteConfigLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoteConfigLoadedImplCopyWithImpl<$Res>
    extends _$RemoteConfigStateCopyWithImpl<$Res, _$RemoteConfigLoadedImpl>
    implements _$$RemoteConfigLoadedImplCopyWith<$Res> {
  __$$RemoteConfigLoadedImplCopyWithImpl(_$RemoteConfigLoadedImpl _value,
      $Res Function(_$RemoteConfigLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteConfigState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RemoteConfigLoadedImpl implements RemoteConfigLoaded {
  const _$RemoteConfigLoadedImpl();

  @override
  String toString() {
    return 'RemoteConfigState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RemoteConfigLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String? message) error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message)? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteConfigInitial value) initial,
    required TResult Function(RemoteConfigLoading value) loading,
    required TResult Function(RemoteConfigLoaded value) loaded,
    required TResult Function(RemoteConfigError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoteConfigInitial value)? initial,
    TResult? Function(RemoteConfigLoading value)? loading,
    TResult? Function(RemoteConfigLoaded value)? loaded,
    TResult? Function(RemoteConfigError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteConfigInitial value)? initial,
    TResult Function(RemoteConfigLoading value)? loading,
    TResult Function(RemoteConfigLoaded value)? loaded,
    TResult Function(RemoteConfigError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RemoteConfigLoaded implements RemoteConfigState {
  const factory RemoteConfigLoaded() = _$RemoteConfigLoadedImpl;
}

/// @nodoc
abstract class _$$RemoteConfigErrorImplCopyWith<$Res> {
  factory _$$RemoteConfigErrorImplCopyWith(_$RemoteConfigErrorImpl value,
          $Res Function(_$RemoteConfigErrorImpl) then) =
      __$$RemoteConfigErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$RemoteConfigErrorImplCopyWithImpl<$Res>
    extends _$RemoteConfigStateCopyWithImpl<$Res, _$RemoteConfigErrorImpl>
    implements _$$RemoteConfigErrorImplCopyWith<$Res> {
  __$$RemoteConfigErrorImplCopyWithImpl(_$RemoteConfigErrorImpl _value,
      $Res Function(_$RemoteConfigErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteConfigState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$RemoteConfigErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RemoteConfigErrorImpl implements RemoteConfigError {
  const _$RemoteConfigErrorImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'RemoteConfigState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RemoteConfigState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteConfigErrorImplCopyWith<_$RemoteConfigErrorImpl> get copyWith =>
      __$$RemoteConfigErrorImplCopyWithImpl<_$RemoteConfigErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
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
    required TResult Function(RemoteConfigInitial value) initial,
    required TResult Function(RemoteConfigLoading value) loading,
    required TResult Function(RemoteConfigLoaded value) loaded,
    required TResult Function(RemoteConfigError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoteConfigInitial value)? initial,
    TResult? Function(RemoteConfigLoading value)? loading,
    TResult? Function(RemoteConfigLoaded value)? loaded,
    TResult? Function(RemoteConfigError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteConfigInitial value)? initial,
    TResult Function(RemoteConfigLoading value)? loading,
    TResult Function(RemoteConfigLoaded value)? loaded,
    TResult Function(RemoteConfigError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RemoteConfigError implements RemoteConfigState {
  const factory RemoteConfigError({final String? message}) =
      _$RemoteConfigErrorImpl;

  String? get message;

  /// Create a copy of RemoteConfigState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteConfigErrorImplCopyWith<_$RemoteConfigErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
