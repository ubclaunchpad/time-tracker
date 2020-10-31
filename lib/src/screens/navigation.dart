import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'add_task.dart';
import 'task_list_temp.dart'; // TODO: Change after Issue #2 merged
import 'profile.dart';
import '../models/navigation_route.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<NavigationRoute> _pages = [
    NavigationRoute(
      title: 'Dashboard',
      destination: DashboardScreen(),
      icon: Icon(Icons.list, key: Key('dashboard-icon')),
    ),
    NavigationRoute(
      title: 'Timer',
      destination: AddTaskScreen(),
      icon: Icon(Icons.timer, key: Key('timer-icon')),
    ),
    NavigationRoute(
      title: 'Stats',
      destination: TaskListScreen(),
      icon: Icon(Icons.bar_chart_outlined, key: Key('stats-icon')),
    ),
    NavigationRoute(
      title: 'Profile',
      destination: ProfileScreen(),
      icon: Icon(Icons.person, key: Key('profile-icon')),
    ),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex].title),
        ),
        body: _pages[_selectedPageIndex].destination,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedPageIndex,
          items: _pages
              .asMap()
              .map((index, page) => MapEntry(
                    index,
                    BottomNavigationBarItem(
                      label: _pages[index].title,
                      icon: _pages[index].icon,
                    ),
                  ))
              .values
              .toList(),
        ),
      ),
    );
  }
}
