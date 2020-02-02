import 'package:flutter/material.dart';
import 'package:knctu/widgets/Drawer/custom_drawer.dart';
import 'package:knctu/widgets/Drawer/drawer_slider.dart';
import 'package:knctu/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawer: CustomDrawer(),
      body: Builder(
        builder: (context) => Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Header(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Recommended',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                Container(
                  height: 150,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Sit amet dictum sit amet justo donec enim diam?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing '
                        'elit sed do eiusmod tempor incididunt ut labore '
                        'et dolore magna aliqua.',
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.arrow_upward,
                          ),
                          Text(
                            '  ' + '1k' + '   ',
                          ),
                          Icon(
                            Icons.reply,
                          ),
                          Text(
                            '  ' + '200',
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: deviceHeight * 0.7,
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: CustomPaint(
                  painter: DrawerSlider(),
                  child: Container(
                    height: deviceHeight * 0.14,
                    width: 20,
                    child: Icon(
                      Icons.arrow_left,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
