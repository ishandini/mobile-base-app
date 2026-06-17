// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteConfigState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteConfigState()';
}


}

/// @nodoc
class $RemoteConfigStateCopyWith<$Res>  {
$RemoteConfigStateCopyWith(RemoteConfigState _, $Res Function(RemoteConfigState) __);
}


/// Adds pattern-matching-related methods to [RemoteConfigState].
extension RemoteConfigStatePatterns on RemoteConfigState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RemoteConfigInitial value)?  initial,TResult Function( RemoteConfigLoading value)?  loading,TResult Function( RemoteConfigLoaded value)?  loaded,TResult Function( RemoteConfigError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RemoteConfigInitial() when initial != null:
return initial(_that);case RemoteConfigLoading() when loading != null:
return loading(_that);case RemoteConfigLoaded() when loaded != null:
return loaded(_that);case RemoteConfigError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RemoteConfigInitial value)  initial,required TResult Function( RemoteConfigLoading value)  loading,required TResult Function( RemoteConfigLoaded value)  loaded,required TResult Function( RemoteConfigError value)  error,}){
final _that = this;
switch (_that) {
case RemoteConfigInitial():
return initial(_that);case RemoteConfigLoading():
return loading(_that);case RemoteConfigLoaded():
return loaded(_that);case RemoteConfigError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RemoteConfigInitial value)?  initial,TResult? Function( RemoteConfigLoading value)?  loading,TResult? Function( RemoteConfigLoaded value)?  loaded,TResult? Function( RemoteConfigError value)?  error,}){
final _that = this;
switch (_that) {
case RemoteConfigInitial() when initial != null:
return initial(_that);case RemoteConfigLoading() when loading != null:
return loading(_that);case RemoteConfigLoaded() when loaded != null:
return loaded(_that);case RemoteConfigError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  loaded,TResult Function( String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RemoteConfigInitial() when initial != null:
return initial();case RemoteConfigLoading() when loading != null:
return loading();case RemoteConfigLoaded() when loaded != null:
return loaded();case RemoteConfigError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  loaded,required TResult Function( String? message)  error,}) {final _that = this;
switch (_that) {
case RemoteConfigInitial():
return initial();case RemoteConfigLoading():
return loading();case RemoteConfigLoaded():
return loaded();case RemoteConfigError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  loaded,TResult? Function( String? message)?  error,}) {final _that = this;
switch (_that) {
case RemoteConfigInitial() when initial != null:
return initial();case RemoteConfigLoading() when loading != null:
return loading();case RemoteConfigLoaded() when loaded != null:
return loaded();case RemoteConfigError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class RemoteConfigInitial implements RemoteConfigState {
  const RemoteConfigInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteConfigState.initial()';
}


}




/// @nodoc


class RemoteConfigLoading implements RemoteConfigState {
  const RemoteConfigLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteConfigState.loading()';
}


}




/// @nodoc


class RemoteConfigLoaded implements RemoteConfigState {
  const RemoteConfigLoaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigLoaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteConfigState.loaded()';
}


}




/// @nodoc


class RemoteConfigError implements RemoteConfigState {
  const RemoteConfigError({this.message});
  

 final  String? message;

/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteConfigErrorCopyWith<RemoteConfigError> get copyWith => _$RemoteConfigErrorCopyWithImpl<RemoteConfigError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RemoteConfigState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $RemoteConfigErrorCopyWith<$Res> implements $RemoteConfigStateCopyWith<$Res> {
  factory $RemoteConfigErrorCopyWith(RemoteConfigError value, $Res Function(RemoteConfigError) _then) = _$RemoteConfigErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$RemoteConfigErrorCopyWithImpl<$Res>
    implements $RemoteConfigErrorCopyWith<$Res> {
  _$RemoteConfigErrorCopyWithImpl(this._self, this._then);

  final RemoteConfigError _self;
  final $Res Function(RemoteConfigError) _then;

/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(RemoteConfigError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
