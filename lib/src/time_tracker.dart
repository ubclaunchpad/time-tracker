import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/src/app_wrapper.dart';
import 'package:time_tracker/src/authenticated_app.dart';
import 'package:time_tracker/src/models/user.dart';
import 'package:time_tracker/src/services/auth.dart';
import 'package:time_tracker/src/screens/login/unauthenticated_app.dart';

class TimeTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: AppWrapper(),
    );
    // return
  }
}
