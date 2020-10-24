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

abstract class ListItem {
	Widget buildTitle(BuildContext context);
	Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem{
	final String heading;
	HeadingItem(this.heading);
	Widget buildTitle(BuildContext context){
	     return Text(
	          heading,
                  style: Theme.of(context).textTheme.headline5,
	);
     } 
     Widget buildSubtitle(BuildContext context) => null;
}

class MessageItem implements ListItem { 
     final String sender;
     final String body;
     MessageItem(this.sender, this.body);
     Widget buildTitle(BuildContext context) => Text(sender);
     Widget buildSubtitle(BuildContext context) => Text(body);
}
			 
