import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knctu/Screens/home_screen.dart';
import 'package:knctu/Screens/login_screen.dart';
import 'package:knctu/Screens/profile_screen.dart';
import 'package:knctu/Screens/signup_screen.dart';
import 'package:knctu/api/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Color(0xFF19b7c6),
      ),
    );
    openConnection();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: LoginScreen()
      ),
      theme: ThemeData(
        primaryColor: Color(0xFF19b7c6),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/profile': (context) => ProfileScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
