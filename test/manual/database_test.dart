import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker/database/database_helper.dart';
import 'package:time_tracker/models/task.dart';

import 'package:time_tracker/main.dart';

void main() {
  DatabaseHelper db;
  final task = Task(
      id: 1,
      description: 'testDescription',
      category: 'testCategory',
      clock: 42069);
  final task2 = Task(
      id: 2,
      description: 'testDescription2',
      category: 'testCategory2',
      clock: 420420);
  final task3 = Task(
      id: 3,
      description: 'testDescription3',
      category: 'testCategory3',
      clock: 6969);

  setUp(() async {
    // clean up db before every test
    db = new DatabaseHelper(test: true);
    await db.resetDatabase();
  });

  tearDownAll(() async {
    await db.resetDatabase();
  });

  group('Database Helper', () {
    test('insert task should put that task in the database', () async {
      // assert that the task is not in the database before inserting
      List<Task> tasks = await db.tasks();
      expect(tasks.length, 0);

      // insert task
      await db.insertTask(task);

      // assert that the task is now in the database
      tasks = await db.tasks();
      expect(tasks.length, 1);
      expect(tasks[0].id, task.id);
    });

    test('insert multiple tasks should put all of them in the database',
        () async {
      // assert that the task is not in the database before inserting
      List<Task> tasks = await db.tasks();
      expect(tasks.length, 0);

      // insert tasks
      await db.insertTask(task);
      await db.insertTask(task2);
      await db.insertTask(task3);

      // assert that the tasks are now in the database
      tasks = await db.tasks();
      expect(tasks.length, 3);
      expect(tasks[0].id, task.id);
      expect(tasks[1].id, task2.id);
      expect(tasks[2].id, task3.id);
    });

    test('update task should update them in the database', () async {
      // assert that the task is not in the database before inserting
      List<Task> tasks = await db.tasks();
      expect(tasks.length, 0);

      // insert task
      await db.insertTask(task);

      // update task
      Task updatedTask = Task(
          id: task.id,
          description: "this has been updated",
          category: task.category,
          clock: task.clock);

      await db.updateTask(updatedTask);

      // assert that the task has been updated
      updatedTask = await db.getTask(task.id);

      expect(updatedTask.id, task.id);
      expect(updatedTask.description, "this has been updated");
    });

    test('delete task should delete that task from the database', () async {
      //insert the task into the database
      await db.insertTask(task);
      //assert that the task has been inserted into the database
      List<Task> tasks = await db.tasks();
      expect(tasks.length, 1);

      //delete the task from the database
      db.deleteTask(task.id);

      //assert hat the task has been deleted from the database
      tasks = await db.tasks();
      expect(tasks.length, 0);
    });

    test('get task should get the task with an id number from the database',
        () async {
      // insert the task
      await db.insertTask(task);
      // get the task
      var taskTest = await db.getTask(task.id);
      // test the task
      expect(taskTest.description, "testDescription");
      expect(taskTest.id, 1);
    });

    test('get task that doesn\'t exist should return null', () async {
      await db.insertTask(task);
      var failTest = await db.getTask(69);
      expect(failTest, null);
    });
  });
}
