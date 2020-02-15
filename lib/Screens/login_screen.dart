import 'package:flutter/material.dart';
import 'package:knctu/Animation/FadeAnimation.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*   final Shader linearGradient = LinearGradient(
  colors: <Color>[
                                Color.fromRGBO(11, 108, 173, .9),
                                Color.fromRGBO(11, 108, 173, .2),],
).createShader(Rect.fromLTWH(30.0, 300.0, 200.0, 0.0));
*/
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
                    height: deviceHeight * 0.48,
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
                                  "KnctU",
                                  style: TextStyle(
                                    fontSize: deviceHeight * 0.04 /*35.0*/,
                                    color: Color.fromRGBO(
                                      11,
                                      108,
                                      173,
                                      .6,
                                    ),
                                    //  foreground: Paint()..shader = linearGradient,
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
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter username",
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
                                    hintText: "Enter password",
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
                      FadeAnimation(
                        1.9,
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/home');
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
                              child: Text(
                                'Login',
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
                        2.1,
                        Container(
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
                                  .7,
                                ),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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
          )

          /* child: Scaffold (
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
        ) ,*/

          ),
    );
  }
}