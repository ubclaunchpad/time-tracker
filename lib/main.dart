import 'package:flutter/material.dart';
import 'package:time_tracker/src/models/task.dart';
import 'package:time_tracker/src/database/database_helper.dart';
import 'dart:developer' as logger;
import 'package:time_tracker/src/time_tracker.dart';

void main() async {
  var db = new DatabaseHelper();

  // final task = TTask(id: 0, description: 'Fido', category: 'Work', clock: 2001);
  // await db.insertTask(task);
  return runApp(TimeTracker());
}