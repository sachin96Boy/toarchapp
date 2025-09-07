import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tourch_app/model/torch_model.dart';

class DbHelper {
  static Database? _db;
  static const int _version = 1;
  static final String _tableName = 'settings';

  static Future<void> initDB() async {
    if (_db != null) return;

    try {
      String path = await getDatabasesPath();

      _db = await openDatabase(
        '$path/torchapp.db',
        version: _version,
        onCreate: (db, version) async {
          // Create the settings table
          return db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            key TEXT UNIQUE NOT NULL,
            value TEXT NOT NULL
          )
        ''');
        },
      );
    } catch (e) {
      print("Error initializing database: $e");
    }
  }

  Future<void> insertColorMode(String key, ColorMode value) async {
    await initDB();
    try {
      await _db!.insert(_tableName, {
        'key': key,
        'value': value.toString(),
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print("Error inserting color mode: $e");
    }
  }

  Future<ColorMode?> getColorMode(String key) async {
    await initDB();
    try {
      final List<Map<String, dynamic>> maps = await _db!.query(
        _tableName,
        where: 'key = ?',
        whereArgs: [key],
      );

      if (maps.isNotEmpty) {
        return ColorMode.values.firstWhere(
          (e) => e.toString() == maps.first['value'],
          orElse: () => ColorMode.base,
        );
      }
    } catch (e) {
      print("Error retrieving color mode: $e");
    }
    return null;
  }
}

final dbProvider = Provider((ref) => DbHelper());
