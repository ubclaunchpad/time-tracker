import 'package:flutter/material.dart';

import 'package:time_tracker/src/enums/navigation_route_id.dart';

class NavigationRoute {
  final NavigationRouteId id;
  final String title;
  final Widget destination;
  final Icon icon;

  const NavigationRoute({
    @required this.id,
    @required this.title,
    @required this.destination,
    this.icon,
  });
}
