import 'dart:async';
import 'dart:io' as io;

import 'package:time_tracker/models/task.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    // io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // String path = join(documentsDirectory.path, "main.db");
    // var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    // return theDb;
    print("making the database");

    Database database = await openDatabase(
      join(await getDatabasesPath(), 'task_database.db'),
      // When the database is first created, create a table to store tasks.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          "CREATE TABLE task(id INTEGER PRIMARY KEY, description TEXT, category TEXT, time INTEGER)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );

    return database;
  }

  // Define a function that inserts tasks into the database
  Future<void> insertTask(Task task) async {
    print("insert");
    // Get a reference to the database.
    final Database dbClient = await db;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await dbClient.insert(
      'task',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Task>> tasks() async {
    // Get a reference to the database.
    final Database dbClient = await db;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await dbClient.query('tasks');

    // Convert the List<Map<String, dynamic> into a List<Tasks>.
    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        description: maps[i]['description'],
        category: maps[i]['category'],
        time: maps[i]['time'],
      );
    });
  }
}
