
import 'package:e_library/lib/net/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../lib/net/userModel.dart';

/* class Item {
  int id;
  String name;
  String description;
  String image;
  int color;
  Item({
    this.id,
    this.name,
    this.description,
    this.image,
    this.color,

  });
} */



// ignore: empty_constructor_bodies
class Item {
   String isbn;
   String nom;
   String auteur;
   String image;


// added
   int color ;
   int id ;
   String name ;
   String description;
  Item(

      {  this.isbn,
         this.nom,
         this.auteur,
         this.image,
         this.color,
         this.id,
         this.name,
       this.description,});

  Map<String , dynamic> toJson() => {'nom': nom, 'auteur':auteur,'image':image,'isbn':isbn };
  //map.forEach((k, v) {
   //   print('{ key: $k, value: $v }');
   // });

   Item.fromSnapshot(snapshot)
  :     nom = snapshot.data()['nom'],
        isbn = snapshot.data()['isbn'],
        auteur = snapshot.data()['auteur'],
        image = snapshot.data()['image'] //.toimage


}
  // this is meant to be in the home and it is ( just putting the code here so i dont lose it
   Future  getBookData() async {
   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
   UserModel userModel = UserModel();



  final uid = UserModel().uid ;
  var data = await FirebaseFirestore.instance
      .collection('Books')
      .doc('physique')
      .collection('physique')
      .orderBy('nom', descending: true)
      .get();



   setState( () {
     demoItems = List.from(data.docs.)
   } ) ;

   


 }*/

 List<Item> demoItems = [

  Item(
    id: 1,
    name: 'tout javascript ',
    description: "This Fruit Soup may use jelly which is diced as well to add flavor and crowd to the Fruit Soup. I didn't have time to make the jelly, so I didn't use it",
    image: 'assets/images/1.png',

    color:0xFF020202,

  ),
  Item(
    id: 2,
    name: 'programmer en java',
    description: "This Fruit Soup may use jelly which is diced as well to add flavor and crowd to the Fruit Soup. I didn't have time to make the jelly, so I didn't use it",
    image: 'assets/images/2.png',

    color:0xFF020202,

  ),
  Item(
    id: 3,
    name: 'programmer en langage C',
    description: "This Fruit Soup may use jelly which is diced as well to add flavor and crowd to the Fruit Soup. I didn't have time to make the jelly, so I didn't use it",
    image: 'assets/images/3.png',

    color: 0xFF020202,
  ),
  /*Item(
    id: 4,
    name: 'python pour les nuls',
    description: "e livre s'adresse à tous les développeurs web, qu'ils soient débutants ou avancés. Le JavaScript sert avant tout à rendre les pages web interactives et dynamiques du côté de l'utilisateur, mais il est également de plus en plus utilisé pour créer des applications complètes, y compris côté serveur.",

    color: 0xFF020202,

  ),*/
];
