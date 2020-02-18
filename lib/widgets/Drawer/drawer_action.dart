import 'package:flutter/material.dart';

class DrawerAction extends StatelessWidget {
  final IconData actionIcon;
  final String actionText;
  final size;

  const DrawerAction({
    @required this.actionIcon,
    @required this.actionText, this.size = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            actionIcon,
            size: size,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
