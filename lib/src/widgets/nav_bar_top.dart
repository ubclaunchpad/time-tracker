import 'package:flutter/material.dart';

class NavBarTop extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function handleRightButtonClick;

  NavBarTop({Key key, this.title, this.handleRightButtonClick})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  _NavBarTopState createState() => _NavBarTopState();

  @override
  final Size preferredSize;
}

class _NavBarTopState extends State<NavBarTop> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: Key('nav_bar_top'),
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
