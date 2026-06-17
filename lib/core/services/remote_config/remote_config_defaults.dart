class RemoteConfigDefaults {
  RemoteConfigDefaults._();

  static const String maintenanceMode = 'maintenance_mode';
  static const String forceUpdateVersion = 'force_update_version';
  static const String featureSocialLogin = 'feature_social_login';

  static const Map<String, dynamic> defaults = {
    maintenanceMode: false,
    forceUpdateVersion: '',
    featureSocialLogin: true,
  };
}
