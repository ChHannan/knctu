import 'package:flutter/material.dart';

import 'package:knctu/knct_u_icons.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints)
    {
      return Scaffold(
        appBar: AppBar(
          title: Text(
              'knctU',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold
              ),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
          Icon(Icons.search)
        ],
        ),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: constraints.maxHeight * 0.2,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: constraints.maxHeight * 0.125,
                        decoration: BoxDecoration(
                            color: Colors.blue
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: constraints.maxHeight * 0.075,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Container(
                  child: FittedBox(
                    child: Text(
                        'Bruce Wayne',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.005,
                  ),
                Container(
                  child: FittedBox(
                    child: Text(
                        'Billionare Playboy',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Container(
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          FittedBox(
                            child:IconButton(
                              icon: Icon(
                                KnctU.chat,
                                color: Colors.black,
                              ),
                              iconSize: 30,
                              onPressed: null,
                            ),
                          ),
                          FittedBox(
                            child: Text(
                                '209',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          FittedBox(
                            child:IconButton(
                              icon: Icon(
                                KnctU.answers,
                                color: Colors.black,
                              ),
                              iconSize: 30,
                              onPressed: null,
                            ),
                          ),
                          FittedBox(
                            child: Text(
                                '209',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          FittedBox(
                            child:IconButton(
                                      icon: Icon(
                                          KnctU.questions,
                                          color: Colors.black,
                                      ),
                                      iconSize: 30,
                                      onPressed: null,
                                    ),
                            ),
                          FittedBox(
                            child: Text(
                                '209',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                )
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
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
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
                      color: Colors.blue,
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
                              KnctU.school,
                              color: Colors.black,
                              size: 30,
                            )
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        child: FittedBox(
                          child: Text(
                            'The University of Superheroes',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
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
                              KnctU.location,
                              color: Colors.black,
                              size: 30,
                            )
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        child: FittedBox(
                          child: Text(
                            'Gotham, United States of America',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
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
                              KnctU.email,
                              color: Colors.black,
                              size: 30,
                            )
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        child: FittedBox(
                          child: Text(
                            'bosswayne@waynecorp.bat',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold
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
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            )
          ],
        )

      );
    }
    );
  }
}
