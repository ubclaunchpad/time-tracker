import 'package:flutter/material.dart';
import 'package:time_tracker/src/services/auth.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggleView;

  RegisterScreen({this.toggleView});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        actions: [
          FlatButton.icon(
            onPressed: widget.toggleView,
            icon: Icon(Icons.person),
            label: Text('Sign In'),
          ),
        ],
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: Key('email_input'),
                onChanged: (input) {
                  setState(() => email = input);
                },
                validator: (input) => input.isEmpty ? 'Enter an email' : null,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: Key('password_input'),
                onChanged: (input) {
                  setState(() => password = input);
                },
                obscureText: true,
                validator: (input) =>
                input.length < 6 ? 'Enter a password 6+ chars long' : null,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                    await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        errorMessage = 'Please supply a valid email';
                      });
                    }
                  }
                },
                child: Text("Register"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                errorMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
