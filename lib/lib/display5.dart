import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library/lib/display.dart';
import 'package:e_library/lib/pages/Screen_dohs.dart';
import 'package:e_library/lib/pages/Screen_trays.dart';
import 'package:e_library/lib/pages/Screen_uno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_library/constants.dart';
import '../Screens/home/components/search_bar.dart';
import '../components/app_bar.dart';
import '../components/bottom_nav.dart';
import '../constants.dart';
import 'notification.dart';

class IteemView3 extends StatefulWidget {
  const IteemView3({Key key}) : super(key: key);
  static String id = 'login-page';
  @override
  _IteemViewState3 createState() => _IteemViewState3();


}
class _IteemViewState3 extends State<IteemView3>{
  List<Books> bookList  = [];




  @override

  Widget build(BuildContext)
  {
    return Scaffold(
        appBar: buildAppBar(
            context,
            title: '',
            actions: <Widget>[
              IconButton(
                icon: SvgPicture.asset('assets/icons/notification.svg'),
                onPressed: ()  =>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>NotificationUI())),
              )
            ]
        ),
        bottomNavigationBar: BottomNavBar(),
        extendBody: true,
        body:
        SingleChildScrollView(
            padding: EdgeInsets.all(9.0),
            child: SafeArea(
              // bottom: false,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: kDefaultPadding),
                    SearchBar(key: widget.key,),
                    SizedBox(height: kDefaultPadding),


                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //     FilterButton(
                          //       tap: () {}, key: widget.key,
                          //     ),
                          // Expanded (child: Categories(key: widget.key,))



                          TextButton(
                              child: Text(
                                  "Mathématique",
                                  style: TextStyle(fontSize: 14)
                              ),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(14)),
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16.0),
                                          side: BorderSide(color: Colors.black)
                                      )
                                  )
                              ),
                              onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ScreenCase1() )),
                          ),


                          TextButton(
                              child: Text(
                                  "  Physique  ",
                                  style: TextStyle(fontSize: 14)
                              ),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(14)),
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16.0),
                                          side: BorderSide(color: Colors.black)
                                      )
                                  )
                              ),
                              onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ScreenCase2() )),
                          ),
                          TextButton(
                              child: Text(
                                  "Informatique",
                                  style: TextStyle(fontSize: 14)
                              ),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(14)),
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16.0),
                                          side: BorderSide(color: Colors.black)
                                      )
                                  )
                              ),
                              onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ScreenCase3() )),
                          ),
 ]
                    ),

                    // SizedBox(height: kDefaultPadding),
                    SizedBox(height: kDefaultPadding),


                    SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child:
                        StreamBuilder(
                            stream: FirebaseFirestore.instance.collection('books').snapshots(),
                            builder: (context,  AsyncSnapshot<QuerySnapshot> snapshot) { //AsyncSnapshot
                              if (!snapshot.hasData) return Center(
                                child: CircularProgressIndicator(),
                              );

//snapshot.data.docs.length
                              return ListView.builder(

                                padding:EdgeInsets.only(top: 22.0,right:22.0,left: 20.0) ,// list
                                shrinkWrap: true,
                                  itemExtent: 80,
                                 itemCount: snapshot.data.docs.length  ?'' ,



                                  itemBuilder: (context, index) {  //snapshot.data.docs[index]['nom'] ?? ''
                                    // final bookList = snapshot.data.docs[index] ;
                                    final  title = snapshot.data.docs[index]['nom'] ?? '' ;
                                    final autheur = snapshot.data.docs[index]['auteur'] ?? '' ;
                                    final isbn = snapshot.data.docs[index]['isbn'] ?? '' ;
                                    final image = snapshot.data.docs[index]['image'] ?? '' ;
                                    // bookList  = [title , autheur , isbn , image ];
                                    DocumentSnapshot document = snapshot.data.docs[index];



                                  return

                                       Expanded( child:
                                           Container(
                                             margin: EdgeInsets.only(
                                                 bottom: 18),
                                             child: Row(
                                               children: [

                                                 Container(
                                             child :
                                             GestureDetector(     onTap: () {
                                               Navigator.push(
                                                   context, MaterialPageRoute(
                                                 builder: (context) =>
                                                     PageTwo(
                                                       passedAutheur: '$autheur',
                                                       passedtitle: '$title',
                                                       passedISBN: '$isbn',
                                                       passedImage: '$image',),
                                               ));
                                             }),

                                                    height: 80,
                                                   width: 62,
                                                   decoration:
                                                   BoxDecoration(
                                                       borderRadius: BorderRadius
                                                           .circular(5),
                                                       image: DecorationImage(
                                                           image: AssetImage(
                                                               image))

                                                   ),

                                                 ),
                                                 SizedBox(width: 15),

                                                 Expanded(
                                                   child: Column(
                                                     mainAxisAlignment: MainAxisAlignment
                                                         .center,
                                                     crossAxisAlignment: CrossAxisAlignment
                                                         .start,
                                                     mainAxisSize: MainAxisSize
                                                         .min,
                                                     children: [
                                                       Expanded(
                                                         child: SingleChildScrollView(
                                                           scrollDirection: Axis
                                                               .horizontal,

                                                           child: Text(title,
                                                               style: TextStyle(
                                                                   fontSize: 13.0)
                                                           ),
                                                         ),
                                                       ),


                                                       SizedBox(height: 3),

                                                       Text(autheur,
                                                           style: TextStyle(
                                                               fontSize: 13.0)),


                                                       SizedBox(height: 3),
                                                       Text(isbn,
                                                           style: TextStyle(
                                                               fontSize: 13.0)),
                                                       SizedBox(height: 3),

                                                     ],
                                                   ),
                                                 ),

                                               ],
                                             ),


                                           ),
                                       //  })
                                       );
                                  },
                              );
                            }
                            )

                    ),

                                   ]
              ),
            ))

    );


  }

}
class PageTwo extends StatefulWidget {   // itemCard
  final String passedtitle;
  final String passedAutheur;
  final String passedISBN ;
  final String passedImage ;


  const PageTwo(
      {Key key, this.passedtitle, this.passedAutheur, this.passedISBN,this.passedImage})
      : super(key: key);
//super is used to call the constructor of the base class which is the StatefulWidget here
  @override
  _PageTwoState createState() => _PageTwoState();
}
class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2 ${widget.passedtitle}'),
        automaticallyImplyLeading: false, //optional: removes the default back arrow
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,

          ),
          Text('${widget.passedAutheur}  autheur was passed '
              '${widget.passedISBN} isbn passed'),
//${} sign here prints the value of variable inside it.

        ],),);
  }
}



