import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/todo.dart';

import 'models/task_model.dart';

class DatabaseController {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, text TEXT)");
        db.execute(
            'CREATE TABLE todo(id INTEGER PRIMARY KEY, taskId INTEGER, title TEXT, checked INTEGER)');
        // await db.execute(
        //     "CREATE TABLE todo(id INTEGER PRIMARY KEY, taskId INTEGER, title TEXT, checked BOOLEAN)");

        return Future.value();
      },
      version: 1,
    );
  }

  Future<int> insertTask(TaskModel task) async {
    int taskId = 0;
    Database _db = await database();
    await _db
        .insert('tasks', task.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      taskId = value;
    });
    return taskId;
  }

  Future<void> updateTaskTitle(int id, String title) async {
    Database _db = await database();
    await _db.rawQuery("UPDATE tasks SET title = '$title' WHERE id = $id");
  }

  Future<void> updateTaskDescription(int id, String description) async {
    Database _db = await database();
    await _db.rawQuery("UPDATE tasks SET text = '$description' WHERE id = $id");
  }

  Future<void> updateTaskStatus(int id, int checked) async {
    Database _db = await database();
    await _db.rawQuery("UPDATE todo SET checked = $checked WHERE id = $id");
  }

  Future<void> insertToDo(ToDoModel todo) async {
    Database _db = await database();
    await _db.insert('todo', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteTask(int id) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM tasks WHERE id = $id");
    await _db.rawDelete("DELETE FROM todo WHERE taskId = $id");
  }

  Future<List<TaskModel>> getTasks() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query('tasks');
    return List.generate(
        taskMap.length,
        (index) => TaskModel(
            id: taskMap[index]['id'],
            title: taskMap[index]['title'],
            text: taskMap[index]['text']));
  }

  Future<List<ToDoModel>> getTodo(int taskId) async {
    Database _db = await database();
    List<Map<String, dynamic>> todoMap =
        await _db.rawQuery('SELECT * FROM todo WHERE taskId = $taskId');
    return List.generate(
        todoMap.length,
        (index) => ToDoModel(
            id: todoMap[index]['id'],
            title: todoMap[index]['title'],
            checked: todoMap[index]['checked'],
            taskId: todoMap[index]['taskId']));
  }
}
