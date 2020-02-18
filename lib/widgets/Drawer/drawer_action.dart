import 'package:flutter/material.dart';

class DrawerAction extends StatelessWidget {
  final IconData actionIcon;
  final String actionText;

  const DrawerAction({
    @required this.actionIcon,
    @required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            actionIcon,
            color: Colors.blue,
          ),
          Text(
            actionText,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
