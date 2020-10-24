import 'package:flutter/material.dart';
// import 'package:time_tracker/models/task.dart';
// import 'package:time_tracker/database/database_helper.dart';

void main() async {
  // var db = new DatabaseHelper();

  // final task = Task(id: 0, description: 'Fido', category: 'Work', time: 2001);
  // await db.insertTask(task);

  // print(await db.tasks());

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Time Tracker'),
        ),
        body: Center(
          child: Text('Track your time!'),
        ),
      ),
    );
  }
}
