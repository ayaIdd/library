import 'dart:core';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Addphy extends StatefulWidget {
  const Addphy({Key key}) : super(key: key);
  @override
  _Addphystate  createState() => _Addphystate ();


}

class _Addphystate extends State<Addphy>{
  final controllernom=TextEditingController();
  final controllerauteur=TextEditingController();
  final controllerisbn=TextEditingController();
  final controllercategorie=TextEditingController();
  final controllerdispo=TextEditingController();
  final idd = new DateTime.now().millisecondsSinceEpoch;


  @override

  Widget build(BuildContext)=> Scaffold(
    appBar:AppBar(
      title:Text('Ajouter un livre de physique')
      
    ),
    body: ListView(
      padding:EdgeInsets.all(16),
      children:<Widget>[
        TextField(
          controller:controllernom,
          decoration: decoration('Titre'),

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
          controller:controllerdispo,
          decoration: decoration('Disponibilité'),

        ),
        const SizedBox(height:24),
        TextField(
          controller:controllercategorie,
          decoration: decoration('Categorie: Physique'),

        ),
        const SizedBox(height:32),
        ElevatedButton(
          child: Text('Ajouter'),
          onPressed: (){
            final user= User(
              nom: controllernom.text,
              auteur: controllerauteur.text,
              isbn: controllerisbn.text,
              categorie: 'physique',
              image:"assets/books/img.png",
              disponibilite:controllerdispo.text,
              tag:idd.toString(),



            );
            addbook(user);
            addbooks(user);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Livre ajouté")));

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
    final docbook= FirebaseFirestore.instance.collection('Books').doc('physique').collection('physique').doc(user.isbn);
    
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
  final String disponibilite;
  final String tag;



  User({
    this.nom,
    this.auteur,
    this.isbn,
    this.image,
    this.categorie,
    this.disponibilite,
    this.tag,

  });
  Map<String, dynamic> toJson() =>{
    'nom':nom,
    'auteur':auteur,
    'isbn':isbn,
    'image':image,
    'categorie':categorie,
    'disponibilité':disponibilite,
    'tag':tag,


  };

}