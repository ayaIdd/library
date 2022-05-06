import 'package:flutter/material.dart';
import 'package:e_library/lib/bodyprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library/lib/user.dart';

class EditProfileUI extends StatefulWidget{

  _EditProfileUIState createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  User user;
  bool _firstname = true;
  bool _secondname= true;
  bool _email= true;
  final usersRef = FirebaseFirestore.instance.collection('users');

  bool isObscurePassword = true;

   @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    setState(() {
      isLoading = true;
    });
    DocumentSnapshot doc = await usersRef.document(currentUserId).get();
    user = User.fromDocument(doc);
    firstnameController.text = user.firstname;
    secondnameController.text = user.secondname;
    emailController.text = user.email;
    
    setState(() {
      isLoading = false;
    });
  }

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
              buildTextField("firstname", "Azerty", false),
              buildTextField("secondtname", "Azerty", false),
              buildTextField("email", "abcd@gmail.com", false),
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

                  ElevatedButton(
                    onPressed: updateProfileData,
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
  updateProfileData() {
    setState(() {
      firstnameController.text.trim().length < 3 ||
              firstnameController.text.isEmpty
          ? _firstname = false
          : _firstname = true;
      secondnameController.text.trim().length < 3 ||
              secondnameController.text.isEmpty
          ? _secondname = false
          : _secondname = true;
      emailController.text.trim().length < 3 ||
              emailController.text.isEmpty
          ? _email = false
          : _email = true;
    });

    if (_firstname && _secondname && _email) {
      usersRef.document(widget.currentUserId).updateData({
        "firstname": firstnameController.text,
        "secondname": secondnameController.text,
        "email": emailController.text,
      });
      SnackBar snackbar = SnackBar(content: Text("Profile updated!"));
      _scaffoldKey.currentState.showSnackBar(snackbar);
    }
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