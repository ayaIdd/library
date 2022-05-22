import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library/lib/display.dart';
import 'package:e_library/lib/pages/Screen_dohs.dart';
import 'package:e_library/lib/pages/Screen_trays.dart';
import 'package:e_library/lib/pages/Screen_uno.dart';
import 'package:e_library/lib/serach2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_library/constants.dart';
import '../Screens/home/components/search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/app_bar.dart';
import '../components/bottom_nav.dart';
import '../constants.dart';
import 'notification.dart';
import 'package:flutter/src/widgets/heroes.dart';

class IteemView4 extends StatefulWidget {
  const IteemView4({Key key}) : super(key: key);
  static String id = 'login-page';
  @override
  _IteemViewState3 createState() => _IteemViewState3();


}
class _IteemViewState3 extends State<IteemView4>{
  List<Books> bookList  = [];
  String name = "" ;









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
       // bottomNavigationBar: BottomNavBar(),
       // extendBody: true,
        body:
        SingleChildScrollView(
            padding: EdgeInsets.all(9.0),
            child: SafeArea(
              // bottom: false,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: kDefaultPadding),

                    TextField(

                        decoration: InputDecoration(

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            suffixIcon: SvgPicture.asset('assets/icons/search.svg',
                                fit: BoxFit.scaleDown
                            ),
                            hintText: 'Recherche'

                        ),
                 onTap:  ()  =>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>search2()))
                    ),

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
                                style: TextStyle(fontSize: 14 ,color:Colors.black ),

                            ),
                            style: ButtonStyle(
                               // backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE59a59)),

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
                                style: TextStyle(fontSize: 14,color:Colors.black)
                            ),
                            style: ButtonStyle(
                             //   backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE59a59)),

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
                                style: TextStyle(fontSize: 14,color:Colors.black)
                            ),
                            style: ButtonStyle(
                               // backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE59a59)),
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
                                itemCount: snapshot.data.docs.length  ??'' ,



                                itemBuilder: (context, index) {  //snapshot.data.docs[index]['nom'] ?? ''
                                  // final bookList = snapshot.data.docs[index] ;
                                  final  title = snapshot.data.docs[index]['nom'] ?? '' ;
                                  final autheur = snapshot.data.docs[index]['auteur'] ?? '' ;
                                  final isbn = snapshot.data.docs[index]['isbn'] ?? '' ;
                                  final image = snapshot.data.docs[index]['image'] ?? '' ;
                                  final disponible = snapshot.data.docs[index]['disponibilité'] ?? '' ;
                                  final tag = snapshot.data.docs[index]['tag'] ?? '' ;

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
                                                      passedImage: '$image',
                                                      passedDispo: '$disponible',
                                                      passedTag : '$tag'

                                                    ),
                                              ));
                                            }),

                                            height: 80,
                                            width: 62,
                                            decoration:
                                            BoxDecoration(
                                              //  borderRadius: BorderRadius
                                               //     .circular(5),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        image,
                                                    ),
                                                    fit:BoxFit.cover
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight: Radius.circular(10)
                                                ),
                                              boxShadow:[
                                                BoxShadow(
                                                  offset:Offset (5, 5),
                                                  blurRadius:10
                                                ),
]
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
                                                        fontSize: 13.0)
                                                ),
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
            )),
       bottomNavigationBar: BottomNavBar(),
     //  extendBody: true,
    );


  }

}
class PageTwo extends StatefulWidget {   // itemCard
  final String passedtitle;
  final String passedAutheur;
  final String passedISBN ;
  final String passedImage ;
  final String passedDispo ;
  final String passedTag ;



  const PageTwo(
      {Key key, this.passedtitle, this.passedAutheur, this.passedISBN,this.passedImage , this.passedDispo, this.passedTag})
      : super(key: key);
//super is used to call the constructor of the base class which is the StatefulWidget here
  @override
  _PageTwoState createState() => _PageTwoState();
}
class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Page 2 ${widget.passedtitle}'),
      //   automaticallyImplyLeading: false, //optional: removes the default back arrow
      //  ),
      //  body: Column(
      //   children: [
      //    Container(
      //    height: 400,
      //   width: double.infinity,

      //  ),
      // Text('${widget.passedAutheur}  autheur was passed '
      //  '${widget.passedISBN} isbn passed'),
//${} sign here prints the value of variable inside it.

      //  ],
      // ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(500),
        child: AppBar(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          flexibleSpace: Hero(
            tag: widget.passedTag,
            child:
            Container(
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(widget.passedImage),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),

            )
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(widget.passedtitle,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 21,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(width: 11),

                  // Icon(Icons.favorite_border_sharp,
                  //     color: Colors.black
                  //
                  // ),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    color: Colors.black,

                    onPressed: (){
                                final userId = FirebaseAuth.instance.currentUser.uid ;

                                final book= Book(
                                  nom: widget.passedtitle ,
                                  auteur:widget.passedAutheur ,
                                  isbn: widget.passedISBN,
                                  disponibilite: widget.passedDispo,


                                  image:widget.passedImage,


                                );
                                getfav(book);
                                },
                  ),

                ],
              ),
              Text(widget.passedAutheur,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 17
                ),),
              SizedBox(
                height: 5,
              ),
              Text(widget.passedISBN
                ,
                style: TextStyle(
                  color: Colors.black54,

                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    //   Icon(Icons.favorite_border_sharp, color: Colors.black),
                    //  SizedBox(width: 11,),
                    //  Text("ajouter ce livre à tes favoriés")
                    OutlineButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      borderSide:
                      BorderSide(width: 3, color: Colors.black87),
                      child: Text(widget.passedDispo,
                        style: TextStyle(
                            color: Colors.black87
                        ),
                      ),
                      onPressed: () {

                      },

                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),


    );
  }
}


  Future getfav(Book book) async {
    /// Refrence to document

    final fav = FirebaseFirestore.instance.collection('Favorites')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('yourfavs').doc(book.isbn);
    final json = book.toJson();
    await fav.set(json);
  }



  class Book {
    final String nom;
    final String auteur;
    final String isbn;
    final String image;
    final String userId;
    final String disponibilite;


    Book({
      this.nom,
      this.auteur,
      this.isbn,
      this.image,
      this.userId,
      this.disponibilite,


    });

    Map<String, dynamic> toJson() =>
        {
          'nom': nom,
          'auteur': auteur,
          'isbn': isbn,
          'image': image,
          'userId': userId,
          'disponibilité': disponibilite,


        };


  }
