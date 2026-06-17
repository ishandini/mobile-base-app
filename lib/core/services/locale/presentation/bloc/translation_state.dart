import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation_state.freezed.dart';

@freezed
sealed class TranslationState with _$TranslationState {
  const factory TranslationState.initial() = TranslationInitial;
  const factory TranslationState.loading() = TranslationLoading;
  const factory TranslationState.languageLoaded({
    required String currentLanguageCode,
  }) = TranslationLanguageLoaded;
  const factory TranslationState.languageChanged({
    required String currentLanguageCode,
  }) = TranslationLanguageChanged;
  const factory TranslationState.syncSuccess({
    required bool updated,
    required String currentLanguageCode,
  }) = TranslationSyncSuccess;
  const factory TranslationState.error({required String message}) =
      TranslationError;
}
