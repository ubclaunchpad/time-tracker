import 'package:flutter/material.dart';
import 'package:time_tracker/src/resources/task_categories.dart';
import 'package:time_tracker/src/utils/time_util.dart';

class ScheduleTaskScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _scheduleTaskScreenState();
}

class _scheduleTaskScreenState extends State<StatefulWidget>{
   Widget build(BuildContext context) {
    return Scaffold(
      key: Key('schedule_task_screen'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 30.0,
            ),
            child: renderTaskScheduling()),)
    );
  }
}

Widget renderTaskScheduling(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget> [
      SizedBox(height:30),
      _renderTextField('Task title'),
      SizedBox(height:20),
      _renderTextField('Date'),
      SizedBox(height:20),
      _renderSideBySideText('Start time', 'End time'),
      SizedBox(height: 30),
      Container(child: Text('Categories')),
      SizedBox(height:7),
      _renderCategoryChoices(),
      SizedBox(height:15),
      Container(child: Text('Details')),
    ],);
}

Widget _renderTextField(String title) => TextField(
  decoration: InputDecoration(
    border: InputBorder.none,
    labelText: title,
  ),
);

Widget _renderSideBySideText(String left, String right) => Row(
  children: <Widget>[
    Expanded(child: _renderTextField(left),),
    Expanded(child: _renderTextField(right)),
  ],
);

Widget _renderCategoryChoices(){
  var catButtons = new List<Widget>();
  for(int i = 0; i < TASK_CATEGORIES.length; i++){
    catButtons.add(
      FlatButton(
        onPressed: () {},
        child: Text(TASK_CATEGORIES[i]),
        color: Colors.lightBlue[50],
      )
    );
  }
  return Row(
      key: Key('toggle buttons category choice'),
      children: catButtons,
  );
}

/*
void colourButtons(int x, List<Widget> catButtons){
  for(int i = 0; i < catButtons.length; i++){
    if(i == x){
      catButtons[i] = FlatButton(
        onPressed: () { colourButtons(i, catButtons);},
        child: Text(TASK_CATEGORIES[i]),
        color: Colors.lightBlue[300],
      );
    }
  }
}*/