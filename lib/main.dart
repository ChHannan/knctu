import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Widgets/custom_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        endDrawer: CustomDrawer(),
        body: Center(
          child: Text('knctU'),
        ),
      ),
    );
  }
}
