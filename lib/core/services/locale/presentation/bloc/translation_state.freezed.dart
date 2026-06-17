// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TranslationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TranslationState()';
}


}

/// @nodoc
class $TranslationStateCopyWith<$Res>  {
$TranslationStateCopyWith(TranslationState _, $Res Function(TranslationState) __);
}


/// Adds pattern-matching-related methods to [TranslationState].
extension TranslationStatePatterns on TranslationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TranslationInitial value)?  initial,TResult Function( TranslationLoading value)?  loading,TResult Function( TranslationLanguageLoaded value)?  languageLoaded,TResult Function( TranslationLanguageChanged value)?  languageChanged,TResult Function( TranslationSyncSuccess value)?  syncSuccess,TResult Function( TranslationError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TranslationInitial() when initial != null:
return initial(_that);case TranslationLoading() when loading != null:
return loading(_that);case TranslationLanguageLoaded() when languageLoaded != null:
return languageLoaded(_that);case TranslationLanguageChanged() when languageChanged != null:
return languageChanged(_that);case TranslationSyncSuccess() when syncSuccess != null:
return syncSuccess(_that);case TranslationError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TranslationInitial value)  initial,required TResult Function( TranslationLoading value)  loading,required TResult Function( TranslationLanguageLoaded value)  languageLoaded,required TResult Function( TranslationLanguageChanged value)  languageChanged,required TResult Function( TranslationSyncSuccess value)  syncSuccess,required TResult Function( TranslationError value)  error,}){
final _that = this;
switch (_that) {
case TranslationInitial():
return initial(_that);case TranslationLoading():
return loading(_that);case TranslationLanguageLoaded():
return languageLoaded(_that);case TranslationLanguageChanged():
return languageChanged(_that);case TranslationSyncSuccess():
return syncSuccess(_that);case TranslationError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TranslationInitial value)?  initial,TResult? Function( TranslationLoading value)?  loading,TResult? Function( TranslationLanguageLoaded value)?  languageLoaded,TResult? Function( TranslationLanguageChanged value)?  languageChanged,TResult? Function( TranslationSyncSuccess value)?  syncSuccess,TResult? Function( TranslationError value)?  error,}){
final _that = this;
switch (_that) {
case TranslationInitial() when initial != null:
return initial(_that);case TranslationLoading() when loading != null:
return loading(_that);case TranslationLanguageLoaded() when languageLoaded != null:
return languageLoaded(_that);case TranslationLanguageChanged() when languageChanged != null:
return languageChanged(_that);case TranslationSyncSuccess() when syncSuccess != null:
return syncSuccess(_that);case TranslationError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String currentLanguageCode)?  languageLoaded,TResult Function( String currentLanguageCode)?  languageChanged,TResult Function( bool updated,  String currentLanguageCode)?  syncSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TranslationInitial() when initial != null:
return initial();case TranslationLoading() when loading != null:
return loading();case TranslationLanguageLoaded() when languageLoaded != null:
return languageLoaded(_that.currentLanguageCode);case TranslationLanguageChanged() when languageChanged != null:
return languageChanged(_that.currentLanguageCode);case TranslationSyncSuccess() when syncSuccess != null:
return syncSuccess(_that.updated,_that.currentLanguageCode);case TranslationError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String currentLanguageCode)  languageLoaded,required TResult Function( String currentLanguageCode)  languageChanged,required TResult Function( bool updated,  String currentLanguageCode)  syncSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TranslationInitial():
return initial();case TranslationLoading():
return loading();case TranslationLanguageLoaded():
return languageLoaded(_that.currentLanguageCode);case TranslationLanguageChanged():
return languageChanged(_that.currentLanguageCode);case TranslationSyncSuccess():
return syncSuccess(_that.updated,_that.currentLanguageCode);case TranslationError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String currentLanguageCode)?  languageLoaded,TResult? Function( String currentLanguageCode)?  languageChanged,TResult? Function( bool updated,  String currentLanguageCode)?  syncSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TranslationInitial() when initial != null:
return initial();case TranslationLoading() when loading != null:
return loading();case TranslationLanguageLoaded() when languageLoaded != null:
return languageLoaded(_that.currentLanguageCode);case TranslationLanguageChanged() when languageChanged != null:
return languageChanged(_that.currentLanguageCode);case TranslationSyncSuccess() when syncSuccess != null:
return syncSuccess(_that.updated,_that.currentLanguageCode);case TranslationError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TranslationInitial implements TranslationState {
  const TranslationInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TranslationState.initial()';
}


}




/// @nodoc


class TranslationLoading implements TranslationState {
  const TranslationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TranslationState.loading()';
}


}




/// @nodoc


class TranslationLanguageLoaded implements TranslationState {
  const TranslationLanguageLoaded({required this.currentLanguageCode});
  

 final  String currentLanguageCode;

/// Create a copy of TranslationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationLanguageLoadedCopyWith<TranslationLanguageLoaded> get copyWith => _$TranslationLanguageLoadedCopyWithImpl<TranslationLanguageLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationLanguageLoaded&&(identical(other.currentLanguageCode, currentLanguageCode) || other.currentLanguageCode == currentLanguageCode));
}


@override
int get hashCode => Object.hash(runtimeType,currentLanguageCode);

@override
String toString() {
  return 'TranslationState.languageLoaded(currentLanguageCode: $currentLanguageCode)';
}


}

/// @nodoc
abstract mixin class $TranslationLanguageLoadedCopyWith<$Res> implements $TranslationStateCopyWith<$Res> {
  factory $TranslationLanguageLoadedCopyWith(TranslationLanguageLoaded value, $Res Function(TranslationLanguageLoaded) _then) = _$TranslationLanguageLoadedCopyWithImpl;
@useResult
$Res call({
 String currentLanguageCode
});




}
/// @nodoc
class _$TranslationLanguageLoadedCopyWithImpl<$Res>
    implements $TranslationLanguageLoadedCopyWith<$Res> {
  _$TranslationLanguageLoadedCopyWithImpl(this._self, this._then);

  final TranslationLanguageLoaded _self;
  final $Res Function(TranslationLanguageLoaded) _then;

/// Create a copy of TranslationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentLanguageCode = null,}) {
  return _then(TranslationLanguageLoaded(
currentLanguageCode: null == currentLanguageCode ? _self.currentLanguageCode : currentLanguageCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TranslationLanguageChanged implements TranslationState {
  const TranslationLanguageChanged({required this.currentLanguageCode});
  

 final  String currentLanguageCode;

/// Create a copy of TranslationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationLanguageChangedCopyWith<TranslationLanguageChanged> get copyWith => _$TranslationLanguageChangedCopyWithImpl<TranslationLanguageChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationLanguageChanged&&(identical(other.currentLanguageCode, currentLanguageCode) || other.currentLanguageCode == currentLanguageCode));
}


@override
int get hashCode => Object.hash(runtimeType,currentLanguageCode);

@override
String toString() {
  return 'TranslationState.languageChanged(currentLanguageCode: $currentLanguageCode)';
}


}

/// @nodoc
abstract mixin class $TranslationLanguageChangedCopyWith<$Res> implements $TranslationStateCopyWith<$Res> {
  factory $TranslationLanguageChangedCopyWith(TranslationLanguageChanged value, $Res Function(TranslationLanguageChanged) _then) = _$TranslationLanguageChangedCopyWithImpl;
@useResult
$Res call({
 String currentLanguageCode
});




}
/// @nodoc
class _$TranslationLanguageChangedCopyWithImpl<$Res>
    implements $TranslationLanguageChangedCopyWith<$Res> {
  _$TranslationLanguageChangedCopyWithImpl(this._self, this._then);

  final TranslationLanguageChanged _self;
  final $Res Function(TranslationLanguageChanged) _then;

/// Create a copy of TranslationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentLanguageCode = null,}) {
  return _then(TranslationLanguageChanged(
currentLanguageCode: null == currentLanguageCode ? _self.currentLanguageCode : currentLanguageCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TranslationSyncSuccess implements TranslationState {
  const TranslationSyncSuccess({required this.updated, required this.currentLanguageCode});
  

 final  bool updated;
 final  String currentLanguageCode;

/// Create a copy of TranslationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationSyncSuccessCopyWith<TranslationSyncSuccess> get copyWith => _$TranslationSyncSuccessCopyWithImpl<TranslationSyncSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationSyncSuccess&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.currentLanguageCode, currentLanguageCode) || other.currentLanguageCode == currentLanguageCode));
}


@override
int get hashCode => Object.hash(runtimeType,updated,currentLanguageCode);

@override
String toString() {
  return 'TranslationState.syncSuccess(updated: $updated, currentLanguageCode: $currentLanguageCode)';
}


}

/// @nodoc
abstract mixin class $TranslationSyncSuccessCopyWith<$Res> implements $TranslationStateCopyWith<$Res> {
  factory $TranslationSyncSuccessCopyWith(TranslationSyncSuccess value, $Res Function(TranslationSyncSuccess) _then) = _$TranslationSyncSuccessCopyWithImpl;
@useResult
$Res call({
 bool updated, String currentLanguageCode
});




}
/// @nodoc
class _$TranslationSyncSuccessCopyWithImpl<$Res>
    implements $TranslationSyncSuccessCopyWith<$Res> {
  _$TranslationSyncSuccessCopyWithImpl(this._self, this._then);

  final TranslationSyncSuccess _self;
  final $Res Function(TranslationSyncSuccess) _then;

/// Create a copy of TranslationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updated = null,Object? currentLanguageCode = null,}) {
  return _then(TranslationSyncSuccess(
updated: null == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as bool,currentLanguageCode: null == currentLanguageCode ? _self.currentLanguageCode : currentLanguageCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TranslationError implements TranslationState {
  const TranslationError({required this.message});
  

 final  String message;

/// Create a copy of TranslationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationErrorCopyWith<TranslationError> get copyWith => _$TranslationErrorCopyWithImpl<TranslationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TranslationState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TranslationErrorCopyWith<$Res> implements $TranslationStateCopyWith<$Res> {
  factory $TranslationErrorCopyWith(TranslationError value, $Res Function(TranslationError) _then) = _$TranslationErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TranslationErrorCopyWithImpl<$Res>
    implements $TranslationErrorCopyWith<$Res> {
  _$TranslationErrorCopyWithImpl(this._self, this._then);

  final TranslationError _self;
  final $Res Function(TranslationError) _then;

/// Create a copy of TranslationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TranslationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
