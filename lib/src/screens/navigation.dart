import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'add_task.dart';
import 'task_list_temp.dart'; // TODO: Change after Issue #2 merged
import 'profile.dart';
import '../models/nav_page.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<NavPage> _pages = [
    NavPage(
      title: 'Dashboard',
      view: DashboardScreen(),
      icon: Icon(Icons.list, key: Key('dashboard-icon')),
    ),
    NavPage(
      title: 'Timer',
      view: AddTaskScreen(),
      icon: Icon(Icons.timer, key: Key('timer-icon')),
    ),
    NavPage(
      title: 'Stats',
      view: TaskListScreen(),
      icon: Icon(Icons.bar_chart_outlined, key: Key('stats-icon')),
    ),
    NavPage(
      title: 'Profile',
      view: ProfileScreen(),
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
        body: _pages[_selectedPageIndex].view,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              label: _pages[0].title,
              icon: _pages[0].icon,
            ),
            BottomNavigationBarItem(
              label: _pages[1].title,
              icon: _pages[1].icon,
            ),
            BottomNavigationBarItem(
              label: _pages[2].title,
              icon: _pages[2].icon,
            ),
            BottomNavigationBarItem(
              label: _pages[3].title,
              icon: _pages[3].icon,
            ),
          ],
        ),
      ),
    );
  }
}
