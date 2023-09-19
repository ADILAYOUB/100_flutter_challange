import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConeection {
  Future<Database> setDatabase() async {
    //get directory
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'note_db');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreateDatabase);
    return database;
  }

  Future<void> _onCreateDatabase(Database database, int version) async {
    String sqlQuery =
        'CREATE TABLE note(id INTEGER PRIMARY KEY, name TEXT, description TEXT, contact TEXT)';
    await database.execute(sqlQuery);
  }
}
