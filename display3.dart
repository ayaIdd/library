import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library/lib/display.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_library/constants.dart';
import '../Screens/home/components/categories.dart';
import '../Screens/home/components/filter.dart';
import '../Screens/home/components/search_bar.dart';
import '../components/app_bar.dart';
import '../components/bottom_nav.dart';
import '../constants.dart';
import 'notification.dart';

class IteemView extends StatefulWidget {
  const IteemView({Key key}) : super(key: key);
  @override
  _IteemViewState createState() => _IteemViewState();


}
class _IteemViewState extends State<IteemView>{
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
                      stream: FirebaseFirestore.instance.collection('Books').snapshots(),
                      builder: (context,  AsyncSnapshot<QuerySnapshot> snapshot) { //AsyncSnapshot
                        if (!snapshot.hasData) return Center(
                          child: CircularProgressIndicator(),
                        );
                        return ListView.builder(
                            itemExtent: 80,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              return ListTile(title: Text(snapshot.data.docs[index]['categorie'] ?? '') ,);

                            }
                        );
                      })







                )]
                ),





            )
        )
    );


  }
}
