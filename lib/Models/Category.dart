import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

/* class Categoryy {
  final String categoryTitle;
  final String categoryId;
  final String icon;


  Categoryy(
      { @required this.categoryTitle,
        @required this.categoryId,
        @required this.icon,
        });
} */

class Category {
  int id;
  String name;
  String icon;

  Category({
    this.id,
    this.name,
    this.icon
  });
}

List<Category> demoCategories = [
    Category(
      id: 1,
      name: 'Mathématique',

    ),
    Category(
      id: 2,
      name: 'Physique',

    ),
    Category(
      id: 3,
      name: 'Informatique',
    ),

  ];