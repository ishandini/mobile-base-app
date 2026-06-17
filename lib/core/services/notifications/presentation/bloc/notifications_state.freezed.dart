// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool permissionGranted, String? fcmToken) ready,
    required TResult Function(NotificationEntity notification) messageReceived,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool permissionGranted, String? fcmToken)? ready,
    TResult? Function(NotificationEntity notification)? messageReceived,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool permissionGranted, String? fcmToken)? ready,
    TResult Function(NotificationEntity notification)? messageReceived,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsInitial value) initial,
    required TResult Function(NotificationsLoading value) loading,
    required TResult Function(NotificationsReady value) ready,
    required TResult Function(NotificationsMessageReceived value)
        messageReceived,
    required TResult Function(NotificationsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsInitial value)? initial,
    TResult? Function(NotificationsLoading value)? loading,
    TResult? Function(NotificationsReady value)? ready,
    TResult? Function(NotificationsMessageReceived value)? messageReceived,
    TResult? Function(NotificationsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsInitial value)? initial,
    TResult Function(NotificationsLoading value)? loading,
    TResult Function(NotificationsReady value)? ready,
    TResult Function(NotificationsMessageReceived value)? messageReceived,
    TResult Function(NotificationsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res, NotificationsState>;
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res, $Val extends NotificationsState>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NotificationsInitialImplCopyWith<$Res> {
  factory _$$NotificationsInitialImplCopyWith(_$NotificationsInitialImpl value,
          $Res Function(_$NotificationsInitialImpl) then) =
      __$$NotificationsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationsInitialImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$NotificationsInitialImpl>
    implements _$$NotificationsInitialImplCopyWith<$Res> {
  __$$NotificationsInitialImplCopyWithImpl(_$NotificationsInitialImpl _value,
      $Res Function(_$NotificationsInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotificationsInitialImpl implements NotificationsInitial {
  const _$NotificationsInitialImpl();

  @override
  String toString() {
    return 'NotificationsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool permissionGranted, String? fcmToken) ready,
    required TResult Function(NotificationEntity notification) messageReceived,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool permissionGranted, String? fcmToken)? ready,
    TResult? Function(NotificationEntity notification)? messageReceived,
    TResult? Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool permissionGranted, String? fcmToken)? ready,
    TResult Function(NotificationEntity notification)? messageReceived,
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
    required TResult Function(NotificationsInitial value) initial,
    required TResult Function(NotificationsLoading value) loading,
    required TResult Function(NotificationsReady value) ready,
    required TResult Function(NotificationsMessageReceived value)
        messageReceived,
    required TResult Function(NotificationsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsInitial value)? initial,
    TResult? Function(NotificationsLoading value)? loading,
    TResult? Function(NotificationsReady value)? ready,
    TResult? Function(NotificationsMessageReceived value)? messageReceived,
    TResult? Function(NotificationsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsInitial value)? initial,
    TResult Function(NotificationsLoading value)? loading,
    TResult Function(NotificationsReady value)? ready,
    TResult Function(NotificationsMessageReceived value)? messageReceived,
    TResult Function(NotificationsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class NotificationsInitial implements NotificationsState {
  const factory NotificationsInitial() = _$NotificationsInitialImpl;
}

/// @nodoc
abstract class _$$NotificationsLoadingImplCopyWith<$Res> {
  factory _$$NotificationsLoadingImplCopyWith(_$NotificationsLoadingImpl value,
          $Res Function(_$NotificationsLoadingImpl) then) =
      __$$NotificationsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationsLoadingImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$NotificationsLoadingImpl>
    implements _$$NotificationsLoadingImplCopyWith<$Res> {
  __$$NotificationsLoadingImplCopyWithImpl(_$NotificationsLoadingImpl _value,
      $Res Function(_$NotificationsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotificationsLoadingImpl implements NotificationsLoading {
  const _$NotificationsLoadingImpl();

  @override
  String toString() {
    return 'NotificationsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool permissionGranted, String? fcmToken) ready,
    required TResult Function(NotificationEntity notification) messageReceived,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool permissionGranted, String? fcmToken)? ready,
    TResult? Function(NotificationEntity notification)? messageReceived,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool permissionGranted, String? fcmToken)? ready,
    TResult Function(NotificationEntity notification)? messageReceived,
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
    required TResult Function(NotificationsInitial value) initial,
    required TResult Function(NotificationsLoading value) loading,
    required TResult Function(NotificationsReady value) ready,
    required TResult Function(NotificationsMessageReceived value)
        messageReceived,
    required TResult Function(NotificationsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsInitial value)? initial,
    TResult? Function(NotificationsLoading value)? loading,
    TResult? Function(NotificationsReady value)? ready,
    TResult? Function(NotificationsMessageReceived value)? messageReceived,
    TResult? Function(NotificationsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsInitial value)? initial,
    TResult Function(NotificationsLoading value)? loading,
    TResult Function(NotificationsReady value)? ready,
    TResult Function(NotificationsMessageReceived value)? messageReceived,
    TResult Function(NotificationsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NotificationsLoading implements NotificationsState {
  const factory NotificationsLoading() = _$NotificationsLoadingImpl;
}

/// @nodoc
abstract class _$$NotificationsReadyImplCopyWith<$Res> {
  factory _$$NotificationsReadyImplCopyWith(_$NotificationsReadyImpl value,
          $Res Function(_$NotificationsReadyImpl) then) =
      __$$NotificationsReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool permissionGranted, String? fcmToken});
}

/// @nodoc
class __$$NotificationsReadyImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$NotificationsReadyImpl>
    implements _$$NotificationsReadyImplCopyWith<$Res> {
  __$$NotificationsReadyImplCopyWithImpl(_$NotificationsReadyImpl _value,
      $Res Function(_$NotificationsReadyImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissionGranted = null,
    Object? fcmToken = freezed,
  }) {
    return _then(_$NotificationsReadyImpl(
      permissionGranted: null == permissionGranted
          ? _value.permissionGranted
          : permissionGranted // ignore: cast_nullable_to_non_nullable
              as bool,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotificationsReadyImpl implements NotificationsReady {
  const _$NotificationsReadyImpl(
      {required this.permissionGranted, this.fcmToken});

  @override
  final bool permissionGranted;
  @override
  final String? fcmToken;

  @override
  String toString() {
    return 'NotificationsState.ready(permissionGranted: $permissionGranted, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsReadyImpl &&
            (identical(other.permissionGranted, permissionGranted) ||
                other.permissionGranted == permissionGranted) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permissionGranted, fcmToken);

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsReadyImplCopyWith<_$NotificationsReadyImpl> get copyWith =>
      __$$NotificationsReadyImplCopyWithImpl<_$NotificationsReadyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool permissionGranted, String? fcmToken) ready,
    required TResult Function(NotificationEntity notification) messageReceived,
    required TResult Function(String? message) error,
  }) {
    return ready(permissionGranted, fcmToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool permissionGranted, String? fcmToken)? ready,
    TResult? Function(NotificationEntity notification)? messageReceived,
    TResult? Function(String? message)? error,
  }) {
    return ready?.call(permissionGranted, fcmToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool permissionGranted, String? fcmToken)? ready,
    TResult Function(NotificationEntity notification)? messageReceived,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(permissionGranted, fcmToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsInitial value) initial,
    required TResult Function(NotificationsLoading value) loading,
    required TResult Function(NotificationsReady value) ready,
    required TResult Function(NotificationsMessageReceived value)
        messageReceived,
    required TResult Function(NotificationsError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsInitial value)? initial,
    TResult? Function(NotificationsLoading value)? loading,
    TResult? Function(NotificationsReady value)? ready,
    TResult? Function(NotificationsMessageReceived value)? messageReceived,
    TResult? Function(NotificationsError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsInitial value)? initial,
    TResult Function(NotificationsLoading value)? loading,
    TResult Function(NotificationsReady value)? ready,
    TResult Function(NotificationsMessageReceived value)? messageReceived,
    TResult Function(NotificationsError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class NotificationsReady implements NotificationsState {
  const factory NotificationsReady(
      {required final bool permissionGranted,
      final String? fcmToken}) = _$NotificationsReadyImpl;

  bool get permissionGranted;
  String? get fcmToken;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationsReadyImplCopyWith<_$NotificationsReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationsMessageReceivedImplCopyWith<$Res> {
  factory _$$NotificationsMessageReceivedImplCopyWith(
          _$NotificationsMessageReceivedImpl value,
          $Res Function(_$NotificationsMessageReceivedImpl) then) =
      __$$NotificationsMessageReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationEntity notification});
}

/// @nodoc
class __$$NotificationsMessageReceivedImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res,
        _$NotificationsMessageReceivedImpl>
    implements _$$NotificationsMessageReceivedImplCopyWith<$Res> {
  __$$NotificationsMessageReceivedImplCopyWithImpl(
      _$NotificationsMessageReceivedImpl _value,
      $Res Function(_$NotificationsMessageReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
  }) {
    return _then(_$NotificationsMessageReceivedImpl(
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationEntity,
    ));
  }
}

/// @nodoc

class _$NotificationsMessageReceivedImpl
    implements NotificationsMessageReceived {
  const _$NotificationsMessageReceivedImpl({required this.notification});

  @override
  final NotificationEntity notification;

  @override
  String toString() {
    return 'NotificationsState.messageReceived(notification: $notification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsMessageReceivedImpl &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notification);

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsMessageReceivedImplCopyWith<
          _$NotificationsMessageReceivedImpl>
      get copyWith => __$$NotificationsMessageReceivedImplCopyWithImpl<
          _$NotificationsMessageReceivedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool permissionGranted, String? fcmToken) ready,
    required TResult Function(NotificationEntity notification) messageReceived,
    required TResult Function(String? message) error,
  }) {
    return messageReceived(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool permissionGranted, String? fcmToken)? ready,
    TResult? Function(NotificationEntity notification)? messageReceived,
    TResult? Function(String? message)? error,
  }) {
    return messageReceived?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool permissionGranted, String? fcmToken)? ready,
    TResult Function(NotificationEntity notification)? messageReceived,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (messageReceived != null) {
      return messageReceived(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsInitial value) initial,
    required TResult Function(NotificationsLoading value) loading,
    required TResult Function(NotificationsReady value) ready,
    required TResult Function(NotificationsMessageReceived value)
        messageReceived,
    required TResult Function(NotificationsError value) error,
  }) {
    return messageReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsInitial value)? initial,
    TResult? Function(NotificationsLoading value)? loading,
    TResult? Function(NotificationsReady value)? ready,
    TResult? Function(NotificationsMessageReceived value)? messageReceived,
    TResult? Function(NotificationsError value)? error,
  }) {
    return messageReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsInitial value)? initial,
    TResult Function(NotificationsLoading value)? loading,
    TResult Function(NotificationsReady value)? ready,
    TResult Function(NotificationsMessageReceived value)? messageReceived,
    TResult Function(NotificationsError value)? error,
    required TResult orElse(),
  }) {
    if (messageReceived != null) {
      return messageReceived(this);
    }
    return orElse();
  }
}

abstract class NotificationsMessageReceived implements NotificationsState {
  const factory NotificationsMessageReceived(
          {required final NotificationEntity notification}) =
      _$NotificationsMessageReceivedImpl;

  NotificationEntity get notification;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationsMessageReceivedImplCopyWith<
          _$NotificationsMessageReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationsErrorImplCopyWith<$Res> {
  factory _$$NotificationsErrorImplCopyWith(_$NotificationsErrorImpl value,
          $Res Function(_$NotificationsErrorImpl) then) =
      __$$NotificationsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NotificationsErrorImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$NotificationsErrorImpl>
    implements _$$NotificationsErrorImplCopyWith<$Res> {
  __$$NotificationsErrorImplCopyWithImpl(_$NotificationsErrorImpl _value,
      $Res Function(_$NotificationsErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NotificationsErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotificationsErrorImpl implements NotificationsError {
  const _$NotificationsErrorImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'NotificationsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsErrorImplCopyWith<_$NotificationsErrorImpl> get copyWith =>
      __$$NotificationsErrorImplCopyWithImpl<_$NotificationsErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool permissionGranted, String? fcmToken) ready,
    required TResult Function(NotificationEntity notification) messageReceived,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool permissionGranted, String? fcmToken)? ready,
    TResult? Function(NotificationEntity notification)? messageReceived,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool permissionGranted, String? fcmToken)? ready,
    TResult Function(NotificationEntity notification)? messageReceived,
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
    required TResult Function(NotificationsInitial value) initial,
    required TResult Function(NotificationsLoading value) loading,
    required TResult Function(NotificationsReady value) ready,
    required TResult Function(NotificationsMessageReceived value)
        messageReceived,
    required TResult Function(NotificationsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsInitial value)? initial,
    TResult? Function(NotificationsLoading value)? loading,
    TResult? Function(NotificationsReady value)? ready,
    TResult? Function(NotificationsMessageReceived value)? messageReceived,
    TResult? Function(NotificationsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsInitial value)? initial,
    TResult Function(NotificationsLoading value)? loading,
    TResult Function(NotificationsReady value)? ready,
    TResult Function(NotificationsMessageReceived value)? messageReceived,
    TResult Function(NotificationsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NotificationsError implements NotificationsState {
  const factory NotificationsError({final String? message}) =
      _$NotificationsErrorImpl;

  String? get message;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationsErrorImplCopyWith<_$NotificationsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
