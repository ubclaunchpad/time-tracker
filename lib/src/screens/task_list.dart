import 'package:flutter/material.dart';
import 'package:time_tracker/src/database/database_helper.dart';
import '../models/task.dart';

class TaskListScreen extends StatelessWidget {
  Future getTasks() async {
    List<Task> taskList = await DatabaseHelper.internal().tasks();
    return taskList;
  }

  Widget taskListWidget() {
    return FutureBuilder(
        future: getTasks(),
        builder: (context, AsyncSnapshot taskListSnapshot) {
          if (taskListSnapshot.hasData) {
            return ListView.builder(
              itemCount: taskListSnapshot.data.length,
              itemBuilder: (context, index) {
                final item = taskListSnapshot.data[index].description;
                final moreInfo = taskListSnapshot.data[index].category + "\n" 
                      + (taskListSnapshot.data[index].startTime as String) + " - " 
                      + (taskListSnapshot.data[index].stopTime as String);
                return Card(
                    child: ListTile(
                      key: Key('list_tile_$index'),
                      title: Text(item),
                      subtitle: Text(moreInfo),
                      isThreeLine: true,
                  ));
              },
            );
          }else{
            return Container();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('task_list_screen'),
      body: taskListWidget(),
    );
  }
}