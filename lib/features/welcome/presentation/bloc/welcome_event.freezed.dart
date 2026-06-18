// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WelcomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WelcomeEvent()';
}


}

/// @nodoc
class $WelcomeEventCopyWith<$Res>  {
$WelcomeEventCopyWith(WelcomeEvent _, $Res Function(WelcomeEvent) __);
}


/// Adds pattern-matching-related methods to [WelcomeEvent].
extension WelcomeEventPatterns on WelcomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitializeWelcomeEvt value)?  initialize,TResult Function( TranslationCompletedEvt value)?  translationCompleted,TResult Function( ChangeLanguageEvt value)?  changeLanguage,TResult Function( WelcomeErrorEvt value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitializeWelcomeEvt() when initialize != null:
return initialize(_that);case TranslationCompletedEvt() when translationCompleted != null:
return translationCompleted(_that);case ChangeLanguageEvt() when changeLanguage != null:
return changeLanguage(_that);case WelcomeErrorEvt() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitializeWelcomeEvt value)  initialize,required TResult Function( TranslationCompletedEvt value)  translationCompleted,required TResult Function( ChangeLanguageEvt value)  changeLanguage,required TResult Function( WelcomeErrorEvt value)  error,}){
final _that = this;
switch (_that) {
case InitializeWelcomeEvt():
return initialize(_that);case TranslationCompletedEvt():
return translationCompleted(_that);case ChangeLanguageEvt():
return changeLanguage(_that);case WelcomeErrorEvt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitializeWelcomeEvt value)?  initialize,TResult? Function( TranslationCompletedEvt value)?  translationCompleted,TResult? Function( ChangeLanguageEvt value)?  changeLanguage,TResult? Function( WelcomeErrorEvt value)?  error,}){
final _that = this;
switch (_that) {
case InitializeWelcomeEvt() when initialize != null:
return initialize(_that);case TranslationCompletedEvt() when translationCompleted != null:
return translationCompleted(_that);case ChangeLanguageEvt() when changeLanguage != null:
return changeLanguage(_that);case WelcomeErrorEvt() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function()?  translationCompleted,TResult Function( String key)?  changeLanguage,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitializeWelcomeEvt() when initialize != null:
return initialize();case TranslationCompletedEvt() when translationCompleted != null:
return translationCompleted();case ChangeLanguageEvt() when changeLanguage != null:
return changeLanguage(_that.key);case WelcomeErrorEvt() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function()  translationCompleted,required TResult Function( String key)  changeLanguage,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case InitializeWelcomeEvt():
return initialize();case TranslationCompletedEvt():
return translationCompleted();case ChangeLanguageEvt():
return changeLanguage(_that.key);case WelcomeErrorEvt():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function()?  translationCompleted,TResult? Function( String key)?  changeLanguage,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case InitializeWelcomeEvt() when initialize != null:
return initialize();case TranslationCompletedEvt() when translationCompleted != null:
return translationCompleted();case ChangeLanguageEvt() when changeLanguage != null:
return changeLanguage(_that.key);case WelcomeErrorEvt() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class InitializeWelcomeEvt implements WelcomeEvent {
  const InitializeWelcomeEvt();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitializeWelcomeEvt);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WelcomeEvent.initialize()';
}


}




/// @nodoc


class TranslationCompletedEvt implements WelcomeEvent {
  const TranslationCompletedEvt();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationCompletedEvt);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WelcomeEvent.translationCompleted()';
}


}




/// @nodoc


class ChangeLanguageEvt implements WelcomeEvent {
  const ChangeLanguageEvt({required this.key});
  

 final  String key;

/// Create a copy of WelcomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeLanguageEvtCopyWith<ChangeLanguageEvt> get copyWith => _$ChangeLanguageEvtCopyWithImpl<ChangeLanguageEvt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeLanguageEvt&&(identical(other.key, key) || other.key == key));
}


@override
int get hashCode => Object.hash(runtimeType,key);

@override
String toString() {
  return 'WelcomeEvent.changeLanguage(key: $key)';
}


}

/// @nodoc
abstract mixin class $ChangeLanguageEvtCopyWith<$Res> implements $WelcomeEventCopyWith<$Res> {
  factory $ChangeLanguageEvtCopyWith(ChangeLanguageEvt value, $Res Function(ChangeLanguageEvt) _then) = _$ChangeLanguageEvtCopyWithImpl;
@useResult
$Res call({
 String key
});




}
/// @nodoc
class _$ChangeLanguageEvtCopyWithImpl<$Res>
    implements $ChangeLanguageEvtCopyWith<$Res> {
  _$ChangeLanguageEvtCopyWithImpl(this._self, this._then);

  final ChangeLanguageEvt _self;
  final $Res Function(ChangeLanguageEvt) _then;

/// Create a copy of WelcomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? key = null,}) {
  return _then(ChangeLanguageEvt(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WelcomeErrorEvt implements WelcomeEvent {
  const WelcomeErrorEvt({required this.message});
  

 final  String message;

/// Create a copy of WelcomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeErrorEvtCopyWith<WelcomeErrorEvt> get copyWith => _$WelcomeErrorEvtCopyWithImpl<WelcomeErrorEvt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeErrorEvt&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WelcomeEvent.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $WelcomeErrorEvtCopyWith<$Res> implements $WelcomeEventCopyWith<$Res> {
  factory $WelcomeErrorEvtCopyWith(WelcomeErrorEvt value, $Res Function(WelcomeErrorEvt) _then) = _$WelcomeErrorEvtCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WelcomeErrorEvtCopyWithImpl<$Res>
    implements $WelcomeErrorEvtCopyWith<$Res> {
  _$WelcomeErrorEvtCopyWithImpl(this._self, this._then);

  final WelcomeErrorEvt _self;
  final $Res Function(WelcomeErrorEvt) _then;

/// Create a copy of WelcomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WelcomeErrorEvt(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
