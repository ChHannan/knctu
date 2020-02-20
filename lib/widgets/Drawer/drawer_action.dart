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
          boxShadow: [
            BoxShadow(
              color: Colors.black38.withAlpha(30),
                blurRadius: 1.0,
                spreadRadius: 1.0,
                offset: Offset(1.0, 1.0)
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(color: Colors.black38.withAlpha(30), width: 2.0),
            ),
            height: 50,
            child: Center(
              child: Icon(
                actionIcon,
                size: size,
                color: Color(0xFF19b7c6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
