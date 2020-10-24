import 'package:flutter/material.dart';
import 'screens/task_list.dart';

void main() => runApp(MaterialApp(
    title: "Time Tracker",
    home: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Time Tracker'),
	  actions:[
		IconButton(icon: Icon(Icons.list),
	 	onPressed:(){
			Navigator.push(context,MaterialPageRoute(builder:(context)=>TaskListScreen()),);
		}),	
	  ],
        ),
        body: Center(
          child: Text('Track your time!'),
        ),
     );
    }
 }

