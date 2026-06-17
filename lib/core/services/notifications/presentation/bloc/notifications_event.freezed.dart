// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String title, String body, Map<String, dynamic> data)
        foregroundMessageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String title, String body, Map<String, dynamic> data)?
        foregroundMessageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String title, String body, Map<String, dynamic> data)?
        foregroundMessageReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNotificationsEvt value) initialize,
    required TResult Function(ForegroundMessageReceivedEvt value)
        foregroundMessageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeNotificationsEvt value)? initialize,
    TResult? Function(ForegroundMessageReceivedEvt value)?
        foregroundMessageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNotificationsEvt value)? initialize,
    TResult Function(ForegroundMessageReceivedEvt value)?
        foregroundMessageReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsEventCopyWith<$Res> {
  factory $NotificationsEventCopyWith(
          NotificationsEvent value, $Res Function(NotificationsEvent) then) =
      _$NotificationsEventCopyWithImpl<$Res, NotificationsEvent>;
}

/// @nodoc
class _$NotificationsEventCopyWithImpl<$Res, $Val extends NotificationsEvent>
    implements $NotificationsEventCopyWith<$Res> {
  _$NotificationsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeNotificationsEvtImplCopyWith<$Res> {
  factory _$$InitializeNotificationsEvtImplCopyWith(
          _$InitializeNotificationsEvtImpl value,
          $Res Function(_$InitializeNotificationsEvtImpl) then) =
      __$$InitializeNotificationsEvtImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeNotificationsEvtImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res,
        _$InitializeNotificationsEvtImpl>
    implements _$$InitializeNotificationsEvtImplCopyWith<$Res> {
  __$$InitializeNotificationsEvtImplCopyWithImpl(
      _$InitializeNotificationsEvtImpl _value,
      $Res Function(_$InitializeNotificationsEvtImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeNotificationsEvtImpl implements InitializeNotificationsEvt {
  const _$InitializeNotificationsEvtImpl();

  @override
  String toString() {
    return 'NotificationsEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeNotificationsEvtImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String title, String body, Map<String, dynamic> data)
        foregroundMessageReceived,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String title, String body, Map<String, dynamic> data)?
        foregroundMessageReceived,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String title, String body, Map<String, dynamic> data)?
        foregroundMessageReceived,
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
    required TResult Function(InitializeNotificationsEvt value) initialize,
    required TResult Function(ForegroundMessageReceivedEvt value)
        foregroundMessageReceived,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeNotificationsEvt value)? initialize,
    TResult? Function(ForegroundMessageReceivedEvt value)?
        foregroundMessageReceived,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNotificationsEvt value)? initialize,
    TResult Function(ForegroundMessageReceivedEvt value)?
        foregroundMessageReceived,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class InitializeNotificationsEvt implements NotificationsEvent {
  const factory InitializeNotificationsEvt() = _$InitializeNotificationsEvtImpl;
}

/// @nodoc
abstract class _$$ForegroundMessageReceivedEvtImplCopyWith<$Res> {
  factory _$$ForegroundMessageReceivedEvtImplCopyWith(
          _$ForegroundMessageReceivedEvtImpl value,
          $Res Function(_$ForegroundMessageReceivedEvtImpl) then) =
      __$$ForegroundMessageReceivedEvtImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title, String body, Map<String, dynamic> data});
}

/// @nodoc
class __$$ForegroundMessageReceivedEvtImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res,
        _$ForegroundMessageReceivedEvtImpl>
    implements _$$ForegroundMessageReceivedEvtImplCopyWith<$Res> {
  __$$ForegroundMessageReceivedEvtImplCopyWithImpl(
      _$ForegroundMessageReceivedEvtImpl _value,
      $Res Function(_$ForegroundMessageReceivedEvtImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? data = null,
  }) {
    return _then(_$ForegroundMessageReceivedEvtImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$ForegroundMessageReceivedEvtImpl
    implements ForegroundMessageReceivedEvt {
  const _$ForegroundMessageReceivedEvtImpl(
      {required this.title,
      required this.body,
      required final Map<String, dynamic> data})
      : _data = data;

  @override
  final String title;
  @override
  final String body;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'NotificationsEvent.foregroundMessageReceived(title: $title, body: $body, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForegroundMessageReceivedEvtImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, body, const DeepCollectionEquality().hash(_data));

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForegroundMessageReceivedEvtImplCopyWith<
          _$ForegroundMessageReceivedEvtImpl>
      get copyWith => __$$ForegroundMessageReceivedEvtImplCopyWithImpl<
          _$ForegroundMessageReceivedEvtImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String title, String body, Map<String, dynamic> data)
        foregroundMessageReceived,
  }) {
    return foregroundMessageReceived(title, body, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String title, String body, Map<String, dynamic> data)?
        foregroundMessageReceived,
  }) {
    return foregroundMessageReceived?.call(title, body, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String title, String body, Map<String, dynamic> data)?
        foregroundMessageReceived,
    required TResult orElse(),
  }) {
    if (foregroundMessageReceived != null) {
      return foregroundMessageReceived(title, body, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNotificationsEvt value) initialize,
    required TResult Function(ForegroundMessageReceivedEvt value)
        foregroundMessageReceived,
  }) {
    return foregroundMessageReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeNotificationsEvt value)? initialize,
    TResult? Function(ForegroundMessageReceivedEvt value)?
        foregroundMessageReceived,
  }) {
    return foregroundMessageReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNotificationsEvt value)? initialize,
    TResult Function(ForegroundMessageReceivedEvt value)?
        foregroundMessageReceived,
    required TResult orElse(),
  }) {
    if (foregroundMessageReceived != null) {
      return foregroundMessageReceived(this);
    }
    return orElse();
  }
}

abstract class ForegroundMessageReceivedEvt implements NotificationsEvent {
  const factory ForegroundMessageReceivedEvt(
          {required final String title,
          required final String body,
          required final Map<String, dynamic> data}) =
      _$ForegroundMessageReceivedEvtImpl;

  String get title;
  String get body;
  Map<String, dynamic> get data;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForegroundMessageReceivedEvtImplCopyWith<
          _$ForegroundMessageReceivedEvtImpl>
      get copyWith => throw _privateConstructorUsedError;
}
