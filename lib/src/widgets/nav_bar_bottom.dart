import 'package:flutter/material.dart';

import 'package:time_tracker/src/resources/navigation_routes.dart';

class NavBarBottom extends StatelessWidget {
  final Function handleTap;
  final int selectedIndex;

  NavBarBottom({this.handleTap, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: Key('nav_bar_bottom'),
      onTap: handleTap,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
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
    );
  }
}
