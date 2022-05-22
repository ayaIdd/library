import 'package:flutter/material.dart';

import '../bodyprofile.dart';



class HelpUI extends StatefulWidget{

  _HelpUIState createState() => _HelpUIState();
}

class _HelpUIState extends State<HelpUI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 60,
        title: Text("Centre d'aide"),
        centerTitle: true,

        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(40), bottomRight: Radius.circular(40)),
              gradient: LinearGradient(
                colors: [Color(0xFFE59a59),Color(0xFFE59a59)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,

          ),
          onPressed: () {
            Navigator.pop(context ,MaterialPageRoute(builder: (context)=> ProfileUI()));
          } ,
        ),

      ),


      body: Container(

        padding: EdgeInsets.only(left: 15 , top: 5 , right : 15),

    child: ListView(
    children: [

        Text(

        " \nComment accéder à mon profile ?",
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

        Text(
        "\nIl suffit de cliquer sur l'icone d'un profile qui se trouve à la barre en dessous de la page d'accueil.\n",
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),

      Divider(color:Color(0xFFE59a59)),

      Text(

          " \nComment accéder à mon compte ?",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

      Text(
          "\nIl suffit d'accéder à votre profile puis cliquer sur la barre ' Mon Compte '.\n",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),

      Divider(color:Color(0xFFE59a59)),

      Text(

          " \nComment modifier mes informations personnelles ? ",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

      Text(
          "\nIl suffit d'accéder à votre compte puis modifier le champ souhaité.\n",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),


      Divider(color:Color(0xFFE59a59)),

      Text(

          " \nComment rechercher un livre ? ",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

      Text(
          "\nIl suffit de saisir une information du livre sur la barre de recherche qui se trouve au dessus de la page d'accueil.\n",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),


      Divider(color:Color(0xFFE59a59)),

      Text(

          " \nComment favoriser un livre ? ",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

      Text(
          "\nIl suffit de cliquer sur l'icone du coeur qui se trouve devant le livre.\n",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),


      Divider(color:Color(0xFFE59a59)),

      Text(

          " \nComment accéder à la page des livres favorisés? ",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

      Text(
          "\nIl suffit de cliquer sur l'icone du coeur qui se trouve à la barre en dessous de la page d'accueil. \n",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),


      Divider(color:Color(0xFFE59a59)),
      Text(

          " \nComment accéder aux notifications ? ",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

      Text(
          "\nIl suffit de cliquer sur l'icone de la cloche qui se trouve au dessus et à droite de la page d'accueil. \n",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),


      Divider(color:Color(0xFFE59a59)),
      Text(

          " \nComment accéder à la page d'acceuil ? ",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

      Text(
          "\nIl suffit de cliquer sur l'icone d'une maison qui se trouve à la barre en dessous de la page d'accueil. \n",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),

      Divider(color:Color(0xFFE59a59)),

      Text(

          " \nComment accéder aux informations de notre application ? ",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

      Text(
          "\nIl suffit d'accéder à votre profile puis cliquer sur la barre ' A propos de '.\n",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),


      Divider(color:Color(0xFFE59a59)),

      Text(

          " \nComment accéder aux informations de la bibliothèque principale de Béjaia ? ",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

      Text(
          "\nIl suffit d'accéder à votre profile puis cliquer sur la barre ' Soummam '.\n",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),


      Divider(color:Color(0xFFE59a59)),

      Text(

          " \nComment se déconnecter ? ",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

      Text(
          "\nIl suffit d'accéder à votre profile puis cliquer sur la barre ' Se Déconnecter '.\n\n",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),


    ]
    )



    ));
  }






}