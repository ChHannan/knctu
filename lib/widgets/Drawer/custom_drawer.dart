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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/customer-1.jpg',
                      ),
                      radius: 24,
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
