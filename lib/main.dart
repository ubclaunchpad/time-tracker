import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Time Tracker'),
        ),
        body: Center(
          child: Text('Track your time!'),
        ),
      ),
    );
  }
}