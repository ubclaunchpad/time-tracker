import 'package:flutter/material.dart';

class NavPage {
  final String title;
  final Widget view;
  final Icon icon;

  const NavPage({
    @required this.title,
    @required this.view,
    this.icon,
  });
}
