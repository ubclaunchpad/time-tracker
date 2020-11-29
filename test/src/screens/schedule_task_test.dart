import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:time_tracker/src/screens/schedule_task.dart';
import 'package:time_tracker/src/resources/task_categories.dart';

import '../../test_helper.dart';

void main(){
  testWidgets('Schedule Task Test', (WidgetTester tester) async {
    final screen = ScheduleTaskScreen();
    await tester.pumpWidget(TestHelper.makeTestableWidget(screen));

    final titleFieldFinder = find.byKey(Key('text_field_Task title'));
    final dateFieldFinder = find.byKey(Key('text_field_Date'));
    final startTimeFieldFinder = find.byKey(Key('text_field_Start time'));
    final endTimeFieldFinder = find.byKey(Key('text_field_End time'));
    final categoriesButtonsFinderAll = find.byKey(Key('buttons_Categories'));
    final detailsFieldFinder = find.byKey(Key('text_field_Details'));
    final saveButtonFinder = find.byKey(Key('save_scheduled_task_button'));

    // Assert title text field exists and user can add title
    expect(titleFieldFinder, findsOneWidget);
    await tester.enterText(titleFieldFinder, 'dummy_title');
    TextField titleInput = tester.widget(titleFieldFinder);
    expect(titleInput.controller.text, equals('dummy_title'));
    
    // Assert date text field exists and user can add date
    expect(dateFieldFinder, findsOneWidget); 
    await tester.enterText(dateFieldFinder, 'dummy_date');
    TextField dateInput = tester.widget(dateFieldFinder);
    expect(dateInput.controller.text, equals('dummy_date'));

    // Assert start time text field exists and user can add start time
    expect(startTimeFieldFinder, findsOneWidget);
    await tester.enterText(startTimeFieldFinder, 'dummy_start_time');
    TextField startTimeInput = tester.widget(startTimeFieldFinder);
    expect(startTimeInput.controller.text, equals('dummy_start_time'));

    // Assert end time text field exists and user can add end time
    expect(endTimeFieldFinder, findsOneWidget);
    await tester.enterText(endTimeFieldFinder, 'dummy_end_time');
    TextField endTimeInput = tester.widget(endTimeFieldFinder);
    expect(endTimeInput.controller.text, equals('dummy_end_time'));

    // Assert categories button list exists and each button can be pressed
    expect(categoriesButtonsFinderAll, findsOneWidget);  
    for(var category in TASK_CATEGORIES){
      var categoryButtonFinder = find.byKey(Key('flat_button_$category'));
      expect(categoryButtonFinder, findsOneWidget);
      await tester.tap(categoryButtonFinder);
    }
  
    // Assert details text field exists and user can add details
    expect(detailsFieldFinder, findsOneWidget);  
    await tester.enterText(detailsFieldFinder, 'dummy_details');
    TextField detailsInput = tester.widget(detailsFieldFinder);
    expect(detailsInput.controller.text, equals('dummy_details'));

    // Assert save button exists and user can press it
    expect(saveButtonFinder, findsOneWidget); 
    await tester.tap(saveButtonFinder);
    await tester.pump();
    
    // Assert label for categories buttons "Categories" exists
    expect(find.byKey(Key('Categories_text')), findsOneWidget);

    // Assert app bar at top of page exists
    expect(find.byKey(Key('top_app_bar')), findsOneWidget);    
  });
}