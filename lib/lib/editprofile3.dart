import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_library/lib/bodyprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'net/userModel.dart';
import 'package:e_library/lib/net/userModel.dart';



class EditProfileUI extends StatefulWidget{


  _EditProfileUIState createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genreController = TextEditingController();



  UserModel user;
  bool isLoading = false;


  bool _firstname = true;
  bool _secondname= true;
  bool _number= true;
  bool _gender= true;
  bool _email= true;
  String name;


  final FirebaseAuth auth= FirebaseAuth.instance;
  final EMAIL = FirebaseAuth.instance.currentUser.email ;

  bool isObscurePassword = true;

  @override
  // void initState() {
  //   super.initState();
  //   getUser();
  // }
  //
  // // getUser() async{
  //   setState(() {
  //     isLoading=true;
  //   });
  //   DocumentSnapshot documentSnapshot =
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(( FirebaseAuth.instance.currentUser).uid).get();
  //   UserModel user  = documentSnapshot.data();
  //
  //
  // }
  //
  String familyName = "prénom loading ...";
  String emaill = "email loading ...";
  String firstName = "nom loading ...";
  String phone = "numéro de téléphone   loading ...";
  String genre = "genre loading ...";

  void initState(){
    getData();
    super.initState();
  }

  Future<void> getData() async {
    User user =  await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    setState(() {
      firstName = vari.data()['firstName'];
       familyName = vari.data()['secondName'];
     emaill = vari.data()['email'];
     phone = vari.data()['phoneNumber'];
     genre = vari.data()['genre'];


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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context ,MaterialPageRoute(builder: (context)=> ProfileUI()));
            },
          ),

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




        ),

        body:


        Container(
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



                    TextField(
                      controller:firstnameController,
                          decoration: decoration('nom $firstName'),

                    ),
                    const SizedBox(height:24),
                    TextField(
                      controller:secondnameController,
                      decoration: decoration('prenom $familyName '),

                    ),
                    const SizedBox(height:24),
                    TextField(
                      controller:emailController,
                      decoration: decoration('email $emaill'),    // FirebaseAuth.instance.currentUser).email

                    ),
                    const SizedBox(height:24),
                    TextField(
                      controller:numberController,
                      decoration: decoration(" num tel  ${phone}"),


                    ),
                    const SizedBox(height:24),


                    TextField(
                      controller:genreController,
                      decoration: decoration(" genre  : ${genre}"),
                    ),
                    const SizedBox(height:24),


                    TextButton(
                      child : Text("Mot de passe oublier ?  "),
                        style: TextButton.styleFrom(
                          primary: Colors.redAccent,
                          onSurface: Colors.black,
                          padding: EdgeInsets.only(left: 10, right:10),

                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            side: BorderSide(color: Colors.black, width: 2),
                          ),

                          // shape: RoundedRectangleBorder(
                          //               side: BorderSide(color: Colors.red, width: 2),
                          //             ),

                        ),
                      onPressed:  () {
                        FirebaseAuth.instance.sendPasswordResetEmail(email:EMAIL) ;
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Un email été envoyer à votre compte ")));
                      }
                    ),
                    const SizedBox(height:24),
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
                              onPressed: () { updateProfileData();},
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
      numberController.text.trim().length < 3 ||
          numberController.text.isEmpty
          ? _number = false
          : _number = true;

      genreController.text.trim().length < 3 ||
          genreController.text.isEmpty
      ? _gender = false
          : _gender = true;
      //usersRef.document(widget.currentUserId).updateData
    });

    if (_firstname  && _secondname && _email && _gender && _number ) {


      FirebaseFirestore.instance
          .collection('users')
          .doc(( FirebaseAuth.instance.currentUser).uid)
          .update({
        "firstName": firstnameController.text,
        "secondName": secondnameController.text,
        "email": emailController.text,
        "phoneNumber" : numberController.text,
        "genre": genreController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Profile mis à jour")));
      //  SnackBar snackbar = SnackBar(content: Text("Profile updated!"));
      //      ScaffoldMessenger.(snackBar);
    }
    else ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Remplissez tout les champs !")));
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField){
    return Padding(
      padding: EdgeInsets.only(bottom:30),
      child: TextField(

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
  InputDecoration decoration(String label) =>InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
  );


}

