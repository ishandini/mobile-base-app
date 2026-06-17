import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_event.freezed.dart';

@freezed
sealed class RemoteConfigEvent with _$RemoteConfigEvent {
  const factory RemoteConfigEvent.fetch() = FetchRemoteConfigEvt;
}
