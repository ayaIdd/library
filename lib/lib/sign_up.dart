import 'package:e_library/lib/Searchh.dart';
import 'package:e_library/lib/home.dart';
import 'package:flutter/material.dart';
import 'package:e_library/lib/loginScreen.dart' ;
import 'package:e_library/lib/background.dart';

import 'package:flutter/src/widgets/framework.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:e_library/lib/net/userModel.dart';


class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  _Signup createState() => _Signup();
}

class _Signup extends State<Signup> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String errorMessage;

  final _formKey = GlobalKey<FormState>();

  final name = new TextEditingController();
  final famiy_name = new TextEditingController();
  final email = new TextEditingController();
  final password = new TextEditingController();


  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;


    final firstNameField = TextFormField(
      autofocus: false,
      controller: name,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        name.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

        labelText: "name",

      ),);


    final secondNameField = TextFormField(
      autofocus: false,
      controller: famiy_name,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value.isEmpty) {
          return ("Second Name cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        famiy_name.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

        labelText: "family name ",

      ),);

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        email.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

        labelText: "email",

      ),);

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: password,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        password.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

        labelText: "mot de passe",

      ),
    );


    return Scaffold(
      body:
        SingleChildScrollView(
            child :  Background(

        
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  "Bienvenue",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: size.height * 0.03),

              Container(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.center,
                   // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      firstNameField,
                      SizedBox(height: size.height * 0.03),
                      secondNameField,
                      SizedBox(height: size.height * 0.03),
                      emailField,
                      SizedBox(height: 20),
                      passwordField,
                      SizedBox(height: size.height * 0.05),

                    ],
                  ),
                ),


              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () { Signup(email.text, password.text);},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 136, 34),
                              Color.fromARGB(255, 255, 177, 41)
                            ]
                        )
                    ),
                    padding: const EdgeInsets.all(0),
                    child: const Text(
                      "SIGN UP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () =>
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()))
                  },
                  child: const Text(
                    "Vous avez un compte ? Login",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA)
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    ));
  }

  void Signup(String email, String password)async {
    if (_formKey.currentState.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage);
        print(error.code);
      }
    }
  }
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user.email;
    userModel.uid = user.uid;
    userModel.firstName = name.text;
    userModel.secondName = famiy_name.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => IteemView4()),
            (route) => false);
  }
}





