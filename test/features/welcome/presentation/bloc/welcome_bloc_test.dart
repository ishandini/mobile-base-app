import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_bloc.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_event.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_state.dart';
import 'package:flutter_app_template/core/services/colors/data/models/color_model.dart';
import 'package:flutter_app_template/core/services/locale/presentation/bloc/translation_bloc.dart';
import 'package:flutter_app_template/core/services/locale/presentation/bloc/translation_event.dart';
import 'package:flutter_app_template/core/services/locale/presentation/bloc/translation_state.dart';
import 'package:flutter_app_template/features/welcome/presentation/bloc/welcome_bloc.dart';
import 'package:flutter_app_template/features/welcome/presentation/bloc/welcome_event.dart';
import 'package:flutter_app_template/features/welcome/presentation/bloc/welcome_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockColorBloc extends Mock implements ColorBloc {}

class MockTranslationBloc extends Mock implements TranslationBloc {}

void main() {
  setUpAll(() {
    registerFallbackValue(const SyncColorsEvt());
    registerFallbackValue(const InitializeTranslationsEvent());
  });
  late MockColorBloc colorBloc;
  late MockTranslationBloc translationBloc;
  late StreamController<ColorState> colorController;
  late StreamController<TranslationState> translationController;

  setUp(() {
    colorBloc = MockColorBloc();
    translationBloc = MockTranslationBloc();
    colorController = StreamController<ColorState>.broadcast();
    translationController =
        StreamController<TranslationState>.broadcast();

    when(() => colorBloc.stream).thenAnswer((_) => colorController.stream);
    when(() => colorBloc.state).thenReturn(const ColorInitial());
    when(() => colorBloc.add(any())).thenReturn(null);
    when(() => translationBloc.stream)
        .thenAnswer((_) => translationController.stream);
    when(() => translationBloc.state).thenReturn(const TranslationInitial());
    when(() => translationBloc.add(any())).thenReturn(null);
  });

  tearDown(() {
    colorController.close();
    translationController.close();
  });

  group('WelcomeBloc', () {
    test('initial state is WelcomeLoading', () {
      final bloc = WelcomeBloc(
        colorBloc: colorBloc,
        translationBloc: translationBloc,
      );
      expect(bloc.state, isA<WelcomeLoading>());
      bloc.close();
    });

    test('dispatches SyncColorsEvt to ColorBloc on initialization', () async {
      final bloc = WelcomeBloc(
        colorBloc: colorBloc,
        translationBloc: translationBloc,
      );
      await Future.delayed(Duration.zero);
      verify(() => colorBloc.add(const SyncColorsEvt())).called(1);
      bloc.close();
    });

    test(
        'dispatches InitializeTranslationsEvent when ColorBloc emits ColorLoaded',
        () async {
      final bloc = WelcomeBloc(
        colorBloc: colorBloc,
        translationBloc: translationBloc,
      );
      colorController.add(ColorLoaded(colors: const []));
      await Future.delayed(Duration.zero);
      verify(() =>
              translationBloc.add(const InitializeTranslationsEvent()))
          .called(1);
      bloc.close();
    });

    blocTest<WelcomeBloc, WelcomeState>(
      'emits WelcomeReady when TranslationBloc emits TranslationLanguageChanged',
      build: () => WelcomeBloc(
        colorBloc: colorBloc,
        translationBloc: translationBloc,
      ),
      act: (bloc) async {
        translationController
            .add(const TranslationLanguageChanged(currentLanguageCode: 'en'));
        await Future.delayed(Duration.zero);
      },
      expect: () => [isA<WelcomeLoading>(), isA<WelcomeReady>()],
    );

    test('ChangeLanguageEvt delegates to TranslationBloc', () async {
      final bloc = WelcomeBloc(
        colorBloc: colorBloc,
        translationBloc: translationBloc,
      );
      bloc.add(const ChangeLanguageEvt(key: 'si'));
      await Future.delayed(Duration.zero);
      verify(() =>
              translationBloc.add(const ChangeLanguageEvent(languageCode: 'si')))
          .called(1);
      bloc.close();
    });
  });
}
