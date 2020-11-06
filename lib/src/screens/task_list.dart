import 'package:flutter/material.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('task_list_screen'),
      appBar: AppBar(title: Text('Task List')),
      body: BodyLayout(),
    );
  }
}

//TODO: Replace "titles" and "subtitles" after creating a Task class
class BodyLayout extends StatelessWidget {
  List<String> titles = [
    'Finish Launch Pad Issue 2',
    'Write blog post for team website',
    'Clean out closet',
    'In-class exercise CPSC 304',
    'Midterm essay ASIA 311'
  ];
  List<String> subtitles = [
    'Launch Pad - 215 minutes',
    'Triathlon - 47 minutes',
    'Apartment - 74 minutes',
    'Assignments - 23 minutes',
    'Assignments - 201 minutes'
  ];
  @override
  Widget build(BuildContext context) {
    return listOfTasks(context);
  }

  Widget listOfTasks(BuildContext context) {
    return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          final item = titles[index];
          final moreInfo = subtitles[index];
          return Card(
            child: ListTile(
              key: Key('list_tile_$index'),
              title: Text(item),
              subtitle: Text(moreInfo),
            ),
          );
        });
  }
}
