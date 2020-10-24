import 'package:flutter/material.dart';

class TaskListScreen extends StatelessWidget {
    
	@override
	Widget build(BuildContext context){
		return Scaffold(
			appBar: AppBar(title: Text('Task List')),
      			body: BodyLayout(),
			);
  	}
}
			 
class BodyLayout extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return _myListView(context);
	}
}

Widget _myListView(BuildContext context) {
	Widget column = Expanded(
		child: Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Text('Finish Launch Pad Issue 2',style:TextStyle(fontSize:16),),
				Text('Extracurriculars'),
				Text('215 minutes'),
			],
		),
	);
	return ListView.builder(
		itemBuilder:(context,index){
			return Card(
				child:Padding(
					padding: const EdgeInsets.all(8.0),
					child: Row(
						children: <Widget>[
							column,
]
),
),
);
}
);
} 

