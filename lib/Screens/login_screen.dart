import 'package:flutter/material.dart';
import 'package:knctu/Screens/home_screen.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery
        .of (
        context)
        .size
        .height;
    return SafeArea (
      child: Scaffold (
        body: SingleChildScrollView (
          child: Column (
            children: <Widget>[
              Container (
                height: deviceHeight * 0.30 ,
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                  children: <Widget>[
                    Text (
                      'knctU' ,
                      style:
                      TextStyle (
                          fontSize: 40 , fontWeight: FontWeight.bold) ,
                    ) ,
                    Text (
                      'Welcome' ,
                      style: TextStyle (
                          fontSize: 20) ,
                    ) ,
                  ] ,
                ) ,
              ) ,
              Container (
                height: deviceHeight * 0.65 ,
                child: Form (
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                    children: <Widget>[
                      Padding (
                        padding: const EdgeInsets.all(
                            8.0) ,
                        child: TextFormField (
                          decoration: InputDecoration (
                              labelText: 'Email') ,
                          keyboardType: TextInputType.emailAddress ,
                        ) ,
                      ) ,
                      Padding (
                        padding: const EdgeInsets.all(
                            8.0) ,
                        child: TextFormField (
                          decoration: InputDecoration (
                              labelText: 'Password') ,
                          obscureText: true ,
                        ) ,
                      ) ,
                      FlatButton (
                        child: Text (
                          'Login' ,
                          style: TextStyle (
                              color: Colors.white) ,
                        ) ,
                        color: Colors.blue ,
                        onPressed: () {
                          Navigator.push (
                            context ,
                            MaterialPageRoute (
                              builder: (context) => HomeScreen() ,
                            ) ,
                          );
                        } ,
                      )
                    ] ,
                  ) ,
                ) ,
              ) ,
            ] ,
          ) ,
        ) ,
      ) ,
    );
  }
}