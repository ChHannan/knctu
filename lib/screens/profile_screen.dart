import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:knctu/api/api.dart';
import 'package:knctu/icons/knctu_icons.dart';
import 'package:knctu/models/user.dart';

class ProfileScreen extends StatelessWidget {
  final String id;

  const ProfileScreen({Key key, @required this.id}) : super(key: key);

  Widget _buildProfile(User user) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 0.25,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: constraints.maxHeight * 0.125,
                          decoration: BoxDecoration(color: Color(0xff19b7c6)),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              user.avatar == null
                                  ? 'assets/images/profile-avatar.jpg'
                                  : NetworkImage(user.avatar),
                            ),
                            radius: constraints.maxHeight * 0.075,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: FittedBox(
                      child: Text(
                        user.name,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: FittedBox(
                      child: Text(user.title,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                          )),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            FittedBox(
                              child: IconButton(
                                icon: Icon(
                                  KnctUIcon.chat,
                                  color: Colors.black,
                                ),
                                iconSize: 30,
                                onPressed: null,
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            FittedBox(
                              child: IconButton(
                                icon: Icon(
                                  KnctUIcon.answers,
                                  color: Colors.black,
                                ),
                                iconSize: 30,
                                onPressed: null,
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            FittedBox(
                              child: IconButton(
                                icon: Icon(
                                  KnctUIcon.questions,
                                  color: Colors.black,
                                ),
                                iconSize: 30,
                                onPressed: null,
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'PROFILE INFORMATION',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.004,
                      child: Container(
                        width: 36,
                        color: Color(0xFF19b7c6),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.006,
                    ),
                    Row(
                      children: <Widget>[
                        FittedBox(
                          child: IconButton(
                            icon: Icon(
                              KnctUIcon.education,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: null,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          child: FittedBox(
                            child: Text(
                              'SEECS, NUST',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        FittedBox(
                          child: IconButton(
                            icon: Icon(
                              KnctUIcon.location,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: null,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          child: FittedBox(
                            child: Text(
                              'Islamabad, Pakistan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        FittedBox(
                          child: IconButton(
                            icon: Icon(
                              KnctUIcon.email_3,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: null,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          child: FittedBox(
                            child: Text(
                              user.email,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'TOPICS OF INTERESTS',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.004,
                      child: Container(
                        width: 36,
                        color: Color(0xFF19b7c6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserFromId(id),
        builder: (context, snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            return _buildProfile(User.fromJson(jsonDecode(snapshot.data.body)));
          } else {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
