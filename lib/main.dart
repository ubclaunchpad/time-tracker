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
        ),
        body: Center(
	  child: RaisedButton(
             child: Text('Track your time!'),
	     color: Theme.of(context).primaryColor,
	     textColor: Colors.white,
 	     onPressed: (){
	        Navigator.push(context, MaterialPageRoute(builder:(context) => TaskListScreen()),
	     );
	   }
        ),
      ),
   );
  }
}
