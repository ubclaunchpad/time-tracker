import 'package:flutter/material.dart';

import '../resources/navigation_routes.dart';

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: bottomNavigationRoutes.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(bottomNavigationRoutes[_selectedPageIndex].title),
        ),
        body: bottomNavigationRoutes[_selectedPageIndex].destination,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedPageIndex,
          items: bottomNavigationRoutes
              .asMap()
              .map((index, page) => MapEntry(
                    index,
                    BottomNavigationBarItem(
                      label: bottomNavigationRoutes[index].title,
                      icon: bottomNavigationRoutes[index].icon,
                    ),
                  ))
              .values
              .toList(),
        ),
      ),
    );
  }
}
