import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_state.freezed.dart';

@freezed
sealed class RemoteConfigState with _$RemoteConfigState {
  const factory RemoteConfigState.initial() = RemoteConfigInitial;
  const factory RemoteConfigState.loading() = RemoteConfigLoading;
  const factory RemoteConfigState.loaded() = RemoteConfigLoaded;
  const factory RemoteConfigState.error({String? message}) = RemoteConfigError;
}
