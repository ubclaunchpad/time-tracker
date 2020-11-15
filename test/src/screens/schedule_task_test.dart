import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:time_tracker/src/screens/schedule_task.dart';
import 'package:time_tracker/src/resources/task_categories.dart';

import '../../test_helper.dart';

void main(){
  testWidgets('Schedule Task Test', (WidgetTester tester) async {
    final screen = ScheduleTaskScreen();
    await tester.pumpWidget(TestHelper.makeTestableWidget(screen));
    
    // Assert each of the 5 list tiles representing tasks are present
    expect(find.byKey(Key('text_field_Task title')), findsOneWidget);
    expect(find.byKey(Key('text_field_Date')), findsOneWidget);  
    expect(find.byKey(Key('text_field_Start time')), findsOneWidget);
    expect(find.byKey(Key('text_field_End time')), findsOneWidget); 
    expect(find.byKey(Key('text_field_Categories')), findsOneWidget);  
    expect(find.byKey(Key('text_field_Details')), findsOneWidget); 
  }
}