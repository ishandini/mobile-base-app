import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';

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
  ) {
    final status = json['status'] as String?;
    final message = json['message'] as String?;
    final data = json['data'] != null ? fromJsonT(json['data']) as T? : null;
    return _BaseResponse(status: status, message: message, data: data);
  }

  Map<String, dynamic> toJson(Object Function(T) toJsonT) {
    return {
      'status': status,
      'message': message,
      'data': data != null ? toJsonT(data as T) : null,
    };
  }

  bool get isSuccess => status?.toLowerCase() == 'success';
}

