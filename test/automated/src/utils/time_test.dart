import 'package:flutter_test/flutter_test.dart';

import 'package:time_tracker/src/utils/time_util.dart';

void main() {
  test('Convert duration into expected string format', () {
    const actualDuration = Duration(hours: 4, minutes: 40, seconds: 9);
    expect(TimeUtil.getDurationString(actualDuration), '04:40:09');
  });
}
