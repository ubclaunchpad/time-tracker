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
	List<String> titles = ['Finish Launch Pad Issue 2','Write blog post for team website',
			'Clean out closet','In-class exercise CPSC 304','Midterm essay ASIA 311'];
	@override
	Widget build(BuildContext context) {
		return _myListView(context);
	}

	Widget _myListView(BuildContext context) {
	/*
	Widget column = Expanded(
		child: Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Text('Finish Launch Pad Issue 2',style:TextStyle(fontSize:16),),
				Text('Extracurriculars'),
				Text('215 minutes'),
				Text('Write blog post for team website',style:TextStyle(fontSize:16),),
                                Text('Triathlon'),
                                Text('43 minutes'),
				Text('Reorganize Closet',style:TextStyle(fontSize:16),),
                                Text('Apartment'),
                                Text('74 minutes'),
			],
		),
	);*/
	return ListView.builder(
		itemCount: titles.length,
		itemBuilder:(context,index){
			final item = titles[index];
			return Card(
				child:ListTile(
					title: Text(item),
				),
			);
		}
	);
} 
}
