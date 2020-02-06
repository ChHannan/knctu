import 'package:flutter/material.dart';
import 'package:knctu/widgets/Drawer/drawer_shape.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
    @required this.deviceHeight,
    @required this.drawerOptions,
  }) : super(key: key);

  final double deviceHeight;
  final List<Widget> drawerOptions;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DrawerShape(heightPosition: deviceHeight),
      child: Container(
        width: 80,
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: deviceHeight * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 24,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
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
            ),
            Container(
              height: deviceHeight * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: drawerOptions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
