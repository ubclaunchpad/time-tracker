import 'package:flutter/material.dart';
import 'package:time_tracker/src/screens/login/register.dart';
import 'package:time_tracker/src/screens/login/sign_in.dart';

class UnauthenticatedApp extends StatefulWidget {
  @override
  _UnauthenticatedAppState createState() => _UnauthenticatedAppState();
}

class _UnauthenticatedAppState extends State<UnauthenticatedApp> {
  bool showSignIn = false;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: showSignIn
          ? SignInScreen(toggleView: toggleView)
          : RegisterScreen(toggleView: toggleView),
    );
  }
}
