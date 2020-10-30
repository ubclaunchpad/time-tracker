import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:time_tracker/main.dart';

void main() {
  testWidgets('Project builds and displays Add Task screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byKey(Key('add_task_screen')), findsOneWidget);
  });
}
