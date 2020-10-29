import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:time_tracker/src/screens/add_task.dart';
import 'package:time_tracker/src/resources/task_categories.dart';

import '../../test_helper.dart';

void main() {
  testWidgets('Add a task', (WidgetTester tester) async {
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
    await tester.enterText(descriptionFinder, 'description');
    TextField descriptionInput = tester.widget(descriptionFinder);
    expect(descriptionInput.controller.text, equals('description'));

    // Assert ability to select category
    await tester.tap(categoryFinder);
    for (var category in TASK_CATEGORIES) {
      expect(find.text(category), findsOneWidget);
    }
    await tester.tap(find.text(TASK_CATEGORIES[0]));

    // Assert ability to add task
    await tester.tap(addButtonFinder);
  });
}
