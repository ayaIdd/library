import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:e_library/lib/edit_profile.dart';
import 'package:e_library/lib/about_us.dart';
import 'package:e_library/lib/soummam.dart';
import 'package:e_library/lib/help.dart';



class ProfileUI extends StatelessWidget {


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
                    padding: EdgeInsets.all(19),
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



    Column(

              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Container(

                    
                    child : Text("ABCD XYZ", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))

                ),


                SizedBox(width : 1, height : 35),

                ListTile(

                  leading: Icon(Icons.person , color: Color(0xFF2661FA)),
                  title: Text('Mon Compte',style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap : () {
                    Navigator.push(context ,MaterialPageRoute(builder: (context)=> EditProfileUI()));
                  },
                ),








                Divider(color: Color(0xFFE59a59)),
                ListTile(
                  leading: Icon(Icons.description, color: Color(0xFF2661FA)),
                  title: Text('A propos de ',style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap : () {
                    Navigator.push(context ,MaterialPageRoute(builder: (context)=> AboutUI()));
                  },
                ),

                Divider(color: Color(0xFFE59a59)),
                ListTile(
                  leading: Icon(Icons.menu_book, color:Color(0xFF2661FA)),
                  title: Text(' Soummam ',style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap : (){
                    Navigator.push(context ,MaterialPageRoute(builder: (context)=> SoummamUI()));
                  },
                ),


                Divider(color: Color(0xFFE59a59)),
                ListTile(
                  leading: Icon(Icons.help, color : Color(0xFF2661FA)),
                  title: Text("Centre d'aide",style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap : (){
                    Navigator.push(context ,MaterialPageRoute(builder: (context)=> HelpUI()));
                    } ,
                ),

                Divider(color: Color(0xFFE59a59)),
                ListTile(
                  leading: Icon(Icons.logout, color : Color(0xFF2661FA)),
                  title: Text("Se Déconnecter",style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap : () => null,
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