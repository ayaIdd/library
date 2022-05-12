import 'dart:core';

import 'package:e_library/deletebooks.dart';
import 'package:e_library/updatebooks.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'addinfo.dart';
import 'addmath.dart';
import 'addphy.dart';


class choosecatagorie extends StatefulWidget {
  const choosecatagorie({Key key}) : super(key: key);
  @override
  _choosecatagoriestate  createState() => _choosecatagoriestate();


}

class _choosecatagoriestate extends State<choosecatagorie>{
 
   @override

  Widget build(BuildContext)=> Scaffold(
    appBar:AppBar(
      title:Text('Add a book')
      
    ),
    body:Center(
  child:  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      RaisedButton(
        child: Text("informatic"),
        onPressed: (){
          Navigator.push(context ,MaterialPageRoute(builder: (context)=> Addinfo()));
        },
      ),
      SizedBox(width: 5),
      RaisedButton(
        child: Text("physic"),
        onPressed: (){
          Navigator.push(context ,MaterialPageRoute(builder: (context)=>Addphy()));
        },
      ),
       SizedBox(width: 5),
      RaisedButton(
        child: Text("matimatic"),
        onPressed: (){
          Navigator.push(context ,MaterialPageRoute(builder: (context)=>Addmath()));
        },
      ),
    ],
  ),
)

  );
}
