import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_event.freezed.dart';

@freezed
abstract class WelcomeEvent with _$WelcomeEvent {
  const factory WelcomeEvent.initialize() = InitializeWelcomeEvt;
  const factory WelcomeEvent.translationCompleted() = TranslationCompletedEvt;
  const factory WelcomeEvent.changeLanguage({required String key}) =
      ChangeLanguageEvt;
}
