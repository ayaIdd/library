import 'dart:core';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookDispo  extends StatefulWidget {
  const BookDispo ({Key key}) : super(key: key);
  @override
  _BookDispo  createState() => _BookDispo ();


}

class _BookDispo extends State<BookDispo >{
  final controllerisbn=TextEditingController();
  final controllerdisponible=TextEditingController();

  @override

  Widget build(BuildContext)=> Scaffold(
    appBar:AppBar(
        title:Text('Disponibilité du livre')

    ),
    body: ListView(
      padding:EdgeInsets.all(16),
      children:<Widget>[
        TextField(
          controller:controllerisbn,
          decoration: decoration('Isbn'),

        ),
        const SizedBox(height:24),
        TextField(
          controller:controllerdisponible,
          decoration: decoration('Etat de la disponibilité'),

        ),
        const SizedBox(height:24),


        ElevatedButton(
          child: Text('update'),
          onPressed: (){

            final docbook=FirebaseFirestore.instance.collection('books').doc(controllerisbn.text);

            //update
            docbook.update({

              'isbn':controllerisbn.text,
              'disponibilité':controllerdisponible.text,
            });

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("state updated!")));

          },


        ),


      ],
    ),
  );

  InputDecoration decoration(String label) =>InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
  );


}

