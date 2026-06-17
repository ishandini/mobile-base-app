import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation_event.freezed.dart';

@freezed
sealed class TranslationEvent with _$TranslationEvent {
  const factory TranslationEvent.initialize() = InitializeTranslationsEvent;
  const factory TranslationEvent.sync() = SyncTranslationsEvent;
  const factory TranslationEvent.changeLanguage({
    required String languageCode,
  }) = ChangeLanguageEvent;
}
