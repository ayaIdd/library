import 'package:flutter/material.dart';
import 'package:e_library/lib/bodyprofile.dart';
import 'package:e_library/lib/edit_profile.dart';
import 'package:e_library/lib/notification.dart';

class AboutUI extends StatefulWidget{
  _AboutUIState createState() => _AboutUIState();
}


class _AboutUIState extends State<AboutUI> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 60,
        title: Text('A propos de '),
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

            Navigator.push(context ,MaterialPageRoute(builder: (context)=> ProfileUI()));
          } ,
        ),
      ),

      body: Container(
        decoration: new BoxDecoration(color: Colors.white70),
        padding: EdgeInsets.only(left: 15 , top: 20 , right : 15),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },

          child: ListView(
            children: [
          Center(
          child: Stack(
          children: [
            Container(
            width : 130,
            height : 130,
            decoration: BoxDecoration(
              border: Border.all(width: 4, color: Colors.white),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  color : Colors.black.withOpacity(0.1),
                ),
              ],

              shape : BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1140180560?k=20&m=1140180560&s=612x612&w=0&h=X_400OQDFQGqccORnKt2PHYvTZ3dBLeEnCH_hRiUQrY='),

              ),


            ),
          ),



]
        )

              ),










          SizedBox(width : 10, height : 10),
          Center( child : Text("Application", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),

          SizedBox(width : 30, height : 30),
          Row(


              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon( // <-- Icon
                    Icons.share,
                    size: 24.0,
                  ),
                  label: Text('Partager',style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                    color: Colors.white,

                  )
                    ), // <-- Text

              style: ElevatedButton.styleFrom(

              primary: Color(0xFF2661FA),

              padding: EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
           )
          ),







                SizedBox(width : 30, height : 30),

                ElevatedButton.icon(

                    onPressed: () {},
                    icon: Icon( // <-- Icon
                      Icons.star,
                      size: 24.0,
                    ),
                    label: Text('Avis',style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      color: Colors.white,


                  )
                  ),


                  style: ElevatedButton.styleFrom(

                    primary: Color(0xFF2661FA),

                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                  )
                ),
                  ],
        ),

              SizedBox(width : 10, height : 10),
              Divider(color:Color(0xFFE59a59)),
              SizedBox(width : 20, height : 20),
              Text(
                "A tous les rats de bibliothèques, "
                  "\n \n Cette application est un outil permettant de chercher facilement un livre de la bibliothèque principale de Béjaia -Soummam- en gagnant un temps énorme."
                      " \nProfitez des fonctionnalités de *********, et faites nous part de votre avis, afin de nous permettre d'améliorer des performances de l'application. ",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
        ]
      ),

    ),

    )
    );

  }}

