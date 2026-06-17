// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ColorDataModel _$ColorDataModelFromJson(Map<String, dynamic> json) {
  return _ColorDataModel.fromJson(json);
}

/// @nodoc
mixin _$ColorDataModel {
  List<ColorModel>? get colors => throw _privateConstructorUsedError;
  String? get syncDateTime => throw _privateConstructorUsedError;

  /// Serializes this ColorDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ColorDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorDataModelCopyWith<ColorDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorDataModelCopyWith<$Res> {
  factory $ColorDataModelCopyWith(
          ColorDataModel value, $Res Function(ColorDataModel) then) =
      _$ColorDataModelCopyWithImpl<$Res, ColorDataModel>;
  @useResult
  $Res call({List<ColorModel>? colors, String? syncDateTime});
}

/// @nodoc
class _$ColorDataModelCopyWithImpl<$Res, $Val extends ColorDataModel>
    implements $ColorDataModelCopyWith<$Res> {
  _$ColorDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = freezed,
    Object? syncDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      colors: freezed == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ColorModel>?,
      syncDateTime: freezed == syncDateTime
          ? _value.syncDateTime
          : syncDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorDataModelImplCopyWith<$Res>
    implements $ColorDataModelCopyWith<$Res> {
  factory _$$ColorDataModelImplCopyWith(_$ColorDataModelImpl value,
          $Res Function(_$ColorDataModelImpl) then) =
      __$$ColorDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ColorModel>? colors, String? syncDateTime});
}

/// @nodoc
class __$$ColorDataModelImplCopyWithImpl<$Res>
    extends _$ColorDataModelCopyWithImpl<$Res, _$ColorDataModelImpl>
    implements _$$ColorDataModelImplCopyWith<$Res> {
  __$$ColorDataModelImplCopyWithImpl(
      _$ColorDataModelImpl _value, $Res Function(_$ColorDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = freezed,
    Object? syncDateTime = freezed,
  }) {
    return _then(_$ColorDataModelImpl(
      colors: freezed == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ColorModel>?,
      syncDateTime: freezed == syncDateTime
          ? _value.syncDateTime
          : syncDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ColorDataModelImpl implements _ColorDataModel {
  const _$ColorDataModelImpl(
      {final List<ColorModel>? colors, this.syncDateTime})
      : _colors = colors;

  factory _$ColorDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorDataModelImplFromJson(json);

  final List<ColorModel>? _colors;
  @override
  List<ColorModel>? get colors {
    final value = _colors;
    if (value == null) return null;
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? syncDateTime;

  @override
  String toString() {
    return 'ColorDataModel(colors: $colors, syncDateTime: $syncDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorDataModelImpl &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            (identical(other.syncDateTime, syncDateTime) ||
                other.syncDateTime == syncDateTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_colors), syncDateTime);

  /// Create a copy of ColorDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorDataModelImplCopyWith<_$ColorDataModelImpl> get copyWith =>
      __$$ColorDataModelImplCopyWithImpl<_$ColorDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorDataModelImplToJson(
      this,
    );
  }
}

abstract class _ColorDataModel implements ColorDataModel {
  const factory _ColorDataModel(
      {final List<ColorModel>? colors,
      final String? syncDateTime}) = _$ColorDataModelImpl;

  factory _ColorDataModel.fromJson(Map<String, dynamic> json) =
      _$ColorDataModelImpl.fromJson;

  @override
  List<ColorModel>? get colors;
  @override
  String? get syncDateTime;

  /// Create a copy of ColorDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorDataModelImplCopyWith<_$ColorDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
