import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker/src/screens/task_list.dart';

import '../../test_helper.dart';

void main() {
  testWidgets('Task List Test', (WidgetTester tester) async {
    final screen = TaskListScreen();
    await tester.pumpWidget(TestHelper.makeTestableWidget(screen));
    expect(find.byKey(Key('list_tile_0')), findsOneWidget);
    expect(find.byKey(Key('list_tile_1')), findsOneWidget);
    expect(find.byKey(Key('list_tile_2')), findsOneWidget);
    expect(find.byKey(Key('list_tile_3')), findsOneWidget);
    expect(find.byKey(Key('list_tile_4')), findsOneWidget);
  });
}