//import 'package:e_library/lib/home.dart';
import 'package:e_library/lib/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:e_library/lib/google_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_library/lib/resetpassword.dart';

import 'package:e_library/Screens/home/home.dart';

import 'display4.dart';
import 'display5.dart';
import 'editprofile3.dart';



class LoginScreen extends StatefulWidget {
  static String id = 'login-page';
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();


  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();


  final _auth = FirebaseAuth.instance;
  String errorMessage;





  @override
  Widget build(BuildContext context) {

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
        decoration: const InputDecoration(

          labelText: "mot de passe",


        ),
      );


      return   GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),//click outside the screen to hide the keyboard
      child: Scaffold(
        resizeToAvoidBottomInset: false,//to make it responsive and the yellow screen
        body:  Padding(
          padding: const EdgeInsets.all(32.0),

              child :
               Container(

            child : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: <Widget>[
                Container(

                 child : const Text('Welcome Back!',
                  style:TextStyle(
                    fontSize: 24.0,
                    fontWeight:FontWeight.bold,
                  ) ,
                ),
          ),

              Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                        children: <Widget>[


                       SizedBox(
                        child: Image.asset('assets/reader.png',
                            ),),


                    SizedBox(height: 15), //25
                    emailField,
                    SizedBox(height: 15),   //25
                    passwordField,


                    Row(

                  children:[
                   // Spacer(),
                   TextButton(

                      onPressed: ()  =>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ResetScreen() )),  // ResetScreen
                      child: const Text('Forgot Password'),
                    ),
                  ],),

                   SizedBox(height:15.0),


                // the login button HEREEEEEEEEE

                Hero(
                  tag: 'login_button',
                  child:( TextButton(

                    onPressed: () async{
                      signIn(email.text, password.text);
                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>IteemView3()));
                    },
                    child:  const Text('Login'),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xffe59a59),
                      primary:Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 18.0
                      ),
                      shape:  const StadiumBorder(),

                    ),
                  )),
                ),

               // SIGNING IN WITH GOOGLE *****************

                  SizedBox(height: 15.0),
               TextButton(

                  onPressed: () {

                  },
                  child: const Text('Login Via Google'),
                ),

               // THEE LOGIN WITH GOOGLE HEREEEEEEEEEEEEEEE
                Hero(
                  tag: 'google',
                  child: Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      SocialButton(
                        backgroundColor:Colors.red,
                        icon:FontAwesomeIcons.google,
                        onPressed:(){},
                      )

                    ],
                  ),
                ),

                 SizedBox(height: 15.0),
                      TextButton(

                  onPressed: ()  =>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Signup())),
                  
                  child: const Text("vous n'avez pas un compte ? Sign up "),
                         )
               // const SizedBox(height: 32.0),

            /*  ),*/
            ]),
          ),
        ),




      ]
            )

      )
           )));
    }
  void signIn(String email, String password) async {
    if (_formKey.currentState.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => IteemView2())),
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

}


