// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TranslationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TranslationEvent()';
}


}

/// @nodoc
class $TranslationEventCopyWith<$Res>  {
$TranslationEventCopyWith(TranslationEvent _, $Res Function(TranslationEvent) __);
}


/// Adds pattern-matching-related methods to [TranslationEvent].
extension TranslationEventPatterns on TranslationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitializeTranslationsEvent value)?  initialize,TResult Function( SyncTranslationsEvent value)?  sync,TResult Function( ChangeLanguageEvent value)?  changeLanguage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitializeTranslationsEvent() when initialize != null:
return initialize(_that);case SyncTranslationsEvent() when sync != null:
return sync(_that);case ChangeLanguageEvent() when changeLanguage != null:
return changeLanguage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitializeTranslationsEvent value)  initialize,required TResult Function( SyncTranslationsEvent value)  sync,required TResult Function( ChangeLanguageEvent value)  changeLanguage,}){
final _that = this;
switch (_that) {
case InitializeTranslationsEvent():
return initialize(_that);case SyncTranslationsEvent():
return sync(_that);case ChangeLanguageEvent():
return changeLanguage(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitializeTranslationsEvent value)?  initialize,TResult? Function( SyncTranslationsEvent value)?  sync,TResult? Function( ChangeLanguageEvent value)?  changeLanguage,}){
final _that = this;
switch (_that) {
case InitializeTranslationsEvent() when initialize != null:
return initialize(_that);case SyncTranslationsEvent() when sync != null:
return sync(_that);case ChangeLanguageEvent() when changeLanguage != null:
return changeLanguage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function()?  sync,TResult Function( String languageCode)?  changeLanguage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitializeTranslationsEvent() when initialize != null:
return initialize();case SyncTranslationsEvent() when sync != null:
return sync();case ChangeLanguageEvent() when changeLanguage != null:
return changeLanguage(_that.languageCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function()  sync,required TResult Function( String languageCode)  changeLanguage,}) {final _that = this;
switch (_that) {
case InitializeTranslationsEvent():
return initialize();case SyncTranslationsEvent():
return sync();case ChangeLanguageEvent():
return changeLanguage(_that.languageCode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function()?  sync,TResult? Function( String languageCode)?  changeLanguage,}) {final _that = this;
switch (_that) {
case InitializeTranslationsEvent() when initialize != null:
return initialize();case SyncTranslationsEvent() when sync != null:
return sync();case ChangeLanguageEvent() when changeLanguage != null:
return changeLanguage(_that.languageCode);case _:
  return null;

}
}

}

/// @nodoc


class InitializeTranslationsEvent implements TranslationEvent {
  const InitializeTranslationsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitializeTranslationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TranslationEvent.initialize()';
}


}




/// @nodoc


class SyncTranslationsEvent implements TranslationEvent {
  const SyncTranslationsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncTranslationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TranslationEvent.sync()';
}


}




/// @nodoc


class ChangeLanguageEvent implements TranslationEvent {
  const ChangeLanguageEvent({required this.languageCode});
  

 final  String languageCode;

/// Create a copy of TranslationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeLanguageEventCopyWith<ChangeLanguageEvent> get copyWith => _$ChangeLanguageEventCopyWithImpl<ChangeLanguageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeLanguageEvent&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode));
}


@override
int get hashCode => Object.hash(runtimeType,languageCode);

@override
String toString() {
  return 'TranslationEvent.changeLanguage(languageCode: $languageCode)';
}


}

/// @nodoc
abstract mixin class $ChangeLanguageEventCopyWith<$Res> implements $TranslationEventCopyWith<$Res> {
  factory $ChangeLanguageEventCopyWith(ChangeLanguageEvent value, $Res Function(ChangeLanguageEvent) _then) = _$ChangeLanguageEventCopyWithImpl;
@useResult
$Res call({
 String languageCode
});




}
/// @nodoc
class _$ChangeLanguageEventCopyWithImpl<$Res>
    implements $ChangeLanguageEventCopyWith<$Res> {
  _$ChangeLanguageEventCopyWithImpl(this._self, this._then);

  final ChangeLanguageEvent _self;
  final $Res Function(ChangeLanguageEvent) _then;

/// Create a copy of TranslationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? languageCode = null,}) {
  return _then(ChangeLanguageEvent(
languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
