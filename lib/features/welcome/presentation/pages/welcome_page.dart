import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/constants/const.dart';
import 'package:flutter_app_template/core/di/injection.dart';
import 'package:flutter_app_template/core/services/locale/app_localizations.dart';
import 'package:flutter_app_template/core/services/locale/presentation/bloc/translation_bloc.dart';
import 'package:flutter_app_template/core/services/locale/presentation/bloc/translation_state.dart';
import 'package:flutter_app_template/core/services/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter_app_template/core/services/theme/presentation/bloc/theme_event.dart';
import 'package:flutter_app_template/core/services/theme/theme_style.dart';
import 'package:flutter_app_template/features/welcome/presentation/bloc/welcome_bloc.dart';
import 'package:flutter_app_template/features/welcome/presentation/bloc/welcome_event.dart';
import 'package:flutter_app_template/features/welcome/presentation/bloc/welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<WelcomeBloc>(),
      child: const _WelcomeView(),
    );
  }
}

class _WelcomeView extends StatelessWidget {
  const _WelcomeView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return Scaffold(
          body: switch (state) {
            WelcomeLoading() => const Center(child: CircularProgressIndicator()),
            WelcomeReady() => const _ReadyBody(),
            _ => const Center(child: CircularProgressIndicator()),
          },
        );
      },
    );
  }
}

class _ReadyBody extends StatelessWidget {
  const _ReadyBody();

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeBloc>().state.themeMode;
    final currentLangCode = _resolveLanguageCode(context.watch<TranslationBloc>().state);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context).translate('welcome_page_lbl_welcome'),
            style: context.textStyle(
              size: FontSize.s14,
              color: context.getColor(AppColor.sampleColor),
              weight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpace.s42),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Theme',
                style: context.textStyle(
                  size: FontSize.s14,
                  color: context.getColor(AppColor.sampleColor),
                ),
              ),
              const SizedBox(width: AppSpace.s12),
              ToggleButtons(
                isSelected: [
                  themeMode == ThemeMode.light,
                  themeMode == ThemeMode.dark,
                ],
                onPressed: (i) => context.read<ThemeBloc>().add(
                      SetThemeModeEvt(
                        themeMode: i == 0 ? ThemeMode.light : ThemeMode.dark,
                      ),
                    ),
                children: const [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpace.s24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final code in Const.supportLanguages)
                Padding(
                  padding: const EdgeInsets.only(right: AppSpace.s8),
                  child: ChoiceChip(
                    label: Text(code.toUpperCase()),
                    selected: currentLangCode == code,
                    onSelected: (_) => context
                        .read<WelcomeBloc>()
                        .add(ChangeLanguageEvt(key: code)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _resolveLanguageCode(TranslationState state) => switch (state) {
        TranslationLanguageChanged(:final currentLanguageCode) =>
          currentLanguageCode,
        TranslationLanguageLoaded(:final currentLanguageCode) =>
          currentLanguageCode,
        TranslationSyncSuccess(:final currentLanguageCode) =>
          currentLanguageCode,
        _ => Const.languageEn,
      };
}
