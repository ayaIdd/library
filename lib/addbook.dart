import 'dart:core';

import 'package:e_library/deletebooks.dart';
import 'package:e_library/updatebooks.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'Add.dart';
import 'lib/disponible.dart';


class Addbooks extends StatefulWidget {
  const Addbooks({Key key}) : super(key: key);
  @override
  _Addbooksstate  createState() => _Addbooksstate();


}

class _Addbooksstate extends State<Addbooks>{
 
   @override

  Widget build(BuildContext)=> Scaffold(
    appBar:AppBar(

      title:Text('Mis à jours des livres')
      
    ),
    body:Center(
  child:  Column(
    mainAxisAlignment: MainAxisAlignment.center,

    verticalDirection :  VerticalDirection.down,

    children: [
      ElevatedButton(
        child: Text("Ajouter un livre"),
        onPressed: (){
          Navigator.push(context ,MaterialPageRoute(builder: (context)=>choosecatagorie()));
        },
      ),
      SizedBox(width: 5),
      ElevatedButton(
        child: Text("Modifier un livre"),
        onPressed: (){
          Navigator.push(context ,MaterialPageRoute(builder: (context)=>updatebook()));
        },
      ),
       SizedBox(width: 5),
      ElevatedButton(
        child: Text("Supprimer un livre"),
        onPressed: (){
          Navigator.push(context ,MaterialPageRoute(builder: (context)=>Mainpage()));
        },
      ),
      SizedBox(width: 5),
      ElevatedButton(
        child: Text("Disponibilité"),
        onPressed: (){
          Navigator.push(context ,MaterialPageRoute(builder: (context)=>BookDispo()));
        },
      ),
    ],
  ),
)

  );
}
