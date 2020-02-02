import 'package:flutter/material.dart';

class QuestionBlock extends StatelessWidget {
  const QuestionBlock({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Sit amet dictum sit amet justo donec enim diam?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing '
                'elit sed do eiusmod tempor incididunt ut labore '
                'et dolore magna aliqua.',
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.arrow_upward,
              ),
              Text(
                '  ' + '1k' + '   ',
              ),
              Icon(
                Icons.reply,
              ),
              Text(
                '  ' + '200',
              )
            ],
          )
        ],
      ),
    );
  }
}
