import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:e_library/lib/bodyprofile.dart';

import '../lib/edit_profile.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFFFFEFD),
        borderRadius: BorderRadius.circular(25)
      ),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
      margin: EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.home),
              color:Colors.black,
              onPressed: () {}
          ),

          IconButton(
              icon: Icon(Icons.favorite),
              color:Colors.black,
               onPressed: () {}
    ),
          IconButton(
              icon: Icon(Icons.person ),
              color:Colors.black,
              onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ProfileUI())),
          ),

        ],
      ),
    );
  }
}

