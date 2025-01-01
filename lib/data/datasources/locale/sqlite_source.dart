import 'dart:io' as iop;
import 'package:path_provider/path_provider.dart' as pp;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SQLiteSource {
  static const appDatabaseFilename = 'app_database.db';
  static final SQLiteSource instance = SQLiteSource._();
  static Database? _database;

  SQLiteSource._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = '';
    if (iop.Platform.isWindows) {
      databaseFactory = databaseFactoryFfi;
      final currentDir = iop.Directory.current.absolute.path;
      path = '$currentDir/$appDatabaseFilename';
    } else {
      final dbPath = await getDatabasesPath();
      path = '$dbPath/$appDatabaseFilename';
    }
    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) {},
      onUpgrade: (db, oldVersion, newVersion) {},
    );
  }
}
