import 'package:flutter/material.dart';

import 'package:time_tracker/src/enums/navigation_route_id.dart';
import 'package:time_tracker/src/widgets/top_navigation_bar.dart';
import 'package:time_tracker/src/resources/navigation_routes.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _tapTaskListNavButton() {
    setState(() {
      _selectedPageIndex = navigationRoutes
          .indexWhere((route) => route.id == NavigationRouteId.task_list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: navigationRoutes.length,
      child: Scaffold(
        appBar: TopNavigationBar(
          title: 'Time Tracker',
          handleRightButtonClick: _tapTaskListNavButton,
        ),
        body: navigationRoutes[_selectedPageIndex].destination,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedPageIndex,
          items: navigationRoutes
              .asMap()
              .map((index, page) => MapEntry(
                    index,
                    BottomNavigationBarItem(
                      label: navigationRoutes[index].title,
                      icon: navigationRoutes[index].icon,
                    ),
                  ))
              .values
              .toList(),
        ),
      ),
    );
  }
}
