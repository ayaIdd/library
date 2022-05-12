import 'dart:core';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Addmath extends StatefulWidget {
  const Addmath({Key key}) : super(key: key);
  @override
  _Addmathstate  createState() => _Addmathstate ();


}

class _Addmathstate extends State<Addmath>{
  final controllernom=TextEditingController();
  final controllerauteur=TextEditingController();
  final controllerisbn=TextEditingController();
  final controllercategorie=TextEditingController();
   @override

  Widget build(BuildContext)=> Scaffold(
    appBar:AppBar(
      title:Text('Add a informatic book')
      
    ),
    body: ListView(
      padding:EdgeInsets.all(16),
      children:<Widget>[
        TextField(
          controller:controllernom,
          decoration: decoration('Nom'),

        ),
        const SizedBox(height:24),
        TextField(
          controller:controllerauteur,
          decoration: decoration('Auteur'),

        ),
        const SizedBox(height:24),
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
          child: Text('Add'),
          onPressed: (){
            final user= User(
              nom: controllernom.text,
              auteur: controllerauteur.text,
              isbn: controllerisbn.text,
              categorie: controllercategorie.text,
              image:"assets/books/imgdefaut.jpg",

            );
            addbook(user);
            addbooks(user);
            Navigator.pop(context);
          },
        ),


      ],
    ),
  );

  InputDecoration decoration(String label) =>InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
  );
  
  Future addbook(User user) async{
    /// Refrence to document
    final docbook= FirebaseFirestore.instance.collection('Books').doc('mathématique').collection('mathematique').doc(user.isbn);
    
    final json =user.toJson();
    await docbook.set(json);
  }
  Future addbooks(User user) async{
    /// Refrence to document
    final docbook= FirebaseFirestore.instance.collection('books').doc(user.isbn);

    final json =user.toJson();
    await docbook.set(json);
  }
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
    this.categorie,
  });
  Map<String, dynamic> toJson() =>{
    'nom':nom,
    'auteur':auteur,
    'isbn':isbn,
    'image':image,
    'categorie':categorie,

  };


}