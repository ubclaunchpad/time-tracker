import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker/src/database/database_helper.dart';
import 'package:time_tracker/src/models/task.dart';

import 'package:time_tracker/main.dart';

void main() {
  DatabaseHelper db;
  final task = Task(
    id: 1,
    description: 'testDescription',
    category: 'testCategory',
    startTime: 69696,
    stopTime: 420,
  );
  final task2 = Task(
    id: 2,
    description: 'testDescription2',
    category: 'testCategory2',
    startTime: 69696,
    stopTime: 420,
  );
  final task3 = Task(
    id: 3,
    description: 'testDescription3',
    category: 'testCategory3',
    startTime: 69696,
    stopTime: 420,
  );
  setUp(() async {
    // clean up db before every test
    db = new DatabaseHelper(test: true);
    await db.resetDatabase();
  });

  tearDownAll(() async {
    await db.resetDatabase();
  });

  group('Database Helper', () {
    test('insert task should put that task in the src.database', () async {
      // assert that the task is not in the src.database before inserting
      List<Task> tasks = await db.tasks();
      expect(tasks.length, 0);

      // insert task
      await db.insertTask(
        'testDescription',
        'testCategory',
        69696,
        420,
      );

      // assert that the task is now in the src.database
      tasks = await db.tasks();
      expect(tasks.length, 1);
      expect(tasks[0].id, task.id);
    });

    test('insert multiple tasks should put all of them in the src.database',
        () async {
      // assert that the task is not in the src.database before inserting
      List<Task> tasks = await db.tasks();
      expect(tasks.length, 0);

      // insert tasks
      await db.insertTask(
        'testDescription',
        'testCategory',
        69696,
        420,
      );
      await db.insertTask(
        'testDescription2',
        'testCategory2',
        69696,
        420,
      );
      await db.insertTask(
        'testDescription3',
        'testCategory3',
        69696,
        420,
      );

      // assert that the tasks are now in the src.database
      tasks = await db.tasks();
      expect(tasks.length, 3);
      expect(tasks[0].id, task.id);
      expect(tasks[1].id, task2.id);
      expect(tasks[2].id, task3.id);
    });

    test('update task should update them in the src.database', () async {
      // assert that the task is not in the src.database before inserting
      List<Task> tasks = await db.tasks();
      expect(tasks.length, 0);

      // insert task
      await db.insertTask(
        'testDescription',
        'testCategory',
        69696,
        420,
      );

      // update task
      Task updatedTask = Task(
        id: task.id,
        description: "this has been updated",
        category: task.category,
        startTime: task.startTime,
        stopTime: task.stopTime,
      );

      await db.updateTask(updatedTask);

      // assert that the task has been updated
      updatedTask = await db.getTask(task.id);

      expect(updatedTask.id, task.id);
      expect(updatedTask.description, "this has been updated");
    });

    test('delete task should delete that task from the src.database', () async {
      //insert the task into the src.database
      await db.insertTask(
        'testDescription',
        'testCategory',
        69696,
        420,
      );
      //assert that the task has been inserted into the src.database
      List<Task> tasks = await db.tasks();
      expect(tasks.length, 1);

      //delete the task from the src.database
      db.deleteTask(task.id);

      //assert hat the task has been deleted from the src.database
      tasks = await db.tasks();
      expect(tasks.length, 0);
    });

    test('get task should get the task with an id number from the src.database',
        () async {
      // insert the task
      await db.insertTask(
        'testDescription',
        'testCategory',
        69696,
        420,
      );
      // get the task
      var taskTest = await db.getTask(task.id);
      // test the task
      expect(taskTest.description, "testDescription");
      expect(taskTest.id, 1);
    });

    test('get task that doesn\'t exist should return null', () async {
      await db.insertTask(
        'testDescription',
        'testCategory',
        69696,
        420,
      );
      var failTest = await db.getTask(69);
      expect(failTest, null);
    });
  });
}
