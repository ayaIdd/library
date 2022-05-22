import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class search2 extends StatefulWidget {
  const search2({Key key}) : super(key: key);
  @override
  _search2 createState() => _search2();


}
class _search2 extends State<search2>{
  String name = "" ;
 @override

  Widget build(BuildContext) {
   return Scaffold(
       appBar: AppBar(

          backgroundColor: Colors.black ,
         title:


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
               onChanged: (val) {
                 setState(() {
                   name = val;
                 });
               }

           ),

       ),




           body :
           SingleChildScrollView(
            padding: EdgeInsets.all(9.0),
              child: SafeArea(
                child :


           StreamBuilder<QuerySnapshot>(
             stream:  FirebaseFirestore.instance.collection('books')
               .where('nom' ,  isGreaterThanOrEqualTo: name.trim()  )   //+ '\uf8ff'
               .snapshots(),
               builder: (context,   snapshot){
               if (snapshot.data == null ) return Center(
                 child: CircularProgressIndicator(),
               );

               return
               ListView.builder(

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
                   final tag = snapshot.data.docs[index]['tag'] ?? "";
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


   )));
 }}

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
      appBar:PreferredSize(
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
          actions:<Widget> [
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),

            )
          ],
        ),

      ) ,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [
                  Expanded(
                    child: Text(widget.passedtitle,
                      style:TextStyle(
                          color: Colors.black87,
                          fontSize: 21,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(width: 11),
                  Icon(Icons.favorite_border_sharp, color: Colors.black),

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
                  children:[
                    //   Icon(Icons.favorite_border_sharp, color: Colors.black),
                    //  SizedBox(width: 11,),
                    //  Text("ajouter ce livre à tes favoriés")
                    OutlineButton(
                      shape: RoundedRectangleBorder(
                          borderRadius :BorderRadius.circular(20)
                      ),
                      borderSide:
                      BorderSide(width: 3,color: Colors.black87),
                      child: Text(widget.passedDispo,
                        style: TextStyle(
                            color: Colors.black87
                        ),
                      ),
                      onPressed: (){}
                      ,
                    ) ],
                ),
              )

            ],
          ),
        ),
      ),





    );
  }
}