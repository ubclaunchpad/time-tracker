import 'package:flutter/material.dart';
import '../screens/task_list.dart';

class TopNavigation extends StatefulWidget implements PreferredSizeWidget {
  TopNavigation({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);
  
  @override
  _TopNavigationState createState() => _TopNavigationState();

  @override
  final Size preferredSize;
}

class _TopNavigationState extends State<TopNavigation> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text('Time Tracker'),
        actions: [
          IconButton(
              icon: Icon(Icons.list, key: Key('task_list_icon')),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskListScreen()),
                );
              }),
        ],
      );
  }
}