import 'package:flutter/material.dart';
import 'package:time_tracker/models/task.dart';
import 'package:time_tracker/database/database_helper.dart';
import 'dart:developer' as logger;
import 'package:time_tracker/src/time_tracker.dart';

void main() async {
  var db = new DatabaseHelper();

  // final task = Task(id: 0, description: 'Fido', category: 'Work', clock: 2001);
  // await db.insertTask(task);
  return runApp(TimeTracker());
}