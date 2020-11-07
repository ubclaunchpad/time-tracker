import 'package:flutter/material.dart';
import 'package:time_tracker/src/resources/task_categories.dart';
import 'package:time_tracker/src/utils/time_util.dart';

class ScheduleTaskScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      key: Key('schedule_task_screen'),
      child: Text('Schedule a task!'),
    );
    }
}