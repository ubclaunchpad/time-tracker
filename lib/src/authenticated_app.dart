import 'package:flutter/material.dart';
import 'package:time_tracker/src/resources/navigation_routes.dart';

import 'package:time_tracker/src/widgets/nav_bar_bottom.dart';
import 'package:time_tracker/src/widgets/nav_bar_top.dart';
import 'package:time_tracker/src/enums/navigation_route_id.dart';

class AuthenticatedApp extends StatefulWidget {
  @override
  _AuthenticatedAppState createState() => _AuthenticatedAppState();
}

class _AuthenticatedAppState extends State<AuthenticatedApp> {
  int _selectedIndex = 0;
  bool isLoggedIn = false;
  
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _tapTaskListNavButton() {
    setState(() {
      _selectedIndex = navigationRoutes
          .indexWhere((route) => route.id == NavigationRouteId.task_list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      home: DefaultTabController(
        length: navigationRoutes.length,
        child: Scaffold(
          appBar: NavBarTop(
            title: 'Time Tracker',
            handleRightButtonClick: _tapTaskListNavButton,
          ),
          body: navigationRoutes[_selectedIndex].destination,
          bottomNavigationBar: NavBarBottom(
            handleTap: _selectPage,
            selectedIndex: _selectedIndex,
          ),
        ),
      ),
    );
  }
}
