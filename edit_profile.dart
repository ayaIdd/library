import 'package:flutter/material.dart';
import 'package:e_library/lib/bodyprofile.dart';

class EditProfileUI extends StatefulWidget{

  _EditProfileUIState createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 60,
        title: Text('Mon Compte'),
          centerTitle: true,

        flexibleSpace:

            Container(
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

        shape : BoxShape.circle,
            image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1140180560?k=20&m=1140180560&s=612x612&w=0&h=X_400OQDFQGqccORnKt2PHYvTZ3dBLeEnCH_hRiUQrY='),

        ),


        ),
        ),




        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
              width: 4,
              color: Colors.white,

               ),
              color: Color(0xFF2661FA),
              ),
              child: Icon(
              Icons.edit,
              color: Colors.white,
              ),


        ),





        ),

        ],
        ),
        ),

              SizedBox(height: 10),
              buildTextField("Nom d'utilisateur", "Azerty", false),
              buildTextField("E-mail", "abcd@gmail.com", false),
              buildTextField("Numéro de téléphone", "0000000000", false),
              buildTextField("Mot de Passe", "******", true),
              buildTextField("Genre", "Non spécifié", false),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    onPressed: (){},
                    child: Text("Annuler", style: TextStyle(

                      fontSize: 15,
                      letterSpacing: 2,
                      color: Colors.black,
                       fontWeight: FontWeight.bold
                    )),

                  ),

                  ElevatedButton(onPressed: () {},
                      child: Text("Enregistrer", style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.white,

                      )),

                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2661FA),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  )

                  ),
                ]


              ),
            ],
    ))));
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField){
    return Padding(
      padding: EdgeInsets.only(bottom:30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField ?
          IconButton(
            icon: Icon(Icons.remove_red_eye, color: Colors.black),
            onPressed: (){},
          ): null,


          contentPadding: EdgeInsets.only(bottom:5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),




        ),
      ),
    );
  }


}