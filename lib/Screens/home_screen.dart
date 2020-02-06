import 'package:flutter/material.dart';
import 'package:knctu/widgets/header/custom_header.dart';
import 'package:knctu/widgets/question_block.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          CustomHeader(),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              18,
              15,
              0,
              0,
            ),
            child: Text(
              'Recommended',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          QuestionBlock(),
          QuestionBlock(),
          QuestionBlock(),
          QuestionBlock(),
          QuestionBlock(),
        ],
      ),
    );
  }
}
