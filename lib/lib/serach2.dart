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

           body : StreamBuilder<QuerySnapshot>(
             stream:  FirebaseFirestore.instance.collection('books')
               .where('nom' ,  isGreaterThanOrEqualTo: name.trim() + '\uf8ff' )
               .snapshots(),
               builder: (context,   snapshot){

      return
               ListView.builder(

                 padding:EdgeInsets.only(top: 22.0,right:22.0,left: 20.0) ,// list
                 shrinkWrap: true,
                 itemExtent: 80,
                 itemCount: snapshot.data.docs.length ??'' ,




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
                             // child :
                             // GestureDetector(     onTap: () {
                             //   Navigator.push(
                             //       context, MaterialPageRoute(
                             //     builder: (context) =>
                             //         PageTwo(
                             //           passedAutheur: '$autheur',
                             //           passedtitle: '$title',
                             //           passedISBN: '$isbn',
                             //           passedImage: '$image',),
                             //   ));
                             // }),

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


   );
 }}