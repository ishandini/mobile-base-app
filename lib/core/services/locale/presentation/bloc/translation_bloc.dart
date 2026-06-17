import 'package:bloc/bloc.dart';
import 'package:flutter_app_template/core/services/locale/domain/usecases/get_translation_usecase.dart';
import 'package:flutter_app_template/core/services/locale/domain/usecases/set_current_translation_usecase.dart';
import 'package:flutter_app_template/core/services/locale/domain/usecases/sync_translations_usecase.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_app_template/core/services/locale/presentation/bloc/translation_event.dart';
import 'package:flutter_app_template/core/services/locale/presentation/bloc/translation_state.dart';

@lazySingleton
class TranslationBloc extends Bloc<TranslationEvent, TranslationState> {
  final GetTranslationUseCase getTranslationUseCase;
  final SetCurrentTranslationUseCase setCurrentTranslationUseCase;
  final SyncTranslationsUseCase syncTranslationsUseCase;

  TranslationBloc({
    required this.getTranslationUseCase,
    required this.setCurrentTranslationUseCase,
    required this.syncTranslationsUseCase,
  }) : super(const TranslationInitial()) {
    on<InitializeTranslationsEvent>(_onInitializeTranslations);
    on<SyncTranslationsEvent>(_onSyncTranslations);
    on<ChangeLanguageEvent>(_onChangeLanguage);
  }

  Future<void> _onInitializeTranslations(
    InitializeTranslationsEvent event,
    Emitter<TranslationState> emit,
  ) async {
    emit(const TranslationLoading());

    final result = await getTranslationUseCase.call();

    result.fold(
      (failure) => emit(TranslationError(message: failure.message)),
      (languageCode) async {
        emit(TranslationLanguageLoaded(currentLanguageCode: languageCode));

        add(const SyncTranslationsEvent());
      },
    );
  }

  Future<void> _onSyncTranslations(
    SyncTranslationsEvent event,
    Emitter<TranslationState> emit,
  ) async {
    emit(const TranslationLoading());

    final syncResult = await syncTranslationsUseCase.call();

    await syncResult.fold(
      (failure) async {
        emit(TranslationError(message: failure.message));
      },
      (updated) async {
        final languageResult = await getTranslationUseCase.call();

        languageResult.fold(
          (failure) => emit(TranslationError(message: failure.message)),
          (languageCode) {
            emit(
              TranslationSyncSuccess(
                updated: updated,
                currentLanguageCode: languageCode,
              ),
            );
            add(ChangeLanguageEvent(languageCode: languageCode));
          },
        );
      },
    );
  }

  Future<void> _onChangeLanguage(
    ChangeLanguageEvent event,
    Emitter<TranslationState> emit,
  ) async {
    emit(const TranslationLoading());

    final result = await setCurrentTranslationUseCase.call(event.languageCode);

    result.fold(
      (failure) => emit(TranslationError(message: failure.message)),
      (_) => emit(
          TranslationLanguageChanged(currentLanguageCode: event.languageCode)),
    );
  }
}
