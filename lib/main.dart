import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:knctu/api/api.dart';

import 'package:knctu/Screens/home_screen.dart';
import 'package:knctu/Screens/login_screen.dart';
import 'package:knctu/Screens/signup_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.blue,
      ),
    );
    openConnection();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
      routes: <String, WidgetBuilder>{
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
