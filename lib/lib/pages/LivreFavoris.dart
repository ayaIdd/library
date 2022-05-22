import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library/lib/Searchh.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LivreFavorisPage extends StatefulWidget {
  const LivreFavorisPage({Key key}) : super(key: key);

  @override
  State<LivreFavorisPage> createState() => _LivreFavorisPageState();
}

class _LivreFavorisPageState extends State<LivreFavorisPage> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          elevation: 0.0,
          toolbarHeight: 60,
          title:  Text(' favories ' ),
          centerTitle: true,


          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,

            ),
            onPressed: () {
              Navigator.pop(context ,MaterialPageRoute(builder: (context)=> IteemView4()));
            } ,
          ),

        ),


        body :
        SingleChildScrollView (
          padding: EdgeInsets.all(9.0),
          child: SafeArea(
            child :
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:
                StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('Favorites')
                        .doc(FirebaseAuth.instance.currentUser.uid)
                         .collection('yourfavs')
                        . snapshots(),
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
                         // final tag = snapshot.data.docs[index]['tag'] ?? '' ;

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
                                   // child :
                                    // GestureDetector(     onTap: () {
                                    //   Navigator.push(
                                    //       context, MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         PageTwo(
                                    //             passedAutheur: '$autheur',
                                    //             passedtitle: '$title',
                                    //             passedISBN: '$isbn',
                                    //             passedImage: '$image',
                                    //             passedDispo: '$disponible',
                                    //             passedTag : '$tag'
                                    //
                                    //         ),
                                    //   ));
                                    // }),

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
                                        //
                                        // Text(autheur,
                                        //     style: TextStyle(
                                        //         fontSize: 13.0)),
                                        //
                                        //
                                        // SizedBox(height: 3),
                                        // Text(disponible,
                                        //     style: TextStyle(
                                        //         fontSize: 13.0)
                                        // ),
                                        SizedBox(height: 3),

                                        IconButton(
                                          icon: Icon(Icons.favorite),
                                          color: Colors.black,

                                          onPressed: (){
                                            final userId = FirebaseAuth.instance.currentUser.uid ;

                                            final book= Book(
                                              nom: title ,
                                              auteur:autheur,
                                              isbn: isbn,
                                              disponibilite: disponible,


                                              image:image,


                                            );
                                            removefav(book);
                                          },
                                        ),

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



            ),
        ));
  }






}
Future removefav(Book book) async {
  /// Refrence to document

  final fav = FirebaseFirestore.instance.collection('Favorites')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection('yourfavs').doc(book.isbn);
  final json = book.toJson();
  await fav.delete();
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

