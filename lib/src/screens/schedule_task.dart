import 'package:flutter/material.dart';
import 'package:time_tracker/src/resources/task_categories.dart';
import 'package:time_tracker/src/utils/time_util.dart';

class ScheduleTaskScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _scheduleTaskScreenState();
}

class _scheduleTaskScreenState extends State<StatefulWidget>{
  final startTextFieldController = TextEditingController();
  final endTextFieldController = TextEditingController();
  final taskTitleFieldController = TextEditingController();
  final dateFieldController = TextEditingController();
  final detailsFieldController = TextEditingController();
  String _finalCategory;
  String _currentCategory;
  String _taskTitle;
  String _date;
  String _startTime;
  String _endTime;
  String _details;
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('schedule_task_screen'),
      appBar: _renderTopAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 30.0,
            ),
            child: renderTaskScheduling()),)
    );
  }

Widget renderTaskScheduling()=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget> [
      _renderTextField('Task title', taskTitleFieldController),
      SizedBox(height:20),
      _renderTextField('Date', dateFieldController),
      SizedBox(height:20),
      _renderSideBySideText('Start time',startTextFieldController, 'End time',endTextFieldController),
      SizedBox(height: 30),
      Container(child: Text('Categories')),
      SizedBox(height:7),
      _renderCategoryChoices(),
      SizedBox(height:15),
      _renderTextField('Details', detailsFieldController),
      SizedBox(height: 110),
      _renderSaveButton(),
    ],);

Widget _renderTextField(String title, TextEditingController textFieldLabel) => TextField(
  key: Key('text_field_$title'),
  controller: textFieldLabel,
  decoration: InputDecoration(
    border: InputBorder.none,
    labelText: title,
  ),
);

Widget _renderSideBySideText(String left, TextEditingController leftFieldLabel, String right, TextEditingController rightFieldLabel) => Row(
  key: Key('side_by_side_text_$left'+'_$right'),
  children: <Widget>[
    Expanded(child: _renderTextField(left,leftFieldLabel)),
    Expanded(child: _renderTextField(right,rightFieldLabel)),
  ],
);

Widget _renderCategoryChoices() => Container(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: TASK_CATEGORIES.length,
        itemBuilder: (context,index){
        final category = TASK_CATEGORIES[index];
        return Container(
          child: FlatButton(
              //key: 
              onPressed: () {
                _currentCategory = category;
              },
              child: Text(category),
              color: Colors.lightBlue[50],
          ),
        );
      }
  ));

Widget _renderTopAppBar() => AppBar(
        title: Text('Schedule Task'),
        centerTitle: true,
      );

Widget _renderSaveButton() =>  ElevatedButton(
    key: Key('save_scheduled_task_button'),
    child: Text('Save'), 
      onPressed: (){
        _finalCategory = _currentCategory;
        _currentCategory = null;
        _taskTitle = taskTitleFieldController.text;
        taskTitleFieldController.clear();
        _date = dateFieldController.text;
        dateFieldController.clear();
        _startTime = startTextFieldController.text;
        startTextFieldController.clear();
        _endTime = endTextFieldController.text;
        endTextFieldController.clear();
        _details = detailsFieldController.text;
        detailsFieldController.clear();
      }
);

void dispose() {
    // Clean up the controller when the widget is disposed.
    startTextFieldController.dispose();
    super.dispose();
  }

}