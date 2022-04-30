import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
     Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
        prefixIcon: SvgPicture.asset('assets/icons/search.svg', fit: BoxFit.scaleDown),
        hintText: 'Recherche'
      ),
    );
  }
}