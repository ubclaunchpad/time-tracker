import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:time_tracker/src/widgets/top_navigation.dart';

void main() {
  testWidgets('Top Navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        title: 'dummy_app',
        home: Scaffold(
          appBar: TopNavigation(),
          body: Container(),
        )));
        
    //Assert task list icon is present on screen
    expect(find.byKey(Key('task_list_icon')), findsOneWidget);

    //Click task list icon and assert page navigates to Task List Screen
    await tester.tap(find.byKey(Key('task_list_icon')));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('task_list_screen')), findsOneWidget);
  });
}
