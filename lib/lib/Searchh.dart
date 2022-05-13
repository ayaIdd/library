import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:e_library/lib/display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_library/constants.dart';
import '../components/app_bar.dart';
import '../components/bottom_nav.dart';
import '../constants.dart';
import 'notification.dart';


class DataController extends GetxController {
  // Future getData(String collectionn ) async {
  //   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   QuerySnapshot snapshot =
  //       await firebaseFirestore.collection('books').get();
  //    return snapshot.docs;
  // }
  //  Future queryData(String queryString) async {
  //   return FirebaseFirestore.instance
  //       .collection('books')
  //       .where('nom', isGreaterThanOrEqualTo : queryString)
  //       .get();
  //
  //  }
 //var searchList = List.empty(growable: true ).obs ;
 final myList = [].obs;

  getSearch(String query) async {
    FirebaseFirestore.instance
        .collection('books')
        .where('nom', isGreaterThanOrEqualTo: 'aya')
        .get()
        .then((value) => myList.assignAll(value.docs) ) ;
    //myList.assignAll( listOfAnyType );
  }
}


class IteemView4 extends StatefulWidget {
  const IteemView4({Key key}) : super(key: key);
  static String id = 'login-page';
  @override
  _IteemView4 createState() => _IteemView4();


}
class _IteemView4 extends State<IteemView4>{
  List<Books> bookList  = [];
  TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData ;
  bool isExcecuted = false  ;

  @override

  Widget build(BuildContext)  {

    return Scaffold(
        appBar: buildAppBar(
            context,
            title: '',
            actions: <Widget>[
              IconButton(
                icon: SvgPicture.asset('assets/icons/notification.svg'),
                onPressed: ()  =>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>NotificationUI())),
              ),



    //           GetBuilder<DataController>(
    //            init: DataController(),
    //            builder: (val) {
    //              return IconButton(
    //                icon: Icon(Icons.search),
    //                onPressed: () {
    //                  val.queryData(searchController.text).then((value) {
    //                    snapshotData = value;
    //                    setState(() {
    //                      isExcecuted = true;
    //                    });
    //                  }
    //                  );
    //                },
    //              );
    //            },
    // ),

    ]
        ),
        extendBody: true,
        body:
        SingleChildScrollView(
            padding: EdgeInsets.all(9.0),
            child: SafeArea(
              // bottom: false
              child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: kDefaultPadding),


                    TextField(

                      onChanged: (Recherche) {
                        DataController().getSearch(Recherche);

                      },
                      decoration: InputDecoration(

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          suffixIcon: SvgPicture.asset('assets/icons/search.svg',
                              fit: BoxFit.scaleDown),
                          hintText: 'Recherche'
                      ),
                    ),




                    SizedBox(height: kDefaultPadding),
                    SizedBox(
                      child:  Text('${DataController().myList}'),
                    ),



                    SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,

                        // StreamBuilder(
                        //     stream: FirebaseFirestore.instance.collection('books').snapshots(),
                        //     builder: (context,  AsyncSnapshot<QuerySnapshot> snapshot) { //AsyncSnapshot
                        //       if (!snapshot.hasData) return Center(
                        //         child: CircularProgressIndicator(),
                        //       );

                            child  :  ListView.builder(

                                padding:EdgeInsets.only(top: 22.0,right:22.0,left: 20.0) ,// list
                                shrinkWrap: true,
                                itemExtent: 80,
                                itemCount: DataController().myList.length ?? '' ,



                                itemBuilder: (  context,   index) {  //snapshot.data.docs[index]['nom'] ?? ''


                                  final title = DataController().myList[index]['nom'];
                                  final autheur = DataController().myList[index]['auteur'];
                                  final isbn = DataController().myList[index]['isbn'];
                                  final image = DataController().myList[index]['image'];
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
                                )

                        ),

                  ]
              ),
            ))

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



