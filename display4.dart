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
  List<Books>  bookList  = [];




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
            padding: EdgeInsets.all(kDefaultPadding),
            child: SafeArea(
              // bottom: false,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: kDefaultPadding),
                    SearchBar(key: widget.key,),
                    Row(
                        children: [
                          FilterButton(
                            tap: () {}, key: widget.key,
                          ),
                          Expanded (child: Categories(key: widget.key,))
                        ]
                    ),

                    SizedBox(height: kDefaultPadding),
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


                              return ListView.builder(
                                  itemExtent: 80,
                                  itemCount: snapshot.data.docs.length,
                                  itemBuilder: (context, index) {  //snapshot.data.docs[index]['nom'] ?? ''

                                    final  title = snapshot.data.docs[index]['nom'] ?? '' ;
                                    final autheur = snapshot.data.docs[index]['auteur'] ?? '' ;
                                    final isbn = snapshot.data.docs[index]['isbn'] ?? '' ;
                                    final image = snapshot.data.docs[index]['image'] ?? '' ;





                                    return ListTile( //title ,autheur , isbn , image )
                                      title : Text("BOOK TITLE : $title "),
                                      subtitle: Text("author: $autheur"),
                                      // onTap: () {Navigator.push(context, MaterialPageRoute(
                                      //     builder: (context) => bookdetails(),
                                      //   ));
                                      // },



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
