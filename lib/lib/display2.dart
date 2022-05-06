import 'package:e_library/lib/display.dart';
import 'package:firebase_database/firebase_database.dart';
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
/*
class IteemView extends StatefulWidget {
  const IteemView({Key key}) : super(key: key);
  @override
  _IteemViewState createState() => _IteemViewState();


}
 class _IteemViewState extends State<IteemView>{
  List<Books>  bookList  = [];

 @override
 void initState(){
   super.initState();
   DatabaseReference referenceData = FirebaseDatabase.instance.ref().child('books');
   referenceData.once().then((DatabaseEvent databaseEvent){
    bookList.clear();
    var keys =  databaseEvent.snapshot.value.keys ;
    var values = databaseEvent.snapshot.value ;
//DatabaseEvent databaseEvent
    // if (values != null) {}

       for (var key in keys) {
         Data data = new Data(
           values [key]["author"],
           values [key]["country"],
           values [key]["language"],
           values [key]["link"],
           values [key]["pages"],
           values [key]["name"],
           values [key]["year"],
         );
         bookList.add(data);
       }
        setState(() {
          //
        });


   });
   

 }


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
        body: SingleChildScrollView(
        padding: EdgeInsets.all(kDefaultPadding),
             child: SafeArea(
    // bottom: false,
                 child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          SizedBox(height: kDefaultPadding),
                          SearchBar(key: widget.key,),
                          Row(
                           children:
                             [
                             FilterButton(
                              tap: () {}, key: widget.key ,
                              ),
                              Expanded(child: Categories(key: widget.key,))


                             ]
                             ),
                         SizedBox(height: kDefaultPadding),
                            SizedBox(height: kDefaultPadding),
                            StaggeredGridView.countBuilder(
                              padding: EdgeInsets.all(0),
                              crossAxisCount: 2,
                              itemCount: bookList.length,
                              crossAxisSpacing: 8,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              mainAxisSpacing: 0,
                              itemBuilder: ( _ , index) {
                                return Expanded
                                  (child: CardUi(bookList[index].author ,

                                  );
                              },
                              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                            ),





    ]))));
  }
 }

 Widget CardUi(String author , String country,String language, String  link,int pages , String name ,int year ){
  return Card(
    margin: EdgeInsets.all(15),
    color: Colors.deepOrangeAccent,
    child: Container(
      color: Colors.white,
      margin: EdgeInsets.all(11.5),
      padding: EdgeInsets.all(10),
      child: Column(
        children:
          <Widget>
        [ Text(author , style: TextStyle(color: Colors.black , fontSize: 20),),

            SizedBox(height: 5,),

         Text(country , style: TextStyle(color: Colors.black , fontSize: 20),),

            SizedBox(height: 5,),

            Text(language , style: TextStyle(color: Colors.black , fontSize: 20),),

            SizedBox(height: 5,),

            Text(link , style: TextStyle(color: Colors.black , fontSize: 20),),

            SizedBox(height: 5,),

            Text(name , style: TextStyle(color: Colors.black , fontSize: 20),),
              SizedBox(height: 5,),

            Text(year.toString() , style: TextStyle(color: Colors.black , fontSize: 20),),

        ],
      ),

    ),
  );
 }
)*/