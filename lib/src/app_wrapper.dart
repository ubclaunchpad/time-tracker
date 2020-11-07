import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/src/authenticated_app.dart';
import 'package:time_tracker/src/models/user.dart';
import 'package:time_tracker/src/screens/login/unauthenticated_app.dart';

class AppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user == null? UnauthenticatedApp(): AuthenticatedApp();
  }
}
