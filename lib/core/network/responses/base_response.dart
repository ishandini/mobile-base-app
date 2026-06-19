import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@freezed
abstract class BaseResponse<T> with _$BaseResponse<T> {
  const BaseResponse._();

  const factory BaseResponse({
    String? status,
    String? message,
    T? data,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);

  @override
  Map<String, dynamic> toJson() => throw UnimplementedError();

  bool get isSuccess => status?.toLowerCase() == 'success';
}
