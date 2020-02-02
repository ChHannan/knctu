import 'package:flutter/material.dart';
import 'package:knctu/widgets/header/trending_box.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Top picks for you',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(
                  4.0,
                ),
                margin: EdgeInsets.only(
                  right: 4,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          TrendingBox(),
        ],
      ),
    );
  }
}

