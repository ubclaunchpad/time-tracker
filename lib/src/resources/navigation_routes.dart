import 'package:flutter/material.dart';

import '../screens/dashboard.dart';
import '../screens/add_task.dart';
import '../screens/task_list.dart';
import '../screens/profile.dart';
import '../models/navigation_route.dart';

final bottomNavigationRoutes = <NavigationRoute>[
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
