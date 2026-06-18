import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_bloc.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_event.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_state.dart';
import 'package:flutter_app_template/core/services/locale/presentation/bloc/translation_bloc.dart';
import 'package:flutter_app_template/core/services/locale/presentation/bloc/translation_event.dart';
import 'package:flutter_app_template/core/services/locale/presentation/bloc/translation_state.dart';
import 'package:flutter_app_template/features/welcome/presentation/bloc/welcome_event.dart';
import 'package:flutter_app_template/features/welcome/presentation/bloc/welcome_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc({
    required this.colorBloc,
    required this.translationBloc,
  }) : super(WelcomeLoading()) {
    colorsSubscription = colorBloc.stream.listen((colorState) {
      if (colorState is ColorLoaded) {
        translationBloc.add(const InitializeTranslationsEvent());
      }
    });

    translationSubscription = translationBloc.stream.listen((translationState) {
      if (translationState is TranslationLanguageChanged) {
        add(const TranslationCompletedEvt());
      }
    });

    on<InitializeWelcomeEvt>(_onInitialize);
    on<TranslationCompletedEvt>(_onTranslationCompleted);
    on<ChangeLanguageEvt>(_onChangeLanguage);

    add(const InitializeWelcomeEvt());
  }

  final ColorBloc colorBloc;
  final TranslationBloc translationBloc;

  late StreamSubscription<dynamic> colorsSubscription;
  late StreamSubscription<dynamic> translationSubscription;

  FutureOr<void> _onInitialize(
    InitializeWelcomeEvt event,
    Emitter<WelcomeState> emit,
  ) {
    emit(WelcomeLoading());
    colorBloc.add(const SyncColorsEvt());
  }

  FutureOr<void> _onTranslationCompleted(
    TranslationCompletedEvt event,
    Emitter<WelcomeState> emit,
  ) {
    emit(WelcomeReady());
  }

  FutureOr<void> _onChangeLanguage(
    ChangeLanguageEvt event,
    Emitter<WelcomeState> emit,
  ) {
    translationBloc.add(ChangeLanguageEvent(languageCode: event.key));
  }

  @override
  Future<void> close() {
    colorsSubscription.cancel();
    translationSubscription.cancel();
    return super.close();
  }
}
