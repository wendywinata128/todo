import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<sql.Database> databases() async {
    final dbPath = await sql.getDatabasesPath();
    final fullPath = path.join(dbPath, 'tasks.db');

    print(fullPath);

    return sql.openDatabase(fullPath, onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description varchar(255), progress TEXT)');
    }, version: 1);
  }

  static Future<int> insertTask(Map<String, Object> value) async {
    final database = await databases();

    return database.insert('tasks', value);
  }
}
