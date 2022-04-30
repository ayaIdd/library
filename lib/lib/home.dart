
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( HomeView());
}

class HomeView extends StatefulWidget{
  HomeView({Key key}) : super(key: key) {}
  @override
  _HomeViewState createState() => _HomeViewState();
  }


class _HomeViewState extends State<HomeView> {

  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(

       backgroundColor: Color.fromARGB(255, 134,84,54) ,


        appBar : AppBar(
        title: Text('library'),
         centerTitle: true ,
         backgroundColor: Color.fromARGB(0, 67, 131, 98),

    ),
    );
  }
}