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
        color: Color(0xFF19b7c6),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
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
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: Colors.black38.withAlpha(30),
                                  width: 2.0)),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/customer-1.jpg',
                            ),
                            radius: 24,
                          ),
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
            Positioned(
              top: deviceHeight * 0.76,
              left: 150,
              child: Icon(
                Icons.arrow_right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
