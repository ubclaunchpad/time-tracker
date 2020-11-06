import 'package:flutter/material.dart';

class TopNavigationBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function handleRightButtonClick;

  TopNavigationBar({Key key, this.title, this.handleRightButtonClick})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  _TopNavigationBarState createState() => _TopNavigationBarState();

  @override
  final Size preferredSize;
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: [
        IconButton(
            icon: Icon(Icons.list, key: Key('task_list_icon')),
            onPressed: widget.handleRightButtonClick,
            ),
      ],
    );
  }
}
