import 'package:flutter/material.dart';
import 'package:time_tracker/src/resources/task_categories.dart';
import 'package:time_tracker/src/utils/time_util.dart';

class ScheduleTaskScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: Key('schedule_task_screen'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 30.0,
            ),
            child: renderTaskScheduling()),)
    );
  }
  
}

Widget renderTaskScheduling(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget> [
      SizedBox(height:30),
      _renderTextField('Task title'),
      SizedBox(height:20),
      _renderTextField('Date'),
      SizedBox(height:20),
      Row(children: <Widget>[
        Expanded(child: _renderTextField('Start time'),),
        Expanded(child: _renderTextField('End time')),
      ],),
      SizedBox(height:30),
      Text('Category'),
    ],);
}

Widget _renderTextField(String title) => TextField(
  decoration: InputDecoration(
    border: InputBorder.none,
    labelText: title,
  ),
);
