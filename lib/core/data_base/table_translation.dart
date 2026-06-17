class TableTranslation {
  static const String tableName = 'tbl_translation';

  static const String key = 'key';
  static const String si = 'si';
  static const String ta = 'ta';
  static const String en = 'en';

  static const String createQuery = '''
      CREATE TABLE IF NOT EXISTS ${TableTranslation.tableName} ( 
        ${TableTranslation.key} TEXT PRIMARY KEY, 
        ${TableTranslation.si} TEXT,
        ${TableTranslation.ta} TEXT,
        ${TableTranslation.en} TEXT
        );
      ''';
}
