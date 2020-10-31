import 'package:flutter/material.dart';
import 'package:time_tracker/src/screens/navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      home: NavigationScreen(),
    );
  }
}
