import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:time_tracker/src/screens/add_task.dart';
import 'package:time_tracker/src/resources/task_categories.dart';

import '../../test_helper.dart';

void main() {
  testWidgets('Add Task Screen', (WidgetTester tester) async {
    final screen = AddTaskScreen();
    await tester.pumpWidget(TestHelper.makeTestableWidget(screen));

    final descriptionFinder = find.byKey(Key('add_task_description_input'));
    final categoryFinder = find.byKey(Key('add_task_category_selector'));
    final addButtonFinder = find.byKey(Key('add_task_button'));

    // Assert all input fields exist
    expect(descriptionFinder, findsOneWidget);
    expect(categoryFinder, findsOneWidget);
    expect(addButtonFinder, findsOneWidget);

    // Assert ability to add description
    await tester.enterText(descriptionFinder, 'dummy_task');
    TextField descriptionInput = tester.widget(descriptionFinder);
    expect(descriptionInput.controller.text, equals('dummy_task'));

    // Assert ability to select category
    await tester.tap(categoryFinder);

    for (var category in TASK_CATEGORIES) {
      expect(find.text(category), findsOneWidget);
    }

    await tester.pump(const Duration(seconds: 1));

    for (var category in TASK_CATEGORIES) {
      expect(find.text(category), findsNWidgets(2));
    }

    await tester.tap(find.byKey(Key('dropdown-${TASK_CATEGORIES[0]}')).last);

    await tester.pump(const Duration(seconds: 1));

    // Assert ability to add task
    await tester.tap(find.text('Add Task'));

    await tester.pump(const Duration(seconds: 1));

    // Assert task is tracked
    find.text('Task Description');
    find.text('dummy_task');
    find.text('Task Category');
    find.text(TASK_CATEGORIES[0]);
    find.text('Stop Tracking');

    // Stop task
    await tester.tap(find.text('Stop Tracking'));
    await tester.pump(const Duration(seconds: 1));

    // Assert ability to move to Schedule Task Screen using Schedule Task Button
    final scheduleTaskButtonFinder  = find.byKey(Key('schedule_task_button'));
    expect(scheduleTaskButtonFinder, findsOneWidget);
    await tester.tap(scheduleTaskButtonFinder);
    await tester.pumpAndSettle();
    expect(find.byKey(Key('schedule_task_screen')), findsOneWidget);
  });
}
