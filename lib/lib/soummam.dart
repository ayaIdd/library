import 'package:flutter/material.dart';
import 'package:e_library/lib/bodyprofile.dart';
import 'package:e_library/lib/edit_profile.dart';

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
                                  image: NetworkImage('data:image/png;base64,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'),

                                      ),
                            ),
                            )
],

                      )

                  ),










                  SizedBox(width : 10, height : 10),
                  Center( child : Text("Logo", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),

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

