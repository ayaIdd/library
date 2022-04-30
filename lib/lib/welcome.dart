
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:e_library/lib/loginScreen.dart';
import 'package:e_library/lib/google_icon.dart';
//import '../sign_up.dart';
import 'package:e_library/lib/sign_up.dart';
class welcome_page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              const Expanded(
                child:  Hero(
                  tag: 'image',
                  child: Image(
                      image: AssetImage('assets/6263.jpg')
                  ),
                ),
              ),



              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('welcome',
                          style:TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          )
                      ),

                      const Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),

                        child:   Text(' Bienvenue dans votre application LIBRARY! Ici, vous pouvez consulter tout vos livres préférés de chez la bibliothèque SOUMMAM, et plus encor.'
                            'Vous voulez en découvrir plus?',
                            style: TextStyle(
                                color: Colors.grey),
                            textAlign:TextAlign.center
                        ),

                      ),

                      Row(
                        mainAxisSize: MainAxisSize.min,


                        children: [
                          Hero(
                            tag: 'login_button',
                            child: TextButton(
                              //to link login screen with welcome page
                              onPressed: () =>Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>LoginScreen()
                                ),
                              ),


                              child: Text('Login'),
                              style: TextButton.styleFrom(

                                  primary:Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0,
                                      vertical: 18.0
                                  ),
                                  shape:  const StadiumBorder(),
                                  side:const  BorderSide(
                                    width: 2.8,

                                  )
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 8.0,
                          ),
                          OutlinedButton(
                            onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Signup()
                            ),
                            ),
                            child:  const Text('Sign up'),
                            style: TextButton.styleFrom(
                              backgroundColor:  const Color(0xffe59a59),
                              primary:Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0,
                                  vertical: 18.0
                              ),
                              shape:  const StadiumBorder(),
                            ),
                          ),

                        ],


                      ),
                      Text(' avez  vous un compte google ?'),
                      const SizedBox(height: 8.0),

                      Hero(
                        tag: 'google',
                        child: Row(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            SocialButton(
                                backgroundColor:Colors.red,icon:FontAwesomeIcons.google,onPressed:(){}
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 36.0),
                    ],
                  )
              
              ),

            ]
        )
    );
  }


}
