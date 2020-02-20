import 'package:flutter/material.dart';
import 'package:knctu/Animation/FadeAnimation.dart';
import 'package:knctu/Icons/knct_u_icons.dart';
import 'package:knctu/Screens/walkthrough_tag_screen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //  resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
            children: <Widget>[
              FadeAnimation(
                1.0,
                Container(
                  height: deviceHeight * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/blue-white.jpg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.165 * deviceWidth,
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
                                "Sign up to KnctU",
                                style: TextStyle(
                                  fontSize: deviceHeight * 0.04,
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
                      Container(
                        padding: EdgeInsets.all(
                          deviceHeight * 0.0065,
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
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.perm_identity),
                                  hintText: "Enter full name",
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey[300],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(deviceHeight * 0.01),
                              child: TextField(
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
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.lock_outline),
                                  hintText: "Enter password",
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey[300],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(deviceHeight * 0.01),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(KnctUIcon.education),
                                  hintText: "Enter your title, e.g: Student",
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey[300],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                deviceHeight * 0.01,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(KnctUIcon.location),
                                  hintText: "Enter your institution",
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
                    SizedBox(height: deviceHeight * 0.03),
                    SizedBox(
                      height: deviceHeight * 0.0065,
                    ),
                    FadeAnimation(
                      1.9,
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  WalkthroughTagScreen(),
                            ),
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
                                Color.fromRGBO(
                                  11,
                                  108,
                                  173,
                                  .2,
                                ),
                                Color.fromRGBO(
                                  11,
                                  108,
                                  173,
                                  .9,
                                ),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * 0.025,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
