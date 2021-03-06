import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library/lib/display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_library/constants.dart';
import '../Screens/home/components/categories.dart';
import '../Screens/home/components/filter.dart';
import '../Screens/home/components/search_bar.dart';
import '../components/app_bar.dart';
import '../components/bottom_nav.dart';
import '../constants.dart';
import 'itemDisplay.dart';
import 'notification.dart';

class IteemView2 extends StatefulWidget {
  const IteemView2({Key key}) : super(key: key);
  @override
  _IteemViewState2 createState() => _IteemViewState2();


}
class _IteemViewState2 extends State<IteemView2>{
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
                                  "Math??matique",
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
                   onPressed: (){}
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
                              onPressed: (){}
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
                              onPressed: (){}
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
                            stream: FirebaseFirestore.instance.collection('Books').doc('physique').collection('physique').snapshots(),
                            builder: (context,  AsyncSnapshot<QuerySnapshot> snapshot) { //AsyncSnapshot
                              if (!snapshot.hasData) return Center(
                                child: CircularProgressIndicator(),
                              );


                              return ListView.builder(   // list
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


                                    return ListTile( //title ,autheur , isbn , image )
                                      title : Text('$title' ),
                                      subtitle: Text( document['auteur'] ?? ""),
                                      onTap: () {Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => PageTwo(passedAutheur: '$autheur',
                                      passedtitle: '$title',
                                       passedISBN: '$isbn',
                                       passedImage: '$image',   ),
                                      ));



                                      },

                                    );

                                  }
                              );})

                    )]
              ),

            )
        )
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



