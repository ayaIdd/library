import 'dart:core';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'lib/display5.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key key}) : super(key: key);
  @override
  _Mainpagestate  createState() => _Mainpagestate ();


}

class _Mainpagestate extends State<Mainpage>{
  final controllernom=TextEditingController();
  final controllerauteur=TextEditingController();
  final controllerisbn=TextEditingController();
  final controllercategorie=TextEditingController();
   @override

  Widget build(BuildContext)=> Scaffold(
    appBar:AppBar(

      title:Text('Supprimer un livre')

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
          controller:controllercategorie,
          decoration: decoration('categorie'),

        ),
        const SizedBox(height:32),
        ElevatedButton(
          child: Text('Supoprimer'),
          onPressed: (){
            final user= User(
              isbn: controllerisbn.text,
              categorie: controllercategorie.text,

              

            );
             final docbook=FirebaseFirestore.instance.collection('books').doc(user.isbn);

             //update
             docbook.delete();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Livre supprimé")));

            //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>IteemView3()));

             
            
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

class User{
  final String nom;
  final String auteur;
  final String isbn;
  final String image;
  final String categorie;

  User({
    this.nom,
    this.auteur,
    this.isbn,
    this.image,
    this.categorie
  });
  Map<String, dynamic> toJson() =>{
    'nom':nom,
    'auteur':auteur,
    'isbn':isbn,
    'image':image,
    'categorie':categorie,

  };

}