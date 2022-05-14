
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library/lib/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:e_library/lib/about_us.dart';
import 'package:e_library/lib/soummam.dart';
import 'package:e_library/lib/help.dart';
import 'package:e_library/lib/editprofile3.dart';
import 'package:provider/provider.dart';

import '../addbook.dart';
import '../constants.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({Key key}) : super(key: key);

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  bool _isAdmin = false;

  @override
  void initState(){
    getData();
    super.initState();
  }

  Future<void> getData() async {
    User user =  await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    setState(() {
     _isAdmin  = vari.data()['admin'] ? _isAdmin = null : _isAdmin = false  ;


    });





  }



  Widget textfield({@required hintText}) {
    return Material(

      elevation: 4,

      shadowColor: Color(0xFFE59a59),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),



      child: TextField(

        decoration: InputDecoration(

            hintText: hintText,

            hintStyle: TextStyle(

              letterSpacing: 2,
              color: Colors.black,
              fontWeight: FontWeight.bold,

            ),

            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        elevation: 0.0,
        backgroundColor: Color(0xFFE59a59),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),

      ),


      body: Stack(


          alignment: Alignment.center,
          children: [



            CustomPaint(

              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              painter: HeaderCurvedContainer(),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "Mon Profile",
                      style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                   width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Color(0xFF2661FA)),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color : Colors.black.withOpacity(1),
                        ),
                      ],
                      shape : BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1140180560?k=20&m=1140180560&s=612x612&w=0&h=X_400OQDFQGqccORnKt2PHYvTZ3dBLeEnCH_hRiUQrY='),

                      ),
                    ),

                  )
                ]
            ),


            SizedBox(height: kDefaultPadding),



            Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(

                    
                   // child : Text("ABCD XYZ", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))

                ),


                SizedBox(width : 1, height : 100),
               // SizedBox(height: kDefaultPadding),

                ListTile(

                  leading: Icon(Icons.person , color: Color(0xFF2661FA)),
                  title: Text('Mon Compte',style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap : () {
                    Navigator.push(context ,MaterialPageRoute(builder: (context)=> EditProfileUI()));
                  },
                ),





                SizedBox(height: kDefaultPadding),



                Divider(color: Color(0xFFE59a59)),
                ListTile(
                  leading: Icon(Icons.description, color: Color(0xFF2661FA)),
                  title: Text('A propos de ',style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap : () {
                    Navigator.push(context ,MaterialPageRoute(builder: (context)=> AboutUI()));
                  },
                ),

                SizedBox(height: kDefaultPadding),

                Divider(color: Color(0xFFE59a59)),
                ListTile(
                  leading: Icon(Icons.menu_book, color:Color(0xFF2661FA)),
                  title: Text(' Soummam ',style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap : (){
                    Navigator.push(context ,MaterialPageRoute(builder: (context)=> SoummamUI()));
                  },
                ),

                SizedBox(height: kDefaultPadding),


                Divider(color: Color(0xFFE59a59)),
                ListTile(
                  leading: Icon(Icons.help, color : Color(0xFF2661FA)),
                  title: Text("Centre d'aide",style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap : (){
                    Navigator.push(context ,MaterialPageRoute(builder: (context)=> HelpUI()));
                    } ,
                ),

                SizedBox(height: kDefaultPadding),


                Divider(color: Color(0xFFE59a59)),
                ListTile(
                  leading: Icon(Icons.logout, color : Color(0xFF2661FA)),
                  title: Text("Se Déconnecter",style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap : () async {
                    await FirebaseAuth.instance.signOut().then((value) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen()),(route) => false));


                  }
                  ,
                ),

                SizedBox(height: kDefaultPadding),


          Visibility (
            visible: _isAdmin,
            child :
              ListTile(


    leading: Icon(Icons.add_moderator , color : Color(0xFF2661FA)),
    title: Text("dont click unless you're the admin ",style: TextStyle(fontWeight: FontWeight.bold)),
    onTap : () {
    Navigator.push(context ,MaterialPageRoute(builder: (context)=> Addbooks()));
    } , )





                ),

              ],

            ),


          ]

      ),

    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFFE59a59);
    Path path = Path()
      ..relativeLineTo(0, 100)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 100)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}