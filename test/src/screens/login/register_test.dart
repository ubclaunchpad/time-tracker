import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:time_tracker/src/screens/add_task.dart';
import 'package:time_tracker/src/resources/task_categories.dart';
import 'package:time_tracker/src/screens/login/register.dart';
import '../../../test_helper.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  testWidgets('Test Registration', (WidgetTester tester) async {
    await Firebase.initializeApp();
    final screen = RegisterScreen();
    await tester.pumpWidget(TestHelper.makeTestableWidget(screen));

    final emailFormFinder = find.byKey(Key('email_input'));
    final passwordFormFinder = find.byKey(Key('password_input'));
    // final registerButtonFinder = find.byType(RaisedButton);

    expect(emailFormFinder, findsOneWidget);
    expect(passwordFormFinder, findsOneWidget);

    await tester.enterText(emailFormFinder, 'dummy_email');
    TextFormField emailInput = tester.widget(emailFormFinder);
    expect(emailInput.controller.text, equals('dummy_email'));

    await tester.enterText(passwordFormFinder, 'dummy_password');
    TextFormField passwordInput = tester.widget(passwordFormFinder);
    expect(passwordInput.controller.text, equals('dummy_password'));
    // expect(addButtonFinder, findsOneWidget);
  });
}
