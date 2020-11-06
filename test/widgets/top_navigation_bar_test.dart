import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:time_tracker/src/widgets/top_navigation_bar.dart';

void main() {
  testWidgets('Top Navigation Bar', (WidgetTester tester) async {
    bool isClicked = false;

    await tester.pumpWidget(MaterialApp(
        title: 'Dummy App',
        home: Scaffold(
          appBar: TopNavigationBar(
            title: 'Dummy App',
            handleRightButtonClick: () => isClicked = true,
          ),
          body: Container(),
        )));
        
    //Assert task list icon is present on screen
    expect(find.byKey(Key('task_list_icon')), findsOneWidget);
    expect(isClicked, false);

    //Click task list icon and assert click function registers
    await tester.tap(find.byKey(Key('task_list_icon')));
    await tester.pumpAndSettle();
    expect(isClicked, true);
  });
}
