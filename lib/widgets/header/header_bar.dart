import 'package:flutter/cupertino.dart';
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
        Container(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Image(
              image: AssetImage(
                'assets/images/appbar1.png',
              ),
              alignment: Alignment.centerLeft,
              //fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
          child: Icon(
            Icons.search,
            color: Colors.white,
            size: 24,
          ),
        ),
      ],
    );
  }
}
