import 'package:flutter/material.dart';

// TODO: Replace categories to use Task class after Issue #3 is completed
// TODO: Refactor styles to use global theming after more designer guidance

import '../resources/task_categories.dart';
import '../utils/time_util.dart';
import '../widgets/top_navigation.dart';

// TODO: Replace categories to use Task class after Issue #3 is completed
// TODO: Refactor styles to use global theming after more designer guidance

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _descriptionController = TextEditingController();
  final _stopwatch = Stopwatch();
  String _selectedCategory;

  var _isTracking = false;
  String _lastDescription;
  String _lastCategory;
  Duration _lastDuration;

  void _startTrackingTask() {
    if (_descriptionController.text.isNotEmpty && _selectedCategory != null) {
      setState(() {
        _isTracking = true;
        _stopwatch.reset();
        _stopwatch.start();
      });
    }
  }

  void _stopTrackingTask() {
    setState(() {
      _isTracking = false;
      _stopwatch.stop();
      _lastDescription = _descriptionController.text;
      _lastCategory = _selectedCategory;
      _lastDuration = _stopwatch.elapsed;
      _descriptionController.clear();
      _selectedCategory = null;
    });
  }

  Widget _renderDescriptionInputField() => TextField(
        key: Key('add_task_description_input'),
        decoration: InputDecoration(
          labelText: 'Task description',
        ),
        controller: _descriptionController,
      );

  Widget _renderCategorySelector() => DropdownButton<String>(
        key: Key('add_task_category_selector'),
        hint: Text('Select task category'),
        isExpanded: true,
        value: _selectedCategory,
        onChanged: (String newCategory) {
          setState(() => _selectedCategory = newCategory);
        },
        items: TASK_CATEGORIES
            .map<DropdownMenuItem<String>>(
              (category) => DropdownMenuItem<String>(
                value: category,
                child: Text(
                  category,
                  key: ValueKey('dropdown-$category'),
                ),
              ),
            )
            .toList(),
      );

  Widget _renderAddTaskButton() => FlatButton(
        key: Key('add_task_button'),
        onPressed: _startTrackingTask,
        color: Colors.blue,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 5.0,
          ),
          child: Text(
            'Add Task',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget _renderTimeElapsed() {
    return Column(
      children: <Widget>[
        Divider(
          color: Colors.black,
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Text(
                'Last Task & Time Taken',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                '$_lastDescription ($_lastCategory)',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 10),
              Text(
                TimeUtil.getDurationString(_lastDuration),
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderTaskAdding() {
    return Column(
      children: <Widget>[
        _renderDescriptionInputField(),
        SizedBox(height: 10),
        _renderCategorySelector(),
        SizedBox(height: 80),
        _renderAddTaskButton(),
        SizedBox(height: 40),
        _lastDuration != null ? _renderTimeElapsed() : Container(),
      ],
    );
  }

  Widget renderTaskTracking() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Task Description',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(_descriptionController.text),
        SizedBox(height: 10),
        Text(
          'Task Category',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(_selectedCategory),
        SizedBox(height: 20),
        FlatButton(
          color: Colors.redAccent,
          onPressed: _stopTrackingTask,
          child: Text(
            'Stop Tracking',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('add_task_screen'),
      appBar: TopNavigation(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 30.0,
          ),
          child: !_isTracking ? renderTaskAdding() : renderTaskTracking(),
        ),
      ),
    );
  }
}
