// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TranslationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() sync,
    required TResult Function(String languageCode) changeLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? sync,
    TResult? Function(String languageCode)? changeLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? sync,
    TResult Function(String languageCode)? changeLanguage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeTranslationsEvent value) initialize,
    required TResult Function(SyncTranslationsEvent value) sync,
    required TResult Function(ChangeLanguageEvent value) changeLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeTranslationsEvent value)? initialize,
    TResult? Function(SyncTranslationsEvent value)? sync,
    TResult? Function(ChangeLanguageEvent value)? changeLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeTranslationsEvent value)? initialize,
    TResult Function(SyncTranslationsEvent value)? sync,
    TResult Function(ChangeLanguageEvent value)? changeLanguage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationEventCopyWith<$Res> {
  factory $TranslationEventCopyWith(
          TranslationEvent value, $Res Function(TranslationEvent) then) =
      _$TranslationEventCopyWithImpl<$Res, TranslationEvent>;
}

/// @nodoc
class _$TranslationEventCopyWithImpl<$Res, $Val extends TranslationEvent>
    implements $TranslationEventCopyWith<$Res> {
  _$TranslationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeTranslationsEventImplCopyWith<$Res> {
  factory _$$InitializeTranslationsEventImplCopyWith(
          _$InitializeTranslationsEventImpl value,
          $Res Function(_$InitializeTranslationsEventImpl) then) =
      __$$InitializeTranslationsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeTranslationsEventImplCopyWithImpl<$Res>
    extends _$TranslationEventCopyWithImpl<$Res,
        _$InitializeTranslationsEventImpl>
    implements _$$InitializeTranslationsEventImplCopyWith<$Res> {
  __$$InitializeTranslationsEventImplCopyWithImpl(
      _$InitializeTranslationsEventImpl _value,
      $Res Function(_$InitializeTranslationsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeTranslationsEventImpl implements InitializeTranslationsEvent {
  const _$InitializeTranslationsEventImpl();

  @override
  String toString() {
    return 'TranslationEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeTranslationsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() sync,
    required TResult Function(String languageCode) changeLanguage,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? sync,
    TResult? Function(String languageCode)? changeLanguage,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? sync,
    TResult Function(String languageCode)? changeLanguage,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeTranslationsEvent value) initialize,
    required TResult Function(SyncTranslationsEvent value) sync,
    required TResult Function(ChangeLanguageEvent value) changeLanguage,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeTranslationsEvent value)? initialize,
    TResult? Function(SyncTranslationsEvent value)? sync,
    TResult? Function(ChangeLanguageEvent value)? changeLanguage,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeTranslationsEvent value)? initialize,
    TResult Function(SyncTranslationsEvent value)? sync,
    TResult Function(ChangeLanguageEvent value)? changeLanguage,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class InitializeTranslationsEvent implements TranslationEvent {
  const factory InitializeTranslationsEvent() =
      _$InitializeTranslationsEventImpl;
}

/// @nodoc
abstract class _$$SyncTranslationsEventImplCopyWith<$Res> {
  factory _$$SyncTranslationsEventImplCopyWith(
          _$SyncTranslationsEventImpl value,
          $Res Function(_$SyncTranslationsEventImpl) then) =
      __$$SyncTranslationsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncTranslationsEventImplCopyWithImpl<$Res>
    extends _$TranslationEventCopyWithImpl<$Res, _$SyncTranslationsEventImpl>
    implements _$$SyncTranslationsEventImplCopyWith<$Res> {
  __$$SyncTranslationsEventImplCopyWithImpl(_$SyncTranslationsEventImpl _value,
      $Res Function(_$SyncTranslationsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SyncTranslationsEventImpl implements SyncTranslationsEvent {
  const _$SyncTranslationsEventImpl();

  @override
  String toString() {
    return 'TranslationEvent.sync()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncTranslationsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() sync,
    required TResult Function(String languageCode) changeLanguage,
  }) {
    return sync();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? sync,
    TResult? Function(String languageCode)? changeLanguage,
  }) {
    return sync?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? sync,
    TResult Function(String languageCode)? changeLanguage,
    required TResult orElse(),
  }) {
    if (sync != null) {
      return sync();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeTranslationsEvent value) initialize,
    required TResult Function(SyncTranslationsEvent value) sync,
    required TResult Function(ChangeLanguageEvent value) changeLanguage,
  }) {
    return sync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeTranslationsEvent value)? initialize,
    TResult? Function(SyncTranslationsEvent value)? sync,
    TResult? Function(ChangeLanguageEvent value)? changeLanguage,
  }) {
    return sync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeTranslationsEvent value)? initialize,
    TResult Function(SyncTranslationsEvent value)? sync,
    TResult Function(ChangeLanguageEvent value)? changeLanguage,
    required TResult orElse(),
  }) {
    if (sync != null) {
      return sync(this);
    }
    return orElse();
  }
}

abstract class SyncTranslationsEvent implements TranslationEvent {
  const factory SyncTranslationsEvent() = _$SyncTranslationsEventImpl;
}

/// @nodoc
abstract class _$$ChangeLanguageEventImplCopyWith<$Res> {
  factory _$$ChangeLanguageEventImplCopyWith(_$ChangeLanguageEventImpl value,
          $Res Function(_$ChangeLanguageEventImpl) then) =
      __$$ChangeLanguageEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String languageCode});
}

/// @nodoc
class __$$ChangeLanguageEventImplCopyWithImpl<$Res>
    extends _$TranslationEventCopyWithImpl<$Res, _$ChangeLanguageEventImpl>
    implements _$$ChangeLanguageEventImplCopyWith<$Res> {
  __$$ChangeLanguageEventImplCopyWithImpl(_$ChangeLanguageEventImpl _value,
      $Res Function(_$ChangeLanguageEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
  }) {
    return _then(_$ChangeLanguageEventImpl(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeLanguageEventImpl implements ChangeLanguageEvent {
  const _$ChangeLanguageEventImpl({required this.languageCode});

  @override
  final String languageCode;

  @override
  String toString() {
    return 'TranslationEvent.changeLanguage(languageCode: $languageCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeLanguageEventImpl &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageCode);

  /// Create a copy of TranslationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeLanguageEventImplCopyWith<_$ChangeLanguageEventImpl> get copyWith =>
      __$$ChangeLanguageEventImplCopyWithImpl<_$ChangeLanguageEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() sync,
    required TResult Function(String languageCode) changeLanguage,
  }) {
    return changeLanguage(languageCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? sync,
    TResult? Function(String languageCode)? changeLanguage,
  }) {
    return changeLanguage?.call(languageCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? sync,
    TResult Function(String languageCode)? changeLanguage,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(languageCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeTranslationsEvent value) initialize,
    required TResult Function(SyncTranslationsEvent value) sync,
    required TResult Function(ChangeLanguageEvent value) changeLanguage,
  }) {
    return changeLanguage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeTranslationsEvent value)? initialize,
    TResult? Function(SyncTranslationsEvent value)? sync,
    TResult? Function(ChangeLanguageEvent value)? changeLanguage,
  }) {
    return changeLanguage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeTranslationsEvent value)? initialize,
    TResult Function(SyncTranslationsEvent value)? sync,
    TResult Function(ChangeLanguageEvent value)? changeLanguage,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(this);
    }
    return orElse();
  }
}

abstract class ChangeLanguageEvent implements TranslationEvent {
  const factory ChangeLanguageEvent({required final String languageCode}) =
      _$ChangeLanguageEventImpl;

  String get languageCode;

  /// Create a copy of TranslationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeLanguageEventImplCopyWith<_$ChangeLanguageEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
