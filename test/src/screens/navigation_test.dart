import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:time_tracker/src/screens/navigation.dart';

void main() {
  testWidgets('Navigation Screen', (WidgetTester tester) async {
    final screen = MaterialApp(home: NavigationScreen());
    await tester.pumpWidget(screen);

    final dashboardScreenFinder = find.byKey(Key('dashboard_screen'));
    final timerScreenFinder = find.byKey(Key('add_task_screen'));
    final statsScreenFinder = find.byKey(Key('task_list_screen'));
    final profileScreenFinder = find.byKey(Key('profile_screen'));

    // Assert start at dashboard screen
    expect(dashboardScreenFinder, findsOneWidget);
    expect(timerScreenFinder, findsNothing);
    expect(statsScreenFinder, findsNothing);
    expect(profileScreenFinder, findsNothing);

    // Tap on timer icon
    await tester.tap(find.byKey(Key('timer-icon')));
    await tester.pump(const Duration(seconds: 1));

    // Assert move to timer screen
    expect(dashboardScreenFinder, findsNothing);
    expect(timerScreenFinder, findsOneWidget);
    expect(statsScreenFinder, findsNothing);
    expect(profileScreenFinder, findsNothing);

    // Tap on stats icon
    await tester.tap(find.byKey(Key('stats-icon')));
    await tester.pump(const Duration(seconds: 1));

    // Assert start to stats screen
    expect(dashboardScreenFinder, findsNothing);
    expect(timerScreenFinder, findsNothing);
    expect(statsScreenFinder, findsOneWidget);
    expect(profileScreenFinder, findsNothing);

    // Tap on profile icon
    await tester.tap(find.byKey(Key('profile-icon')));
    await tester.pump(const Duration(seconds: 1));

    // Assert move to profile screen
    expect(dashboardScreenFinder, findsNothing);
    expect(timerScreenFinder, findsNothing);
    expect(statsScreenFinder, findsNothing);
    expect(profileScreenFinder, findsOneWidget);

    // Tap on dashboard icon
    await tester.tap(find.byKey(Key('dashboard-icon')));
    await tester.pump(const Duration(seconds: 1));

    // Assert move to dashboard screen
    expect(dashboardScreenFinder, findsOneWidget);
    expect(timerScreenFinder, findsNothing);
    expect(statsScreenFinder, findsNothing);
    expect(profileScreenFinder, findsNothing);

    // Tap on task list icon on top navigator bar
    await tester.tap(find.byKey(Key('task_list_icon')));

    // Click task list icon and assert page navigates to Task List Screen
    await tester.tap(find.byKey(Key('task_list_icon')));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('task_list_screen')), findsOneWidget);
  });
}
