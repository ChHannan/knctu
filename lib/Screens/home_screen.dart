import 'package:flutter/material.dart';
import 'package:knctu/widgets/Drawer/custom_drawer.dart';
import 'package:knctu/widgets/Drawer/drawer_slider.dart';
import 'package:knctu/widgets/header.dart';
import 'package:knctu/widgets/question_block.dart';

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
                QuestionBlock(),
              ],
            ),
            Positioned(
              right: 0,
              top: deviceHeight * 0.7,
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: DrawerSlider(
                  deviceHeight: deviceHeight,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
