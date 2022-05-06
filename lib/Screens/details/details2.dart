import 'package:e_library/Models/Category.dart';
import 'package:e_library/Models/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_library/Models/Item.dart';
import 'package:e_library/components/app_bar.dart';
import 'package:e_library/constants.dart';
import '../../Models/Category.dart';
import 'package:e_library/Screens/home/components/categories.dart';

import '../../Models/Category.dart';
import 'components/title.dart';

class DetailsScreen2 extends StatelessWidget {
  final Category Category;

  const DetailsScreen2({ Key key,  this.Category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBar(
          context,
          leading: IconButton(
              icon: SvgPicture.asset('assets/icons/back.svg'),
              onPressed: () {
                Navigator.pop(context);
              }
          ),
          title: 'Detail',
          actions: <Widget>[
            IconButton(
                icon: SvgPicture.asset('assets/icons/dots.svg'),
                onPressed: () {}
            )
          ]
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.2),
            padding: EdgeInsets.only(top: size.height * 0.2),
            height: size.height * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding * 5),
                  topRight: Radius.circular(kDefaultPadding * 5),
                ),
               // color: Color(Category.color)
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleBar(key: key, Category: Category) ,

                    SizedBox(height: kDefaultPadding),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Detail',
                          style: TextStyle(
                            fontSize: 18,
                            color:Color(0xFFF8F3F3),
                          ),
                        ),


                      ],
                    ),

                    SizedBox(height: kDefaultPadding),

                    Text(
                      Category.name,
                      style: TextStyle(
                        fontSize: 14,
                        color:Color(0xFFFFFCFC),
                      ),
                    ),



                  ],
                ),
              ),
            ),
          ),

         /* Hero(
              tag: Category.id,
              child: Image.asset(
                Category.image,
                height: size.height * 0.4,
                fit: BoxFit.fitHeight,
              )
          ),*/
        ],
      ),
    );
  }
}