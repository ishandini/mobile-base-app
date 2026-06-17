
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:cloud_functions/cloud_functions.dart' as _i809;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i627;
import 'package:flutter_app_template/core/common/data_sources/settings_remote_datasource.dart'
    as _i7;
import 'package:flutter_app_template/core/common/data_sources/settings_remote_datasource_impl.dart'
    as _i1032;
import 'package:flutter_app_template/core/common/repositories/settings_repository.dart'
    as _i147;
import 'package:flutter_app_template/core/common/repositories/settings_repository_impl.dart'
    as _i683;
import 'package:flutter_app_template/core/di/modules/app_module.dart' as _i426;
import 'package:flutter_app_template/core/di/modules/firebase_module.dart'
    as _i707;
import 'package:flutter_app_template/core/di/modules/network_module.dart'
    as _i826;
import 'package:flutter_app_template/core/network/api_client.dart' as _i500;
import 'package:flutter_app_template/core/routes/app_router.dart' as _i730;
import 'package:flutter_app_template/core/services/app_initialization_service.dart'
    as _i792;
import 'package:flutter_app_template/core/services/colors/data/datasources/color_local_data_source.dart'
    as _i325;
import 'package:flutter_app_template/core/services/colors/data/datasources/color_local_data_source_impl.dart'
    as _i897;
import 'package:flutter_app_template/core/services/colors/data/repositories/color_repository_impl.dart'
    as _i455;
import 'package:flutter_app_template/core/services/colors/domain/repositories/color_repository.dart'
    as _i813;
import 'package:flutter_app_template/core/services/colors/domain/usecases/get_color_usecase.dart'
    as _i162;
import 'package:flutter_app_template/core/services/colors/domain/usecases/sync_colors_usecase.dart'
    as _i613;
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_bloc.dart'
    as _i773;
import 'package:flutter_app_template/core/services/locale/app_localizations.dart'
    as _i572;
import 'package:flutter_app_template/core/services/locale/data/datasources/translation_local_data_source.dart'
    as _i501;
import 'package:flutter_app_template/core/services/locale/data/datasources/translation_local_data_source_impl.dart'
    as _i26;
import 'package:flutter_app_template/core/services/locale/data/datasources/translation_remote_data_source.dart'
    as _i2;
import 'package:flutter_app_template/core/services/locale/data/datasources/translation_remote_data_source_impl.dart'
    as _i230;
import 'package:flutter_app_template/core/services/locale/data/repositories/translation_repository_impl.dart'
    as _i44;
import 'package:flutter_app_template/core/services/locale/domain/repositories/translation_repository.dart'
    as _i873;
import 'package:flutter_app_template/core/services/locale/domain/usecases/get_translation_usecase.dart'
    as _i985;
import 'package:flutter_app_template/core/services/locale/domain/usecases/set_current_translation_usecase.dart'
    as _i457;
import 'package:flutter_app_template/core/services/locale/domain/usecases/sync_translations_usecase.dart'
    as _i734;
import 'package:flutter_app_template/core/services/locale/presentation/bloc/translation_bloc.dart'
    as _i447;
import 'package:flutter_app_template/core/services/notifications/data/datasources/notifications_datasource.dart'
    as _i872;
import 'package:flutter_app_template/core/services/notifications/data/datasources/notifications_datasource_impl.dart'
    as _i181;
import 'package:flutter_app_template/core/services/notifications/data/repositories/notifications_repository_impl.dart'
    as _i875;
import 'package:flutter_app_template/core/services/notifications/domain/repositories/notifications_repository.dart'
    as _i972;
import 'package:flutter_app_template/core/services/notifications/domain/usecases/get_fcm_token_usecase.dart'
    as _i702;
import 'package:flutter_app_template/core/services/notifications/domain/usecases/request_notification_permission_usecase.dart'
    as _i163;
import 'package:flutter_app_template/core/services/notifications/domain/usecases/subscribe_to_topic_usecase.dart'
    as _i570;
import 'package:flutter_app_template/core/services/notifications/presentation/bloc/notifications_bloc.dart'
    as _i467;
import 'package:flutter_app_template/core/services/notifications/push_notification_navigation_handler.dart'
    as _i11;
import 'package:flutter_app_template/core/services/remote_config/data/datasources/remote_config_datasource.dart'
    as _i311;
import 'package:flutter_app_template/core/services/remote_config/data/datasources/remote_config_datasource_impl.dart'
    as _i916;
import 'package:flutter_app_template/core/services/remote_config/data/repositories/remote_config_repository_impl.dart'
    as _i331;
import 'package:flutter_app_template/core/services/remote_config/domain/repositories/remote_config_repository.dart'
    as _i370;
import 'package:flutter_app_template/core/services/remote_config/domain/usecases/fetch_remote_config_usecase.dart'
    as _i994;
import 'package:flutter_app_template/core/services/remote_config/domain/usecases/get_remote_value_usecase.dart'
    as _i885;
import 'package:flutter_app_template/core/services/remote_config/presentation/bloc/remote_config_bloc.dart'
    as _i738;
import 'package:flutter_app_template/core/services/theme/data/datasource/theme_local_datasource.dart'
    as _i261;
import 'package:flutter_app_template/core/services/theme/data/datasource/theme_local_datasource_impl.dart'
    as _i17;
import 'package:flutter_app_template/core/services/theme/data/repositories/theme_repository_impl.dart'
    as _i810;
import 'package:flutter_app_template/core/services/theme/domain/repository/theme_repository.dart'
    as _i851;
import 'package:flutter_app_template/core/services/theme/domain/usecase/get_font_scale_usecase.dart'
    as _i656;
import 'package:flutter_app_template/core/services/theme/domain/usecase/get_theme_usecase.dart'
    as _i129;
import 'package:flutter_app_template/core/services/theme/domain/usecase/save_font_scale_usecase.dart'
    as _i350;
import 'package:flutter_app_template/core/services/theme/domain/usecase/save_theme_usecase.dart'
    as _i987;
import 'package:flutter_app_template/core/services/theme/presentation/bloc/theme_bloc.dart'
    as _i369;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    final firebaseModule = _$FirebaseModule();
    final networkModule = _$NetworkModule();
    gh.singleton<_i730.AppRouter>(() => appModule.appRouter());
    gh.singleton<_i572.AppLocalizations>(() => appModule.appLocalizations());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => firebaseModule.firebaseFirestore);
    gh.lazySingleton<_i892.FirebaseMessaging>(
        () => firebaseModule.firebaseMessaging);
    gh.lazySingleton<_i627.FirebaseRemoteConfig>(
        () => firebaseModule.firebaseRemoteConfig);
    gh.lazySingleton<_i809.FirebaseFunctions>(
        () => firebaseModule.firebaseFunctions);
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i792.AppInitializationService>(
        () => _i792.AppInitializationService());
    gh.lazySingleton<_i11.PushNotificationNavigationHandler>(
        () => _i11.PushNotificationNavigationHandler());
    gh.lazySingleton<_i261.ThemeLocalDataSource>(
        () => _i17.ThemeLocalDataSourceImpl());
    gh.lazySingleton<_i325.ColorLocalDataSource>(
        () => _i897.ColorLocalDataSourceImpl());
    gh.factory<_i7.SettingsRemoteDataSource>(
        () => _i1032.SettingsRemoteDataSourceImpl());
    gh.lazySingleton<_i813.ColorRepository>(() => _i455.ColorRepositoryImpl(
        localDataSource: gh<_i325.ColorLocalDataSource>()));
    gh.lazySingleton<_i872.NotificationsDataSource>(
        () => _i181.NotificationsDataSourceImpl(gh<_i892.FirebaseMessaging>()));
    gh.lazySingleton<_i311.RemoteConfigDataSource>(() =>
        _i916.RemoteConfigDataSourceImpl(gh<_i627.FirebaseRemoteConfig>()));
    gh.lazySingleton<_i501.TranslationLocalDataSource>(
        () => _i26.TranslationLocalDataSourceImpl());
    gh.lazySingleton<_i972.NotificationsRepository>(() =>
        _i875.NotificationsRepositoryImpl(
            dataSource: gh<_i872.NotificationsDataSource>()));
    gh.factory<_i147.SettingsRepository>(() => _i683.SettingsRepositoryImpl(
        remoteDataSource: gh<_i7.SettingsRemoteDataSource>()));
    gh.lazySingleton<_i370.RemoteConfigRepository>(() =>
        _i331.RemoteConfigRepositoryImpl(
            dataSource: gh<_i311.RemoteConfigDataSource>()));
    gh.lazySingleton<_i2.TranslationRemoteDataSource>(
        () => _i230.TranslationRemoteDataSourceImpl());
    gh.lazySingleton<_i500.ApiClient>(
        () => networkModule.apiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i994.FetchRemoteConfigUseCase>(() =>
        _i994.FetchRemoteConfigUseCase(
            repository: gh<_i370.RemoteConfigRepository>()));
    gh.lazySingleton<_i885.GetRemoteValueUseCase>(() =>
        _i885.GetRemoteValueUseCase(
            repository: gh<_i370.RemoteConfigRepository>()));
    gh.lazySingleton<_i851.ThemeRepository>(() => _i810.ThemeRepositoryImpl(
        localDataSource: gh<_i261.ThemeLocalDataSource>()));
    gh.lazySingleton<_i738.RemoteConfigBloc>(() => _i738.RemoteConfigBloc(
          fetchRemoteConfigUseCase: gh<_i994.FetchRemoteConfigUseCase>(),
          getRemoteValueUseCase: gh<_i885.GetRemoteValueUseCase>(),
        ));
    gh.lazySingleton<_i613.SyncColorsUseCase>(
        () => _i613.SyncColorsUseCase(repository: gh<_i813.ColorRepository>()));
    gh.lazySingleton<_i162.GetColorsUseCase>(
        () => _i162.GetColorsUseCase(repository: gh<_i813.ColorRepository>()));
    gh.lazySingleton<_i163.RequestNotificationPermissionUseCase>(() =>
        _i163.RequestNotificationPermissionUseCase(
            repository: gh<_i972.NotificationsRepository>()));
    gh.lazySingleton<_i570.SubscribeToTopicUseCase>(() =>
        _i570.SubscribeToTopicUseCase(
            repository: gh<_i972.NotificationsRepository>()));
    gh.lazySingleton<_i702.GetFcmTokenUseCase>(() => _i702.GetFcmTokenUseCase(
        repository: gh<_i972.NotificationsRepository>()));
    gh.lazySingleton<_i350.SaveFontScaleUseCase>(() =>
        _i350.SaveFontScaleUseCase(repository: gh<_i851.ThemeRepository>()));
    gh.lazySingleton<_i656.GetFontScaleUseCase>(() =>
        _i656.GetFontScaleUseCase(repository: gh<_i851.ThemeRepository>()));
    gh.lazySingleton<_i129.GetThemeUseCase>(
        () => _i129.GetThemeUseCase(repository: gh<_i851.ThemeRepository>()));
    gh.lazySingleton<_i987.SaveThemeUseCase>(
        () => _i987.SaveThemeUseCase(repository: gh<_i851.ThemeRepository>()));
    gh.lazySingleton<_i873.TranslationRepository>(
        () => _i44.TranslationRepositoryImpl(
              localDataSource: gh<_i501.TranslationLocalDataSource>(),
              remoteDataSource: gh<_i2.TranslationRemoteDataSource>(),
            ));
    gh.lazySingleton<_i734.SyncTranslationsUseCase>(() =>
        _i734.SyncTranslationsUseCase(
            repository: gh<_i873.TranslationRepository>()));
    gh.lazySingleton<_i985.GetTranslationUseCase>(() =>
        _i985.GetTranslationUseCase(
            repository: gh<_i873.TranslationRepository>()));
    gh.lazySingleton<_i457.SetCurrentTranslationUseCase>(() =>
        _i457.SetCurrentTranslationUseCase(
            repository: gh<_i873.TranslationRepository>()));
    gh.lazySingleton<_i467.NotificationsBloc>(() => _i467.NotificationsBloc(
          requestPermissionUseCase:
              gh<_i163.RequestNotificationPermissionUseCase>(),
          getFcmTokenUseCase: gh<_i702.GetFcmTokenUseCase>(),
          subscribeToTopicUseCase: gh<_i570.SubscribeToTopicUseCase>(),
          notificationsRepository: gh<_i972.NotificationsRepository>(),
        ));
    gh.lazySingleton<_i369.ThemeBloc>(() => _i369.ThemeBloc(
          getThemeUseCase: gh<_i129.GetThemeUseCase>(),
          saveThemeUseCase: gh<_i987.SaveThemeUseCase>(),
          getFontScaleUseCase: gh<_i656.GetFontScaleUseCase>(),
          saveFontScaleUseCase: gh<_i350.SaveFontScaleUseCase>(),
        ));
    gh.lazySingleton<_i773.ColorBloc>(() => _i773.ColorBloc(
          getColorsUseCase: gh<_i162.GetColorsUseCase>(),
          syncColorsUseCase: gh<_i613.SyncColorsUseCase>(),
          themeBloc: gh<_i369.ThemeBloc>(),
        ));
    gh.lazySingleton<_i447.TranslationBloc>(() => _i447.TranslationBloc(
          getTranslationUseCase: gh<_i985.GetTranslationUseCase>(),
          setCurrentTranslationUseCase:
              gh<_i457.SetCurrentTranslationUseCase>(),
          syncTranslationsUseCase: gh<_i734.SyncTranslationsUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i426.AppModule {}

class _$FirebaseModule extends _i707.FirebaseModule {}

class _$NetworkModule extends _i826.NetworkModule {}
