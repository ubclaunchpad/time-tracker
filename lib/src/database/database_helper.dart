import 'dart:async';
import 'dart:io' as io;

import 'package:flutter/rendering.dart';

import '../models/task.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class DatabaseHelper {
  bool test;

  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper({test = false}) {
    _instance.test = test;
    return _instance;
  }

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    print("making the src.database");

    Database database = await openDatabase(
      join(await getDatabasesPath(), test ? 'dbdev.db' : 'dbprod.db'),
      // When the src.database is first created, create a table to store tasks.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the src.database.
        return db.execute(
          "CREATE TABLE task(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, startTime INTEGER, stopTime INTEGER, category TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform src.database upgrades and downgrades.
      version: 1,
    );

    return database;
  }

  // get
  Future<Task> getTask(int id) async {
    // Get a reference to the src.database.
    final Database dbClient = await db;

    // get the Task from the Database.
    List<Map<String, dynamic>> tasks = await dbClient.query(
      'task',
      // Use a `where` clause to delete a specific Task.
      where: "id = ?",
      // Pass the Task's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
    if (tasks.length == 0) {
      return null;
    }

    return Task(
      id: tasks[0]["id"],
      description: tasks[0]["description"],
      category: tasks[0]["category"],
      startTime: tasks[0]["startTime"],
      stopTime: tasks[0]["stopTime"],
    );
  }

  // Define a function that inserts tasks into the src.database
  Future<int> insertTask(
      String description, String category, int startTime, int stopTime) async {
    print("insert");
    // Get a reference to the src.database.
    final Database dbClient = await db;

    // Insert the Task into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same Task is inserted twice.
    //
    // In this case, replace any previous data.
    return await dbClient.insert(
      'task',
      {
        'description': description,
        'startTime': startTime,
        'stopTime': stopTime,
        'category': category,
      },
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<List<Task>> tasks() async {
    // Get a reference to the src.database.
    final Database dbClient = await db;

    // Query the table for all The Tasks.
    final List<Map<String, dynamic>> maps = await dbClient.query('task');

    // Convert the List<Map<String, dynamic> into a List<Tasks>.
    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        description: maps[i]['description'],
        category: maps[i]['category'],
        startTime: maps[i]['startTime'],
        stopTime: maps[i]['stopTime'],
      );
    });
  }

  // Update
  Future<int> updateTask(Task task) async {
    // Get a reference to the src.database.
    final Database dbClient = await db;
    // Update the given Task.
    return await dbClient.update(
      'task',
      task.toMap(),
      // Ensure that the Task has a matching id.
      where: "id = ?",
      // Pass the Task's id as a whereArg to prevent SQL injection.
      whereArgs: [task.id],
    );
  }

  // delete
  Future<int> deleteTask(int id) async {
    // Get a reference to the src.database.
    final Database dbClient = await db;

    // Remove the Task from the Database.
    return await dbClient.delete(
      'task',
      // Use a `where` clause to delete a specific Task.
      where: "id = ?",
      // Pass the Task's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> resetDatabase() async {
    final Database dbClient = await db;
    await dbClient.execute("DROP TABLE task");
    await dbClient.execute(
      "CREATE TABLE task(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, startTime INTEGER, stopTime INTEGER, category TEXT)",
    );
  }
}
