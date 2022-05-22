import 'package:flutter/material.dart';
import 'package:e_library/lib/bodyprofile.dart';

class SoummamUI extends StatefulWidget{

  _SoummamUIState createState() => _SoummamUIState();
}


class _SoummamUIState extends State<SoummamUI> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 60,
          title: Text('Soummam '),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(50), bottomRight: Radius.circular(50)),
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
                                  image: AssetImage('assets/images/logo.png'),

                                ),
                            ),
                            )
],

                      )

                  ),










                  SizedBox(width : 10, height : 10),
                  Center( child : Text("S-bib", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),

                  SizedBox(width : 10, height : 30),



                  ListTile(
                    leading: Icon(Icons.drive_file_rename_outline, color: Color(0xFF2661FA)),
                    title: Text('La bibliothèque principale de la lectrure publique de Béjaia',style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap : () => null,
                  ),

                  Divider(color: Color(0xFFE59a59)),
                  ListTile(
                    leading: Icon(Icons.location_city , color: Color(0xFF2661FA)),
                    title: Text('Rue Krim Belkacem Aamriw Béjaia, 06000, Béjaia',style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap : ()  => null,
                  ),






                  Divider(color: Color(0xFFE59a59)),
                  ListTile(
                    leading: Icon(Icons.email, color: Color(0xFF2661FA)),
                    title: Text('lecture.publique06@gmail.com',style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap : () => null,
                  ),



                  Divider(color: Color(0xFFE59a59)),
                  ListTile(
                    leading: Icon(Icons.phone, color: Color(0xFF2661FA)),
                    title: Text('034 10 72 54 ',style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap : () {},
                  ),

                  Divider(color: Color(0xFFE59a59)),
                  ListTile(
                    leading: Icon(Icons.web, color:Color(0xFF2661FA)),
                    title: Text(' https://www.m-culture.gov.dz ',style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap : () => null,
                  ),

                  Divider(color: Color(0xFFE59a59)),
                  ListTile(
                    leading: Icon(Icons.person , color: Color(0xFF2661FA)),
                    title: Text('Dirigée par Mr Hammouche',style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap : ()  => null,


                  ),




                ],



            ),

          ),


        ),




    );

  }}

