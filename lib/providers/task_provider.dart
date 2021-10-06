import 'package:flutter/cupertino.dart';
import 'package:flutter_todo_sqlite/entity/task.dart';
import 'package:flutter_todo_sqlite/helper/db_helper.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  Future<void> insertToDatabase(Map<String, Object> value) async {
    final database = await DBHelper.databases();

    await database.insert('tasks', value);

    fetchDataFromDatabase();
    notifyListeners();
  }

  Future<void> fetchDataFromDatabase() async {
    final database = await DBHelper.databases();

    final data = await database.rawQuery('SELECT * FROM "tasks"');

    _tasks = [];

    for (var item in data) {
      Task data = Task.fromMap(item);

      _tasks.add(data);
    }

    notifyListeners();
  }
}
