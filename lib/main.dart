// ignore: invalid_language_version_override
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_library/lib/loginScreen.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:e_library/Screens/home/home.dart';
import 'package:e_library/constants.dart';

// @dart=2.9

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp( MyApp());
}
// @dart=2.9

class MyApp extends StatelessWidget {

  
  @override 
  Widget build(BuildContext context) {
    return  MaterialApp(

      home:  LoginScreen(),
    );
  }
}

