import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:knctu/Screens/screen_controller.dart';
import 'package:knctu/animation/fade_animation.dart';
import 'package:knctu/api/api.dart';
import 'package:knctu/db/db.dart';
import 'package:knctu/icons/knctu_icons.dart';
import 'package:knctu/models/user.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final db = Provider.of<AppDB>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) => Container(
            child: ListView(
              children: <Widget>[
                FadeAnimation(
                  1.0,
                  Container(
                    height: deviceHeight * 0.48,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Login Page Background.jpg',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.165 * deviceWidth, /* 60.0,*/
                          ),
                          child: FadeAnimation(
                            1.3,
                            Container(
                              padding: EdgeInsets.all(deviceHeight * 0.0085),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(
                                      11,
                                      108,
                                      173,
                                      .4,
                                    ),
                                  ),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Welcome to KnctU",
                                  style: TextStyle(
                                    fontSize: deviceHeight * 0.04 /*35.0*/,
                                    color: Color.fromRGBO(
                                      11,
                                      108,
                                      173,
                                      .6,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    deviceHeight * 0.035, /*30.0*/
                  ),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                        1.6,
                        Form(
                          key: _formKey,
                          child: Container(
                            padding: EdgeInsets.all(
                              deviceHeight * 0.0065, /*5.0*/
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                deviceHeight * 0.017, /*10.0*/
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                    11,
                                    108,
                                    173,
                                    .3,
                                  ),
                                  blurRadius: 20.0,
                                  offset: Offset(
                                    2,
                                    10,
                                  ),
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(
                                    deviceHeight * 0.01,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                  ),
                                  child: TextFormField(
                                    validator: (value) => validEmail(value),
                                    onSaved: (value) => email = value,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(KnctUIcon.email_3),
                                      hintText: "Enter email",
                                      hintStyle: TextStyle(
                                        color: Colors.blueGrey[300],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(deviceHeight * 0.01),
                                  child: TextFormField(
                                    validator: (value) => validPassword(value),
                                    onSaved: (value) => password = value,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter password",
                                      prefixIcon: Icon(Icons.lock_outline),
                                      hintStyle: TextStyle(
                                        color: Colors.blueGrey[300],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: deviceHeight * 0.03),
                      FadeAnimation(
                        1.9,
                        GestureDetector(
                          onTap: () async {
                            final FormState form = _formKey.currentState;
                            if (form.validate()) {
                              form.save();
                              if (await loginProcess(email, password, db)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScreenController(),
                                  ),
                                );
                              } else {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please provide valid credenrials',
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          child: Container(
                            height: deviceHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                deviceHeight * 0.015,
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFbce4ea),
                                  Color(0xFF19b7c6),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: deviceHeight * 0.0065,
                      ),
                      FadeAnimation(
                        1.9,
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/signup',
                            );
                          },
                          child: Container(
                            height: deviceHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                deviceHeight * 0.015,
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFbce4ea),
                                  Color(0xFF19b7c6),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: deviceHeight * 0.025,
                      ),
                      FadeAnimation(
                        2.3,
                        Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Color.fromRGBO(
                              11,
                              108,
                              173,
                              .5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String validEmail(String input) {
    final RegExp regex = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
        r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:"
        r"[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input) ? null : 'Please enter a valid email address';
  }

  String validPassword(String input) {
    if (input.length < 5) {
      return 'Password should have at least 5 characters';
    } else if (input.length > 20) {
      return 'Password cannot exceed 20 characters';
    } else {
      return null;
    }
  }

  Future<bool> loginProcess(String email, String password, var db) async {
    var _tokenResponse = await login(email, password);
    if (_tokenResponse.statusCode == 200) {
      var _token = jsonDecode(_tokenResponse.body)['token'];
      setToken(_token);
      var _userResponse = await getUser();
      if (_userResponse.statusCode == 200) {
        var user = User.fromJson(
          jsonDecode(
            _userResponse.body,
          ),
        );
        loggedInUserId = user.id;
        db.userDao.insertUser(
          UserTableData(
            id: user.id,
            avatar: user.avatar,
            token: _token,
            email: user.email,
            name: user.name,
          ),
        );
        return true;
      }
    }
    return false;
  }
}
