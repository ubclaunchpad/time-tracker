import 'package:flutter/material.dart';

class NavigationRoute {
  final String title;
  final Widget destination;
  final Icon icon;

  const NavigationRoute({
    @required this.title,
    @required this.destination,
    this.icon,
  });
}
