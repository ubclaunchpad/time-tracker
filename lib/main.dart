import 'package:flutter/material.dart';
import 'src/screens/add_task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      home: AddTaskScreen(),
    );
  }
}
