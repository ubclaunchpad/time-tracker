import 'package:flutter/material.dart';

import 'package:time_tracker/src/enums/navigation_route_id.dart';
import 'package:time_tracker/src/models/navigation_route.dart';
import 'package:time_tracker/src/screens/add_task.dart';
import 'package:time_tracker/src/screens/dashboard.dart';
import 'package:time_tracker/src/screens/profile.dart';
import 'package:time_tracker/src/screens/task_list.dart';

final navigationRoutes = <NavigationRoute>[
  NavigationRoute(
    id: NavigationRouteId.dashboard,
    title: 'Dashboard',
    destination: DashboardScreen(),
    icon: Icon(Icons.list, key: Key('dashboard-icon')),
  ),
  NavigationRoute(
    id: NavigationRouteId.add_task,
    title: 'Timer',
    destination: AddTaskScreen(),
    icon: Icon(Icons.timer, key: Key('timer-icon')),
  ),
  NavigationRoute(
    id: NavigationRouteId.task_list,
    title: 'Stats',
    destination: TaskListScreen(),
    icon: Icon(Icons.bar_chart_outlined, key: Key('stats-icon')),
  ),
  NavigationRoute(
    id: NavigationRouteId.profile,
    title: 'Profile',
    destination: ProfileScreen(),
    icon: Icon(Icons.person, key: Key('profile-icon')),
  ),
];
