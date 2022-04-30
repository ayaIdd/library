import 'package:flutter/material.dart';

import 'package:e_library/Models/Category.dart';

import '../../../constants.dart';

class Categories extends StatefulWidget {
  const Categories({
     Key key,
  }) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: demoCategories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  this.selectedIndex = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:Color(0xFF111111),
                ),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.8),
                margin: EdgeInsets.only(right: kDefaultPadding * 0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    SizedBox(width: 5),

                    Text(
                      demoCategories[index].name,
                      style: TextStyle(
                        fontSize: 16,
                        color:Color(0xFFFCFBFB),
                        fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.w300
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}