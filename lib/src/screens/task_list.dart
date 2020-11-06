import 'package:flutter/material.dart';

//TODO: Replace "titles" and "subtitles" after creating a Task class
class TaskListScreen extends StatelessWidget {
  final List<String> titles = [
    'Finish Launch Pad Issue 2',
    'Write blog post for team website',
    'Clean out closet',
    'In-class exercise CPSC 304',
    'Midterm essay ASIA 311'
  ];
  final List<String> subtitles = [
    'Launch Pad - 215 minutes',
    'Triathlon - 47 minutes',
    'Apartment - 74 minutes',
    'Assignments - 23 minutes',
    'Assignments - 201 minutes'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('task_list_screen'),
      body: ListView.builder(
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
          }),
    );
  }
}
