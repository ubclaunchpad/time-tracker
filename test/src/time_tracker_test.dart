import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:time_tracker/src/time_tracker.dart';

void main() {
  testWidgets('Time Tracker',
      (WidgetTester tester) async {
    await tester.pumpWidget(TimeTracker());
    expect(find.byKey(Key('dashboard_screen')), findsOneWidget);
    expect(find.byKey(Key('nav_bar_top')), findsOneWidget);
    expect(find.byKey(Key('nav_bar_bottom')), findsOneWidget);
  });
}
