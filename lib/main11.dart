// ignore: invalid_language_version_override
import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_library/lib/net/userModel.dart';

import 'lib/display5.dart';
import 'lib/loginScreen.dart';

// @dart=2.9

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp( Myapp());
}


// class MyApp extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       MaterialApp(
//
//         home:  LoginScreen(), // IteemView2
//       );
//   }
// }

class Myapp extends StatefulWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
   StreamSubscription<UserModel> user;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    }) as StreamSubscription<UserModel>;
  }
   @override
   void dispose() {
     user.cancel();
     super.dispose();
   }

 @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        /// check if user is signed (Open Chat page ) if user is not signed in (open welcome page)
        initialRoute:
        FirebaseAuth.instance.currentUser == null ? LoginScreen.id : IteemView3.id,

        routes: {
        LoginScreen.id: (context) => LoginScreen(),
        IteemView3.id: (context) => IteemView3(),

        },

      home: LoginScreen(),
    );

    }
}


