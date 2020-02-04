import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
