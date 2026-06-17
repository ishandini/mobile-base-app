import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_event.freezed.dart';

@freezed
sealed class ColorEvent with _$ColorEvent {
  const factory ColorEvent.sync() = SyncColorsEvt;
  const factory ColorEvent.load() = LoadColorsEvt;
}
