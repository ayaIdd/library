import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenCase2 extends StatefulWidget {
  const ScreenCase2({Key key}) : super(key: key);
  @override
  _ScreenCase2 createState() => _ScreenCase2();


}
class _ScreenCase2 extends State<ScreenCase2>{





  @override

  Widget build(BuildContext)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('books physique'),
        leading: Icon(Icons.menu_book_sharp),
      ),
      extendBody: true,
      body:
      SingleChildScrollView(
        child :
        Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:
                StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('Books').doc('physique').collection('physique').snapshots(),
                    builder: (context,  AsyncSnapshot<QuerySnapshot> snapshot) { //AsyncSnapshot
                      if (!snapshot.hasData) return Center(
                        child: CircularProgressIndicator(),
                      );


                      return ListView.builder(

                        padding:EdgeInsets.only(top: 22.0,right:22.0,left: 20.0 ) ,// list
                        shrinkWrap: true,
                        itemExtent: 80,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {  //snapshot.data.docs[index]['nom'] ?? ''
                          // final bookList = snapshot.data.docs[index] ;
                          final  title = snapshot.data.docs[index]['nom'] ?? '' ;
                          final autheur = snapshot.data.docs[index]['auteur'] ?? '' ;
                          final isbn = snapshot.data.docs[index]['isbn'] ?? '' ;
                          final image = snapshot.data.docs[index]['image'] ?? '' ;
                          // bookList  = [title , autheur , isbn , image ];
                          DocumentSnapshot document = snapshot.data.docs[index];


                          //  return ListTile( //title ,autheur , isbn , image )
                          //   title : Text('$title' ),
                          //   subtitle: Text( document['auteur'] ?? ""),
                          //   onTap: () {Navigator.push(context, MaterialPageRoute(
                          //    builder: (context) => PageTwo(passedAutheur: '$autheur',
                          //       passedtitle: '$title',
                          //       passedISBN: '$isbn',
                          //       passedImage: '$image',   ),
                          //  )
//  );



                          //       },

                          //    );



                          return

                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 18),
                                child: Row(
                                  children:  [

                                    Container(
                                      height: 80,
                                      width: 62,
                                      decoration:
                                      BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image:DecorationImage(image:AssetImage(image) )
                                      ),

                                    ),
                                    SizedBox(width:10 ),

                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize : MainAxisSize.min,
                                        children: [
                                          Text(title ,
                                              style: TextStyle(
                                                  fontSize: 13.0)),
                                          SizedBox(height:3 ),
                                          Text(autheur,
                                              style: TextStyle(
                                                  fontSize: 13.0)),


                                          SizedBox(height:3),
                                          Text(isbn,
                                              style: TextStyle(
                                                  fontSize: 13.0)),
                                          SizedBox(height:3),

                                        ],
                                      ),
                                    ),

                                  ],
                                ),

                              ),
                            );



                        },



                      );
                    }
                )

            ),
          ],
        ),

      ),
    );}}
