import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/core/config/env_config.dart';
import 'package:flutter_app_template/core/constants/const.dart';
import 'package:flutter_app_template/core/data_base/database_helper.dart';
import 'package:flutter_app_template/core/di/injection.dart';
import 'package:flutter_app_template/core/routes/app_router.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_bloc.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_state.dart';
import 'package:flutter_app_template/core/services/locale/app_localizations.dart';
import 'package:flutter_app_template/core/services/locale/presentation/bloc/translation_bloc.dart';
import 'package:flutter_app_template/core/services/locale/presentation/bloc/translation_state.dart';
import 'package:flutter_app_template/core/services/notifications/presentation/bloc/notifications_bloc.dart';
import 'package:flutter_app_template/core/services/notifications/presentation/bloc/notifications_event.dart';
import 'package:flutter_app_template/core/services/notifications/presentation/widgets/app_notification_listener.dart';
import 'package:flutter_app_template/core/services/remote_config/presentation/bloc/remote_config_bloc.dart';
import 'package:flutter_app_template/core/services/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter_app_template/core/services/theme/presentation/bloc/theme_state.dart';
import 'package:flutter_app_template/core/utils/enums.dart';
import 'package:flutter_app_template/core/utils/fresh_install_guard.dart';
import 'package:flutter_app_template/core/utils/language_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:requests_inspector/requests_inspector.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  await EnvConfig.initialize(appFlavor);
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await DatabaseHelper.init();
  await FreshInstallGuard.run();
  await configureDependencies();

  runApp(
    RequestsInspector(
      hideInspectorBanner: true,
      enabled: EnvConfig.environment != Environment.prod,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<TranslationBloc>(
          create: (context) => sl<TranslationBloc>(),
        ),
        BlocProvider<ColorBloc>(
          create: (context) => sl<ColorBloc>(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => sl<ThemeBloc>(),
        ),
        BlocProvider<RemoteConfigBloc>(
          create: (context) => sl<RemoteConfigBloc>(),
        ),
        BlocProvider<NotificationsBloc>(
          create: (context) =>
              sl<NotificationsBloc>()..add(const NotificationsEvent.initialize()),
        ),
      ],
      child: BlocBuilder<TranslationBloc, TranslationState>(
        builder: (context, tranState) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              return BlocBuilder<ColorBloc, ColorState>(
                builder: (context, colorState) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: EnvConfig.appName,
                    theme: ThemeData(
                      appBarTheme: const AppBarTheme(
                        systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.transparent,
                          statusBarIconBrightness: Brightness.dark,
                          statusBarBrightness: Brightness.light,
                        ),
                      ),
                    ),
                    routerConfig: appRouter.config(),
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales:
                        Const.supportLanguages.map((e) => Locale(e, '')),
                    locale: tranState is TranslationLanguageChanged
                        ? Locale(tranState.currentLanguageCode, '')
                        : const Locale(Const.languageEn, ''),
                    builder: (context, child) {
                      final mq = MediaQuery.of(context);
                      final direction = LanguageHelper.textDirection(context);
                      final adjustedBottom = Platform.isAndroid
                          ? (mq.viewPadding.bottom - 12)
                              .clamp(0.0, double.infinity)
                          : 0.0;
                      return Directionality(
                        textDirection: direction,
                        child: MediaQuery(
                          data: mq.copyWith(
                            textScaler: TextScaler.noScaling,
                            boldText: false,
                            padding:
                                mq.padding.copyWith(bottom: adjustedBottom),
                            viewPadding:
                                mq.viewPadding.copyWith(bottom: adjustedBottom),
                          ),
                          child: AppNotificationListener(child: child!),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
