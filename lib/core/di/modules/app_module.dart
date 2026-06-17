import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../routes/app_router.dart';
import '../../services/locale/app_localizations.dart';

@module
abstract class AppModule {
  @singleton
  AppRouter appRouter() => AppRouter();

  @singleton
  AppLocalizations appLocalizations() =>
      AppLocalizations(const Locale('en'));
}
