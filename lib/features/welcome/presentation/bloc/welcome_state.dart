import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_state.freezed.dart';

@freezed
abstract class WelcomeState with _$WelcomeState {
  const factory WelcomeState.loading() = WelcomeLoading;
  const factory WelcomeState.ready() = WelcomeReady;
}
