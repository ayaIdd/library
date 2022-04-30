import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_library/Models/Item.dart';

import '../../../constants.dart';




class TitleBar extends StatelessWidget {

   TitleBar({
     Key key,
     this.item,
  }) : super(key: key);

  final Item item;
  Color _favIconColor = Colors.white;
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: TextStyle(
                fontSize: 24
              ),
            ),


          ],
        ),

        IconButton(
          icon: Icon(Icons.favorite),
          color: _favIconColor,
          tooltip: 'Add to favorite',
          onPressed: () {
            setState(() {
              if(_favIconColor == Colors.white){
                _favIconColor = Colors.red;
              }else{
                _favIconColor = Colors.white;
              }
            });
          },
        ),
      ],
    );
  }

  void setState(Null Function() param0) {}
}