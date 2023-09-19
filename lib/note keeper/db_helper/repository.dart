import 'package:flutterchallenge/note%20keeper/db_helper/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DatabaseConeection _databaseConnection;
  Repositor() {
    _databaseConnection = DatabaseConeection();
  }

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database!;
    }
  }

  // insert data
  insertData(table, data) async {
    Database db = await database;
    await db.insert(table, data);
  }

  // Read  data
  readData(table) async {
    Database db = await database;
    return await db.query(table);
  }

  // read single record
  readSingleData(table, id) async {
    Database db = await database;
    return await db.query(table, where: 'id = ?', whereArgs: [id]);
  }

  // update data
  updateData(table, data, id) async {
    Database db = await database;
    return await db
        .update(table, data, where: 'id = ?', whereArgs: [data['id']]);
  }

  // delete by id
  deleteDataById(table, id) async {
    Database db = await database;
    return await db.rawDelete(
      'DELETE FROM $table WHERE id = $id',
    );
  }
}
