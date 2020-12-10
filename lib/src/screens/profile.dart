import 'dart:io';

import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String title;
  final String value;

  const Field({Key key, this.title, this.value}): super(key: key);

  @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
          SizedBox(height: 5), // for padding
          Text(
            value,
          ),
          SizedBox(height: 15), // for padding
        ]
      );
    }
  }

class ProfileScreen extends StatelessWidget {
  final bool test;

  ProfileScreen({Key key, this.test}): super(key: key);
   
  // contains picture and name
  Widget header = Container(
    padding: EdgeInsets.only(top: 50),
    child: Column(
      children: [
        !Platform.environment.containsKey('FLUTTER_TEST') ?
          CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/564x/d7/b9/a9/d7b9a9e2d09a1ef6feafd0c4b0b275c6.jpg'),
            radius: 50,
          ) : Text('placeholder'),
        SizedBox(height: 10), // for padding
        Text(
          'John Doe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32
          ),
        )
      ]
    )
  );

  Widget mainContainer = Container(
    padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis molestie turpis a mauris porta hendrerit. Phasellus ornare auctor purus sit amet tristique. Cras facilisis vitae lectus eget mattis. Quisque vitae mauris vitae magna posuere hendrerit ut id ipsum.',
        ),
        SizedBox(height: 10), // for padding
        new Field(title: 'Name', value: 'Kyle Ferguson'),
        new Field(title: 'Email', value: 'kyleferguson@gmail.com'),
        new Field(title: 'Password', value: '***************'),
      ]
    )
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: Key('profile_screen'),
      child: Column(
        children: [
          header,
          mainContainer
        ]
      ),

    );
  }
}
