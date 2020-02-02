import 'package:flutter/material.dart';
import 'package:knctu/widgets/header/header_bar.dart';
import 'package:knctu/widgets/header/search_bar.dart';
import 'package:knctu/widgets/header/trending_box.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      padding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 5,
      ),
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderBar(),
          SearchBar(),
          TrendingBox(),
        ],
      ),
    );
  }
}
