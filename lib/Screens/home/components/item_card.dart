
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_library/Models/Item.dart';
import 'package:e_library/Screens/details/details.dart';
import '../../../Models/Item.dart';
import '../../../constants.dart';
import 'package:e_library/lib/net/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    this.item,
    this.index,
  }) : super(key: key);

  final Item item;
  final int index;

   Widget build(BuildContext context) {

     return GestureDetector(
      onTap: () {

        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(item: item, key: key ,)));
      },
     child: Expanded(child:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color(item.color)
        ),
        margin: EdgeInsets.only(top: index.isOdd ? 10 : 0, bottom: index.isOdd ? 0 : 10),

        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
               tag: item.id,
               child: Image.asset(
                  item.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.4),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                          ),

                        ],
                      ),
                      ),
                      IconButton(
                        icon: SvgPicture.asset('assets/icons/heart2.svg'),
                        onPressed: () {}
                      )

                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    )
    );

   }



   }
