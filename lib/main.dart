import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knctu/widgets/Drawer/drawer_slider.dart';
import 'file:///C:/Users/CH.HANNAN/Desktop/knctU/lib/widgets/Drawer/custom_drawer.dart';

import 'package:knctu/widgets/header.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawer: CustomDrawer(),
//      bottomNavigationBar: BottomAppBar(
//        shape: CircularNotchedRectangle(),
//        child: Container(
//          height: 56,
//          child: Row(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[
//              IconButton(
//                icon: Icon(Icons.home),
//                onPressed: () {},
//              ),
//              IconButton(
//                icon: Icon(Icons.rss_feed),
//                onPressed: () {},
//              ),
//              IconButton(
//                icon: Icon(null),
//                onPressed: () {},
//              ),
//              IconButton(
//                icon: Icon(Icons.message),
//                onPressed: () {},
//              ),
//              IconButton(
//                icon: Icon(Icons.group),
//                onPressed: () {},
//              ),
//            ],
//          ),
//        ),
//      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Header(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Lorem Ipsum'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Sit amet dictum sit amet justo donec enim diam?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                      'sed do eiusmod tempor incididunt ut labore et '
                      'dolore magna aliqua.',
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.arrow_upward),
                        Text(
                          ' Upvote ',
                        ),
                        Text('1k')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
//        Center(
//          child: CustomPaint(
//            painter: DrawerShape(heightPosition: deviceHeight),
//            child: Container(
//              width: 90,
//            ),
//          ),
//        ),
        Positioned(
          right: 0,
          top: deviceHeight * 0.7,
          child: CustomPaint(
            painter: DrawerSlider(),
            child: Container(
              height: 100,
              width: 20,
              child: Icon(
                Icons.arrow_left,
                color: Colors.white,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
