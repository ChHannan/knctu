import 'package:flutter/material.dart';
import 'package:knctu/widgets/Drawer/drawer_action.dart';
import 'package:knctu/widgets/Drawer/drawer_shape.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return CustomPaint(
      painter: DrawerShape(heightPosition: deviceHeight),
      child: Container(
        width: 80,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                Icons.search,
                color: Colors.blue,
              ),
            ),
            DrawerAction(
              actionIcon: Icons.group,
              actionText: 'Group',
            ),
            DrawerAction(
              actionIcon: Icons.message,
              actionText: 'Message',
            ),
            DrawerAction(
              actionIcon: Icons.public,
              actionText: 'Public',
            ),
            DrawerAction(
              actionIcon: Icons.question_answer,
              actionText: 'Questions',
            ),
            DrawerAction(
              actionIcon: Icons.add,
              actionText: 'Add',
            ),
          ],
        ),
      ),
    );
  }
}
