import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:knctu/widgets/custom_drawer.dart';
import 'package:knctu/widgets/add_question.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        endDrawer: CustomDrawer(),
        body: Column(
          children: <Widget>[
           AddQuestion(),
          ],
        ),
      ),
    );
  }
}
