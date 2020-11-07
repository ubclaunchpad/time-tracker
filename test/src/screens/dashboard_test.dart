import 'package:flutter_test/flutter_test.dart';

import 'package:time_tracker/src/screens/dashboard.dart';
import '../../test_helper.dart';

void main() {
  testWidgets('Dashboard Screen', (WidgetTester tester) async {
    final screen = DashboardScreen();
    await tester.pumpWidget(TestHelper.makeTestableWidget(screen));

    // Placeholder test - replace after implementing screen features
    expect(find.text('Dashboard'), findsOneWidget);
  });
}
