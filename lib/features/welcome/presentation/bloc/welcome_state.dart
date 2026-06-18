import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_state.freezed.dart';

@freezed
sealed class WelcomeState with _$WelcomeState {
  const factory WelcomeState.loading() = WelcomeLoading;
  const factory WelcomeState.ready() = WelcomeReady;
  const factory WelcomeState.error({required String message}) = WelcomeError;
}
