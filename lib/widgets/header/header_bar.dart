import 'package:flutter/material.dart';
import 'package:knctu/Screens/signup_screen.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'knctU',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
                            Navigator.push (
                              context ,
                              MaterialPageRoute (
                                builder: (context) => SignUpScreen() ,
                              ), 
                              ); 
                              
                              },

                  child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/default_avatar.jpg',
            ),
            radius: 22,
          ),
        ),
      ],
    );
  }
}
