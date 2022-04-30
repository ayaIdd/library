import 'package:flutter/material.dart';
import 'package:e_library/lib/edit_profile.dart';
import 'package:e_library/lib/notification.dart';
import 'package:e_library/lib/bodyprofile.dart';
import 'package:e_library/lib/about_us.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soummam',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: ProfileUI(),

    );
  }
}

