import 'package:flutter/material.dart';

class TestHelper {
  static Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }
}
