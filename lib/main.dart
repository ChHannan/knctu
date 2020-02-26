import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knctu/Screens/home_screen.dart';
import 'package:knctu/Screens/login_screen.dart';
import 'package:knctu/Screens/screen_controller.dart';
import 'package:knctu/Screens/signup_screen.dart';
import 'package:knctu/api/api.dart';
import 'package:knctu/db/db.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF19b7c6),
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    return Provider(
      create: (_) => AppDB(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
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
      future: db.userDao.getLoggedInUser().timeout(Duration(seconds: 5)),
      builder: (context, snapshot) {
        if (snapshot.hasData && !snapshot.hasError) {
          if (snapshot.data?.id != null) {
            setToken(snapshot.data.token);
            return ScreenController();
          }
        }
        return LoginScreen();
      },
    );
  }
}
