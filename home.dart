import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_library/Models/Item.dart';
import 'package:e_library/Screens/home/components/categories.dart';
import 'package:e_library/Screens/home/components/item_card.dart';
import 'package:e_library/components/app_bar.dart';
import 'package:e_library/components/bottom_nav.dart';
import 'package:e_library/constants.dart';
import '../../lib/net/userModel.dart';
import '../../lib/notification.dart';
import 'components/filter.dart';
import 'components/search_bar.dart';



class HomeScreen extends StatefulWidget {
   HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreen createstate() => _HomeScreen();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _HomeScreen extends State<HomeScreen>{
      List<Item> demoItems  = [] ;
  @override
  Future  getBookData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    UserModel userModel = UserModel();



    final uid = UserModel().uid ;
    var data = await FirebaseFirestore.instance
        .collection('Books')
        .doc('physique')
        .collection('physique')
        .orderBy('nom', descending: true)
        .get();



    setState( () {
      demoItems = List.from(data.docs.)
    } ) ;




  }



  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(kDefaultPadding),
        child: SafeArea(
          // bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: kDefaultPadding),
              SearchBar(key: key,),
              Row(
                children: [
                  FilterButton(
                    tap: () {}, key: key,
                  ),
                  Expanded(child: Categories(key: key,))
                ]
              ),
              SizedBox(height: kDefaultPadding),
              SizedBox(height: kDefaultPadding),
                StaggeredGridView.countBuilder(
                 padding: EdgeInsets.all(0),
                 crossAxisCount: 2,
                 itemCount: demoItems.length,
                 crossAxisSpacing: 8,
                 physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 mainAxisSpacing: 0,
                 itemBuilder: (context, index) {
                   return Expanded(child: ItemCard(
                     item: demoItems[index],
                     index: index,
                     key: key,));
                 },
                 staggeredTileBuilder: (index) => StaggeredTile.fit(1),
               ),
            ],
          ),
        ),
      ),
    );
  }
}