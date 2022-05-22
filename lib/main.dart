// ignore: invalid_language_version_override
import 'package:e_library/addbook.dart';
import 'package:e_library/lib/display4.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_library/lib/loginScreen.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:e_library/Screens/home/home.dart';
import 'package:e_library/constants.dart';

import 'lib/Searchh.dart';
import 'lib/display4.dart';
import 'lib/display3.dart';
import 'lib/display5.dart';
import 'lib/serach2.dart';
import 'lib/welcome.dart';

// @dart=2.9

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  
  @override 
  Widget build(BuildContext context) {
    return
      MaterialApp(

      home:  welcome_page(), // IteemView2
    );
  }
}

