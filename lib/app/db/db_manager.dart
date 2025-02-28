import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  //privateconstructor
  DatabaseManager._privateConstructor();

  static DatabaseManager instance = DatabaseManager._privateConstructor();

  Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDB();
      return _db!;
    } else {
      return _db!;
    }
  }

  Future _initDB() async {
    //buat table databasenya (SQFLITE - SQL)
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "note.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute(
          '''
            CREATE TABLE notes (
              id INTEGER PRIMARY KEY,
              title TEXT NOT NULL,
              desc TEXT NOT NULL
            )
          ''',
        );
      },
    );
  }

  Future closeDB() async {
    _db = await instance.db;
    _db!.close();
  }
}
