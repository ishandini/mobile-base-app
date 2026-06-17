// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsEvent()';
}


}

/// @nodoc
class $NotificationsEventCopyWith<$Res>  {
$NotificationsEventCopyWith(NotificationsEvent _, $Res Function(NotificationsEvent) __);
}


/// Adds pattern-matching-related methods to [NotificationsEvent].
extension NotificationsEventPatterns on NotificationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitializeNotificationsEvt value)?  initialize,TResult Function( ForegroundMessageReceivedEvt value)?  foregroundMessageReceived,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitializeNotificationsEvt() when initialize != null:
return initialize(_that);case ForegroundMessageReceivedEvt() when foregroundMessageReceived != null:
return foregroundMessageReceived(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitializeNotificationsEvt value)  initialize,required TResult Function( ForegroundMessageReceivedEvt value)  foregroundMessageReceived,}){
final _that = this;
switch (_that) {
case InitializeNotificationsEvt():
return initialize(_that);case ForegroundMessageReceivedEvt():
return foregroundMessageReceived(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitializeNotificationsEvt value)?  initialize,TResult? Function( ForegroundMessageReceivedEvt value)?  foregroundMessageReceived,}){
final _that = this;
switch (_that) {
case InitializeNotificationsEvt() when initialize != null:
return initialize(_that);case ForegroundMessageReceivedEvt() when foregroundMessageReceived != null:
return foregroundMessageReceived(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function( String title,  String body,  Map<String, dynamic> data)?  foregroundMessageReceived,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitializeNotificationsEvt() when initialize != null:
return initialize();case ForegroundMessageReceivedEvt() when foregroundMessageReceived != null:
return foregroundMessageReceived(_that.title,_that.body,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function( String title,  String body,  Map<String, dynamic> data)  foregroundMessageReceived,}) {final _that = this;
switch (_that) {
case InitializeNotificationsEvt():
return initialize();case ForegroundMessageReceivedEvt():
return foregroundMessageReceived(_that.title,_that.body,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function( String title,  String body,  Map<String, dynamic> data)?  foregroundMessageReceived,}) {final _that = this;
switch (_that) {
case InitializeNotificationsEvt() when initialize != null:
return initialize();case ForegroundMessageReceivedEvt() when foregroundMessageReceived != null:
return foregroundMessageReceived(_that.title,_that.body,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class InitializeNotificationsEvt implements NotificationsEvent {
  const InitializeNotificationsEvt();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitializeNotificationsEvt);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsEvent.initialize()';
}


}




/// @nodoc


class ForegroundMessageReceivedEvt implements NotificationsEvent {
  const ForegroundMessageReceivedEvt({required this.title, required this.body, required final  Map<String, dynamic> data}): _data = data;
  

 final  String title;
 final  String body;
 final  Map<String, dynamic> _data;
 Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForegroundMessageReceivedEvtCopyWith<ForegroundMessageReceivedEvt> get copyWith => _$ForegroundMessageReceivedEvtCopyWithImpl<ForegroundMessageReceivedEvt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForegroundMessageReceivedEvt&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,title,body,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'NotificationsEvent.foregroundMessageReceived(title: $title, body: $body, data: $data)';
}


}

/// @nodoc
abstract mixin class $ForegroundMessageReceivedEvtCopyWith<$Res> implements $NotificationsEventCopyWith<$Res> {
  factory $ForegroundMessageReceivedEvtCopyWith(ForegroundMessageReceivedEvt value, $Res Function(ForegroundMessageReceivedEvt) _then) = _$ForegroundMessageReceivedEvtCopyWithImpl;
@useResult
$Res call({
 String title, String body, Map<String, dynamic> data
});




}
/// @nodoc
class _$ForegroundMessageReceivedEvtCopyWithImpl<$Res>
    implements $ForegroundMessageReceivedEvtCopyWith<$Res> {
  _$ForegroundMessageReceivedEvtCopyWithImpl(this._self, this._then);

  final ForegroundMessageReceivedEvt _self;
  final $Res Function(ForegroundMessageReceivedEvt) _then;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? body = null,Object? data = null,}) {
  return _then(ForegroundMessageReceivedEvt(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
