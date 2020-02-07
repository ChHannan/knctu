import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'knctU',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        Icon(
          Icons.search,
          color: Colors.white,
          size: 30,
        ),
      ],
    );
  }
}
