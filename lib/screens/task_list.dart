import 'package:flutter/material.dart';

class TaskListScreen extends StatelessWidget {

        @override
        Widget build(BuildContext context){
                return Scaffold(
                        appBar: AppBar(
                           title: Text('Task List'),
                        ),
                        body: Center(
                           child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                        new Text(
                                         'Task List Screen',
                                        ),
                                ],
                           )
                        )
                );
        }
}

