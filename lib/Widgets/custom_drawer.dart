import 'package:flutter/material.dart';

import 'drawer_action.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      child: Drawer(
        child: Container(
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
      ),
    );
  }
}
