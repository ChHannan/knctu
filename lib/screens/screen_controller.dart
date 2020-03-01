import 'package:flutter/material.dart';
import 'package:knctu/api/api.dart';

import 'package:knctu/screens/add_question.dart';
import 'package:knctu/screens/feed_screen.dart';
import 'package:knctu/screens/home_screen.dart';
import 'package:knctu/screens/chatlist_screen.dart';

import 'package:knctu/utils/constants.dart';
import 'package:knctu/widgets/drawer/custom_drawer.dart';
import 'package:knctu/widgets/drawer/drawer_slider.dart';

class ScreenController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenControllerState();
}

class ScreenControllerState extends State<ScreenController> {
  var drawerOptions = <Widget>[];
  int _screenIndex = 0;

  _getScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return ChatListScreen();
      case 2:
        return FeedScreen();
      case 4:
        return AddQuestion();
      default:
        return HomeScreen();
    }
  }

  _onSelectItem(int index) {
    setState(
      () => _screenIndex = index,
    );
    Navigator.of(context).pop();
  }

  _indexAssigner() {
    for (var i = 0; i < drawerItems.length; i++) {
      drawerOptions.add(
        GestureDetector(
          onTap: () => _onSelectItem(i),
          child: drawerItems[i],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _indexAssigner();
  }

  @override
  Widget build(BuildContext context) {
    openConnection();
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        endDrawer: CustomDrawer(
          deviceHeight: deviceHeight,
          drawerOptions: drawerOptions,
        ),
        body: Builder(
          builder: (context) => Stack(
            children: <Widget>[
              _getScreen(_screenIndex),
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
              ),
            ],
          ),
        ));
  }
}
