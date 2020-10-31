import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker/src/screens/profile.dart';

import '../../test_helper.dart';

void main() {
  testWidgets('Profile Screen', (WidgetTester tester) async {
    final screen = ProfileScreen();
    await tester.pumpWidget(TestHelper.makeTestableWidget(screen));

    // Placeholder test - replace after implementing screen features
    expect(find.text('Profile'), findsOneWidget);
  });
}
