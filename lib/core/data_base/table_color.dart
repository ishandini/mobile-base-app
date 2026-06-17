class TableColor {
  static const String tableName = 'tbl_color';

  static const String key = 'key';
  static const String light = 'light';
  static const String dark = 'dark';

  static const String createQuery = '''
      CREATE TABLE IF NOT EXISTS ${TableColor.tableName} ( 
        ${TableColor.key} TEXT PRIMARY KEY, 
        ${TableColor.light} TEXT NOT NULL,
        ${TableColor.dark} TEXT NOT NULL
        );
      ''';
}
