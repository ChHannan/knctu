import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knctu/screens/screen_controller.dart';

import 'package:provider/provider.dart';

import 'package:knctu/screens/home_screen.dart';
import 'package:knctu/screens/login_screen.dart';
import 'package:knctu/screens/signup_screen.dart';

import 'package:knctu/api/api.dart';
import 'package:knctu/db/db.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF19b7c6),
        systemNavigationBarColor: Colors.white,
      ),
    );
    openConnection();
    return Provider(
      create: (_) => AppDB(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light, child: CurrentRoute()),
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
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}

class CurrentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDB>(context);
    return FutureBuilder(
      future: db.userDao.getLoggedInUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData && !snapshot.hasError) {
          if (snapshot.data?.id != null) {
            setToken(snapshot.data.token);
            return ScreenController();
          }
          return LoginScreen();
        }
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
