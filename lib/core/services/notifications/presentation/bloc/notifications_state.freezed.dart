// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsState()';
}


}

/// @nodoc
class $NotificationsStateCopyWith<$Res>  {
$NotificationsStateCopyWith(NotificationsState _, $Res Function(NotificationsState) __);
}


/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NotificationsInitial value)?  initial,TResult Function( NotificationsLoading value)?  loading,TResult Function( NotificationsReady value)?  ready,TResult Function( NotificationsMessageReceived value)?  messageReceived,TResult Function( NotificationsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NotificationsInitial() when initial != null:
return initial(_that);case NotificationsLoading() when loading != null:
return loading(_that);case NotificationsReady() when ready != null:
return ready(_that);case NotificationsMessageReceived() when messageReceived != null:
return messageReceived(_that);case NotificationsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NotificationsInitial value)  initial,required TResult Function( NotificationsLoading value)  loading,required TResult Function( NotificationsReady value)  ready,required TResult Function( NotificationsMessageReceived value)  messageReceived,required TResult Function( NotificationsError value)  error,}){
final _that = this;
switch (_that) {
case NotificationsInitial():
return initial(_that);case NotificationsLoading():
return loading(_that);case NotificationsReady():
return ready(_that);case NotificationsMessageReceived():
return messageReceived(_that);case NotificationsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NotificationsInitial value)?  initial,TResult? Function( NotificationsLoading value)?  loading,TResult? Function( NotificationsReady value)?  ready,TResult? Function( NotificationsMessageReceived value)?  messageReceived,TResult? Function( NotificationsError value)?  error,}){
final _that = this;
switch (_that) {
case NotificationsInitial() when initial != null:
return initial(_that);case NotificationsLoading() when loading != null:
return loading(_that);case NotificationsReady() when ready != null:
return ready(_that);case NotificationsMessageReceived() when messageReceived != null:
return messageReceived(_that);case NotificationsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( bool permissionGranted,  String? fcmToken)?  ready,TResult Function( NotificationEntity notification)?  messageReceived,TResult Function( String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NotificationsInitial() when initial != null:
return initial();case NotificationsLoading() when loading != null:
return loading();case NotificationsReady() when ready != null:
return ready(_that.permissionGranted,_that.fcmToken);case NotificationsMessageReceived() when messageReceived != null:
return messageReceived(_that.notification);case NotificationsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( bool permissionGranted,  String? fcmToken)  ready,required TResult Function( NotificationEntity notification)  messageReceived,required TResult Function( String? message)  error,}) {final _that = this;
switch (_that) {
case NotificationsInitial():
return initial();case NotificationsLoading():
return loading();case NotificationsReady():
return ready(_that.permissionGranted,_that.fcmToken);case NotificationsMessageReceived():
return messageReceived(_that.notification);case NotificationsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( bool permissionGranted,  String? fcmToken)?  ready,TResult? Function( NotificationEntity notification)?  messageReceived,TResult? Function( String? message)?  error,}) {final _that = this;
switch (_that) {
case NotificationsInitial() when initial != null:
return initial();case NotificationsLoading() when loading != null:
return loading();case NotificationsReady() when ready != null:
return ready(_that.permissionGranted,_that.fcmToken);case NotificationsMessageReceived() when messageReceived != null:
return messageReceived(_that.notification);case NotificationsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class NotificationsInitial implements NotificationsState {
  const NotificationsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsState.initial()';
}


}




/// @nodoc


class NotificationsLoading implements NotificationsState {
  const NotificationsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsState.loading()';
}


}




/// @nodoc


class NotificationsReady implements NotificationsState {
  const NotificationsReady({required this.permissionGranted, this.fcmToken});
  

 final  bool permissionGranted;
 final  String? fcmToken;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsReadyCopyWith<NotificationsReady> get copyWith => _$NotificationsReadyCopyWithImpl<NotificationsReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsReady&&(identical(other.permissionGranted, permissionGranted) || other.permissionGranted == permissionGranted)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken));
}


@override
int get hashCode => Object.hash(runtimeType,permissionGranted,fcmToken);

@override
String toString() {
  return 'NotificationsState.ready(permissionGranted: $permissionGranted, fcmToken: $fcmToken)';
}


}

/// @nodoc
abstract mixin class $NotificationsReadyCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory $NotificationsReadyCopyWith(NotificationsReady value, $Res Function(NotificationsReady) _then) = _$NotificationsReadyCopyWithImpl;
@useResult
$Res call({
 bool permissionGranted, String? fcmToken
});




}
/// @nodoc
class _$NotificationsReadyCopyWithImpl<$Res>
    implements $NotificationsReadyCopyWith<$Res> {
  _$NotificationsReadyCopyWithImpl(this._self, this._then);

  final NotificationsReady _self;
  final $Res Function(NotificationsReady) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? permissionGranted = null,Object? fcmToken = freezed,}) {
  return _then(NotificationsReady(
permissionGranted: null == permissionGranted ? _self.permissionGranted : permissionGranted // ignore: cast_nullable_to_non_nullable
as bool,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class NotificationsMessageReceived implements NotificationsState {
  const NotificationsMessageReceived({required this.notification});
  

 final  NotificationEntity notification;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsMessageReceivedCopyWith<NotificationsMessageReceived> get copyWith => _$NotificationsMessageReceivedCopyWithImpl<NotificationsMessageReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsMessageReceived&&(identical(other.notification, notification) || other.notification == notification));
}


@override
int get hashCode => Object.hash(runtimeType,notification);

@override
String toString() {
  return 'NotificationsState.messageReceived(notification: $notification)';
}


}

/// @nodoc
abstract mixin class $NotificationsMessageReceivedCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory $NotificationsMessageReceivedCopyWith(NotificationsMessageReceived value, $Res Function(NotificationsMessageReceived) _then) = _$NotificationsMessageReceivedCopyWithImpl;
@useResult
$Res call({
 NotificationEntity notification
});




}
/// @nodoc
class _$NotificationsMessageReceivedCopyWithImpl<$Res>
    implements $NotificationsMessageReceivedCopyWith<$Res> {
  _$NotificationsMessageReceivedCopyWithImpl(this._self, this._then);

  final NotificationsMessageReceived _self;
  final $Res Function(NotificationsMessageReceived) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notification = null,}) {
  return _then(NotificationsMessageReceived(
notification: null == notification ? _self.notification : notification // ignore: cast_nullable_to_non_nullable
as NotificationEntity,
  ));
}


}

/// @nodoc


class NotificationsError implements NotificationsState {
  const NotificationsError({this.message});
  

 final  String? message;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsErrorCopyWith<NotificationsError> get copyWith => _$NotificationsErrorCopyWithImpl<NotificationsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NotificationsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $NotificationsErrorCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory $NotificationsErrorCopyWith(NotificationsError value, $Res Function(NotificationsError) _then) = _$NotificationsErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$NotificationsErrorCopyWithImpl<$Res>
    implements $NotificationsErrorCopyWith<$Res> {
  _$NotificationsErrorCopyWithImpl(this._self, this._then);

  final NotificationsError _self;
  final $Res Function(NotificationsError) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(NotificationsError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
