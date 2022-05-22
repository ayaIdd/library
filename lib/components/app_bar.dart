import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar buildAppBar(BuildContext context, {String title, List<Widget> actions, Widget leading}) {
  return AppBar(
    backgroundColor:  Colors.black,   //Color(0xFFE59a59),

    brightness: Brightness.dark,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w300
      ),
    ),
    centerTitle: true,
    leading: leading,
    actions: actions,
  );
}