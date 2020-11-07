import 'package:flutter/material.dart';

import 'package:time_tracker/src/time_tracker.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TimeTracker());
}
