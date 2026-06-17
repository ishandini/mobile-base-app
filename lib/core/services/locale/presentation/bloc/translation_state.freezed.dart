// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TranslationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String currentLanguageCode) languageLoaded,
    required TResult Function(String currentLanguageCode) languageChanged,
    required TResult Function(bool updated, String currentLanguageCode)
        syncSuccess,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String currentLanguageCode)? languageLoaded,
    TResult? Function(String currentLanguageCode)? languageChanged,
    TResult? Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String currentLanguageCode)? languageLoaded,
    TResult Function(String currentLanguageCode)? languageChanged,
    TResult Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranslationInitial value) initial,
    required TResult Function(TranslationLoading value) loading,
    required TResult Function(TranslationLanguageLoaded value) languageLoaded,
    required TResult Function(TranslationLanguageChanged value) languageChanged,
    required TResult Function(TranslationSyncSuccess value) syncSuccess,
    required TResult Function(TranslationError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranslationInitial value)? initial,
    TResult? Function(TranslationLoading value)? loading,
    TResult? Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult? Function(TranslationLanguageChanged value)? languageChanged,
    TResult? Function(TranslationSyncSuccess value)? syncSuccess,
    TResult? Function(TranslationError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranslationInitial value)? initial,
    TResult Function(TranslationLoading value)? loading,
    TResult Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult Function(TranslationLanguageChanged value)? languageChanged,
    TResult Function(TranslationSyncSuccess value)? syncSuccess,
    TResult Function(TranslationError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationStateCopyWith<$Res> {
  factory $TranslationStateCopyWith(
          TranslationState value, $Res Function(TranslationState) then) =
      _$TranslationStateCopyWithImpl<$Res, TranslationState>;
}

/// @nodoc
class _$TranslationStateCopyWithImpl<$Res, $Val extends TranslationState>
    implements $TranslationStateCopyWith<$Res> {
  _$TranslationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TranslationInitialImplCopyWith<$Res> {
  factory _$$TranslationInitialImplCopyWith(_$TranslationInitialImpl value,
          $Res Function(_$TranslationInitialImpl) then) =
      __$$TranslationInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TranslationInitialImplCopyWithImpl<$Res>
    extends _$TranslationStateCopyWithImpl<$Res, _$TranslationInitialImpl>
    implements _$$TranslationInitialImplCopyWith<$Res> {
  __$$TranslationInitialImplCopyWithImpl(_$TranslationInitialImpl _value,
      $Res Function(_$TranslationInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TranslationInitialImpl implements TranslationInitial {
  const _$TranslationInitialImpl();

  @override
  String toString() {
    return 'TranslationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TranslationInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String currentLanguageCode) languageLoaded,
    required TResult Function(String currentLanguageCode) languageChanged,
    required TResult Function(bool updated, String currentLanguageCode)
        syncSuccess,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String currentLanguageCode)? languageLoaded,
    TResult? Function(String currentLanguageCode)? languageChanged,
    TResult? Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String currentLanguageCode)? languageLoaded,
    TResult Function(String currentLanguageCode)? languageChanged,
    TResult Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult Function(String message)? error,
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
    required TResult Function(TranslationInitial value) initial,
    required TResult Function(TranslationLoading value) loading,
    required TResult Function(TranslationLanguageLoaded value) languageLoaded,
    required TResult Function(TranslationLanguageChanged value) languageChanged,
    required TResult Function(TranslationSyncSuccess value) syncSuccess,
    required TResult Function(TranslationError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranslationInitial value)? initial,
    TResult? Function(TranslationLoading value)? loading,
    TResult? Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult? Function(TranslationLanguageChanged value)? languageChanged,
    TResult? Function(TranslationSyncSuccess value)? syncSuccess,
    TResult? Function(TranslationError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranslationInitial value)? initial,
    TResult Function(TranslationLoading value)? loading,
    TResult Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult Function(TranslationLanguageChanged value)? languageChanged,
    TResult Function(TranslationSyncSuccess value)? syncSuccess,
    TResult Function(TranslationError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TranslationInitial implements TranslationState {
  const factory TranslationInitial() = _$TranslationInitialImpl;
}

/// @nodoc
abstract class _$$TranslationLoadingImplCopyWith<$Res> {
  factory _$$TranslationLoadingImplCopyWith(_$TranslationLoadingImpl value,
          $Res Function(_$TranslationLoadingImpl) then) =
      __$$TranslationLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TranslationLoadingImplCopyWithImpl<$Res>
    extends _$TranslationStateCopyWithImpl<$Res, _$TranslationLoadingImpl>
    implements _$$TranslationLoadingImplCopyWith<$Res> {
  __$$TranslationLoadingImplCopyWithImpl(_$TranslationLoadingImpl _value,
      $Res Function(_$TranslationLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TranslationLoadingImpl implements TranslationLoading {
  const _$TranslationLoadingImpl();

  @override
  String toString() {
    return 'TranslationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TranslationLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String currentLanguageCode) languageLoaded,
    required TResult Function(String currentLanguageCode) languageChanged,
    required TResult Function(bool updated, String currentLanguageCode)
        syncSuccess,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String currentLanguageCode)? languageLoaded,
    TResult? Function(String currentLanguageCode)? languageChanged,
    TResult? Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String currentLanguageCode)? languageLoaded,
    TResult Function(String currentLanguageCode)? languageChanged,
    TResult Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult Function(String message)? error,
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
    required TResult Function(TranslationInitial value) initial,
    required TResult Function(TranslationLoading value) loading,
    required TResult Function(TranslationLanguageLoaded value) languageLoaded,
    required TResult Function(TranslationLanguageChanged value) languageChanged,
    required TResult Function(TranslationSyncSuccess value) syncSuccess,
    required TResult Function(TranslationError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranslationInitial value)? initial,
    TResult? Function(TranslationLoading value)? loading,
    TResult? Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult? Function(TranslationLanguageChanged value)? languageChanged,
    TResult? Function(TranslationSyncSuccess value)? syncSuccess,
    TResult? Function(TranslationError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranslationInitial value)? initial,
    TResult Function(TranslationLoading value)? loading,
    TResult Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult Function(TranslationLanguageChanged value)? languageChanged,
    TResult Function(TranslationSyncSuccess value)? syncSuccess,
    TResult Function(TranslationError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TranslationLoading implements TranslationState {
  const factory TranslationLoading() = _$TranslationLoadingImpl;
}

/// @nodoc
abstract class _$$TranslationLanguageLoadedImplCopyWith<$Res> {
  factory _$$TranslationLanguageLoadedImplCopyWith(
          _$TranslationLanguageLoadedImpl value,
          $Res Function(_$TranslationLanguageLoadedImpl) then) =
      __$$TranslationLanguageLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String currentLanguageCode});
}

/// @nodoc
class __$$TranslationLanguageLoadedImplCopyWithImpl<$Res>
    extends _$TranslationStateCopyWithImpl<$Res,
        _$TranslationLanguageLoadedImpl>
    implements _$$TranslationLanguageLoadedImplCopyWith<$Res> {
  __$$TranslationLanguageLoadedImplCopyWithImpl(
      _$TranslationLanguageLoadedImpl _value,
      $Res Function(_$TranslationLanguageLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLanguageCode = null,
  }) {
    return _then(_$TranslationLanguageLoadedImpl(
      currentLanguageCode: null == currentLanguageCode
          ? _value.currentLanguageCode
          : currentLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TranslationLanguageLoadedImpl implements TranslationLanguageLoaded {
  const _$TranslationLanguageLoadedImpl({required this.currentLanguageCode});

  @override
  final String currentLanguageCode;

  @override
  String toString() {
    return 'TranslationState.languageLoaded(currentLanguageCode: $currentLanguageCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationLanguageLoadedImpl &&
            (identical(other.currentLanguageCode, currentLanguageCode) ||
                other.currentLanguageCode == currentLanguageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentLanguageCode);

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationLanguageLoadedImplCopyWith<_$TranslationLanguageLoadedImpl>
      get copyWith => __$$TranslationLanguageLoadedImplCopyWithImpl<
          _$TranslationLanguageLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String currentLanguageCode) languageLoaded,
    required TResult Function(String currentLanguageCode) languageChanged,
    required TResult Function(bool updated, String currentLanguageCode)
        syncSuccess,
    required TResult Function(String message) error,
  }) {
    return languageLoaded(currentLanguageCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String currentLanguageCode)? languageLoaded,
    TResult? Function(String currentLanguageCode)? languageChanged,
    TResult? Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult? Function(String message)? error,
  }) {
    return languageLoaded?.call(currentLanguageCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String currentLanguageCode)? languageLoaded,
    TResult Function(String currentLanguageCode)? languageChanged,
    TResult Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (languageLoaded != null) {
      return languageLoaded(currentLanguageCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranslationInitial value) initial,
    required TResult Function(TranslationLoading value) loading,
    required TResult Function(TranslationLanguageLoaded value) languageLoaded,
    required TResult Function(TranslationLanguageChanged value) languageChanged,
    required TResult Function(TranslationSyncSuccess value) syncSuccess,
    required TResult Function(TranslationError value) error,
  }) {
    return languageLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranslationInitial value)? initial,
    TResult? Function(TranslationLoading value)? loading,
    TResult? Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult? Function(TranslationLanguageChanged value)? languageChanged,
    TResult? Function(TranslationSyncSuccess value)? syncSuccess,
    TResult? Function(TranslationError value)? error,
  }) {
    return languageLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranslationInitial value)? initial,
    TResult Function(TranslationLoading value)? loading,
    TResult Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult Function(TranslationLanguageChanged value)? languageChanged,
    TResult Function(TranslationSyncSuccess value)? syncSuccess,
    TResult Function(TranslationError value)? error,
    required TResult orElse(),
  }) {
    if (languageLoaded != null) {
      return languageLoaded(this);
    }
    return orElse();
  }
}

abstract class TranslationLanguageLoaded implements TranslationState {
  const factory TranslationLanguageLoaded(
          {required final String currentLanguageCode}) =
      _$TranslationLanguageLoadedImpl;

  String get currentLanguageCode;

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationLanguageLoadedImplCopyWith<_$TranslationLanguageLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TranslationLanguageChangedImplCopyWith<$Res> {
  factory _$$TranslationLanguageChangedImplCopyWith(
          _$TranslationLanguageChangedImpl value,
          $Res Function(_$TranslationLanguageChangedImpl) then) =
      __$$TranslationLanguageChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String currentLanguageCode});
}

/// @nodoc
class __$$TranslationLanguageChangedImplCopyWithImpl<$Res>
    extends _$TranslationStateCopyWithImpl<$Res,
        _$TranslationLanguageChangedImpl>
    implements _$$TranslationLanguageChangedImplCopyWith<$Res> {
  __$$TranslationLanguageChangedImplCopyWithImpl(
      _$TranslationLanguageChangedImpl _value,
      $Res Function(_$TranslationLanguageChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLanguageCode = null,
  }) {
    return _then(_$TranslationLanguageChangedImpl(
      currentLanguageCode: null == currentLanguageCode
          ? _value.currentLanguageCode
          : currentLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TranslationLanguageChangedImpl implements TranslationLanguageChanged {
  const _$TranslationLanguageChangedImpl({required this.currentLanguageCode});

  @override
  final String currentLanguageCode;

  @override
  String toString() {
    return 'TranslationState.languageChanged(currentLanguageCode: $currentLanguageCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationLanguageChangedImpl &&
            (identical(other.currentLanguageCode, currentLanguageCode) ||
                other.currentLanguageCode == currentLanguageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentLanguageCode);

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationLanguageChangedImplCopyWith<_$TranslationLanguageChangedImpl>
      get copyWith => __$$TranslationLanguageChangedImplCopyWithImpl<
          _$TranslationLanguageChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String currentLanguageCode) languageLoaded,
    required TResult Function(String currentLanguageCode) languageChanged,
    required TResult Function(bool updated, String currentLanguageCode)
        syncSuccess,
    required TResult Function(String message) error,
  }) {
    return languageChanged(currentLanguageCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String currentLanguageCode)? languageLoaded,
    TResult? Function(String currentLanguageCode)? languageChanged,
    TResult? Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult? Function(String message)? error,
  }) {
    return languageChanged?.call(currentLanguageCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String currentLanguageCode)? languageLoaded,
    TResult Function(String currentLanguageCode)? languageChanged,
    TResult Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (languageChanged != null) {
      return languageChanged(currentLanguageCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranslationInitial value) initial,
    required TResult Function(TranslationLoading value) loading,
    required TResult Function(TranslationLanguageLoaded value) languageLoaded,
    required TResult Function(TranslationLanguageChanged value) languageChanged,
    required TResult Function(TranslationSyncSuccess value) syncSuccess,
    required TResult Function(TranslationError value) error,
  }) {
    return languageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranslationInitial value)? initial,
    TResult? Function(TranslationLoading value)? loading,
    TResult? Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult? Function(TranslationLanguageChanged value)? languageChanged,
    TResult? Function(TranslationSyncSuccess value)? syncSuccess,
    TResult? Function(TranslationError value)? error,
  }) {
    return languageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranslationInitial value)? initial,
    TResult Function(TranslationLoading value)? loading,
    TResult Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult Function(TranslationLanguageChanged value)? languageChanged,
    TResult Function(TranslationSyncSuccess value)? syncSuccess,
    TResult Function(TranslationError value)? error,
    required TResult orElse(),
  }) {
    if (languageChanged != null) {
      return languageChanged(this);
    }
    return orElse();
  }
}

abstract class TranslationLanguageChanged implements TranslationState {
  const factory TranslationLanguageChanged(
          {required final String currentLanguageCode}) =
      _$TranslationLanguageChangedImpl;

  String get currentLanguageCode;

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationLanguageChangedImplCopyWith<_$TranslationLanguageChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TranslationSyncSuccessImplCopyWith<$Res> {
  factory _$$TranslationSyncSuccessImplCopyWith(
          _$TranslationSyncSuccessImpl value,
          $Res Function(_$TranslationSyncSuccessImpl) then) =
      __$$TranslationSyncSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool updated, String currentLanguageCode});
}

/// @nodoc
class __$$TranslationSyncSuccessImplCopyWithImpl<$Res>
    extends _$TranslationStateCopyWithImpl<$Res, _$TranslationSyncSuccessImpl>
    implements _$$TranslationSyncSuccessImplCopyWith<$Res> {
  __$$TranslationSyncSuccessImplCopyWithImpl(
      _$TranslationSyncSuccessImpl _value,
      $Res Function(_$TranslationSyncSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updated = null,
    Object? currentLanguageCode = null,
  }) {
    return _then(_$TranslationSyncSuccessImpl(
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLanguageCode: null == currentLanguageCode
          ? _value.currentLanguageCode
          : currentLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TranslationSyncSuccessImpl implements TranslationSyncSuccess {
  const _$TranslationSyncSuccessImpl(
      {required this.updated, required this.currentLanguageCode});

  @override
  final bool updated;
  @override
  final String currentLanguageCode;

  @override
  String toString() {
    return 'TranslationState.syncSuccess(updated: $updated, currentLanguageCode: $currentLanguageCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationSyncSuccessImpl &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.currentLanguageCode, currentLanguageCode) ||
                other.currentLanguageCode == currentLanguageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updated, currentLanguageCode);

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationSyncSuccessImplCopyWith<_$TranslationSyncSuccessImpl>
      get copyWith => __$$TranslationSyncSuccessImplCopyWithImpl<
          _$TranslationSyncSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String currentLanguageCode) languageLoaded,
    required TResult Function(String currentLanguageCode) languageChanged,
    required TResult Function(bool updated, String currentLanguageCode)
        syncSuccess,
    required TResult Function(String message) error,
  }) {
    return syncSuccess(updated, currentLanguageCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String currentLanguageCode)? languageLoaded,
    TResult? Function(String currentLanguageCode)? languageChanged,
    TResult? Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult? Function(String message)? error,
  }) {
    return syncSuccess?.call(updated, currentLanguageCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String currentLanguageCode)? languageLoaded,
    TResult Function(String currentLanguageCode)? languageChanged,
    TResult Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (syncSuccess != null) {
      return syncSuccess(updated, currentLanguageCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranslationInitial value) initial,
    required TResult Function(TranslationLoading value) loading,
    required TResult Function(TranslationLanguageLoaded value) languageLoaded,
    required TResult Function(TranslationLanguageChanged value) languageChanged,
    required TResult Function(TranslationSyncSuccess value) syncSuccess,
    required TResult Function(TranslationError value) error,
  }) {
    return syncSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranslationInitial value)? initial,
    TResult? Function(TranslationLoading value)? loading,
    TResult? Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult? Function(TranslationLanguageChanged value)? languageChanged,
    TResult? Function(TranslationSyncSuccess value)? syncSuccess,
    TResult? Function(TranslationError value)? error,
  }) {
    return syncSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranslationInitial value)? initial,
    TResult Function(TranslationLoading value)? loading,
    TResult Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult Function(TranslationLanguageChanged value)? languageChanged,
    TResult Function(TranslationSyncSuccess value)? syncSuccess,
    TResult Function(TranslationError value)? error,
    required TResult orElse(),
  }) {
    if (syncSuccess != null) {
      return syncSuccess(this);
    }
    return orElse();
  }
}

abstract class TranslationSyncSuccess implements TranslationState {
  const factory TranslationSyncSuccess(
          {required final bool updated,
          required final String currentLanguageCode}) =
      _$TranslationSyncSuccessImpl;

  bool get updated;
  String get currentLanguageCode;

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationSyncSuccessImplCopyWith<_$TranslationSyncSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TranslationErrorImplCopyWith<$Res> {
  factory _$$TranslationErrorImplCopyWith(_$TranslationErrorImpl value,
          $Res Function(_$TranslationErrorImpl) then) =
      __$$TranslationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TranslationErrorImplCopyWithImpl<$Res>
    extends _$TranslationStateCopyWithImpl<$Res, _$TranslationErrorImpl>
    implements _$$TranslationErrorImplCopyWith<$Res> {
  __$$TranslationErrorImplCopyWithImpl(_$TranslationErrorImpl _value,
      $Res Function(_$TranslationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TranslationErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TranslationErrorImpl implements TranslationError {
  const _$TranslationErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'TranslationState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationErrorImplCopyWith<_$TranslationErrorImpl> get copyWith =>
      __$$TranslationErrorImplCopyWithImpl<_$TranslationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String currentLanguageCode) languageLoaded,
    required TResult Function(String currentLanguageCode) languageChanged,
    required TResult Function(bool updated, String currentLanguageCode)
        syncSuccess,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String currentLanguageCode)? languageLoaded,
    TResult? Function(String currentLanguageCode)? languageChanged,
    TResult? Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String currentLanguageCode)? languageLoaded,
    TResult Function(String currentLanguageCode)? languageChanged,
    TResult Function(bool updated, String currentLanguageCode)? syncSuccess,
    TResult Function(String message)? error,
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
    required TResult Function(TranslationInitial value) initial,
    required TResult Function(TranslationLoading value) loading,
    required TResult Function(TranslationLanguageLoaded value) languageLoaded,
    required TResult Function(TranslationLanguageChanged value) languageChanged,
    required TResult Function(TranslationSyncSuccess value) syncSuccess,
    required TResult Function(TranslationError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranslationInitial value)? initial,
    TResult? Function(TranslationLoading value)? loading,
    TResult? Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult? Function(TranslationLanguageChanged value)? languageChanged,
    TResult? Function(TranslationSyncSuccess value)? syncSuccess,
    TResult? Function(TranslationError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranslationInitial value)? initial,
    TResult Function(TranslationLoading value)? loading,
    TResult Function(TranslationLanguageLoaded value)? languageLoaded,
    TResult Function(TranslationLanguageChanged value)? languageChanged,
    TResult Function(TranslationSyncSuccess value)? syncSuccess,
    TResult Function(TranslationError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TranslationError implements TranslationState {
  const factory TranslationError({required final String message}) =
      _$TranslationErrorImpl;

  String get message;

  /// Create a copy of TranslationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationErrorImplCopyWith<_$TranslationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
