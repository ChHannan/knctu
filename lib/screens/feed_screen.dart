import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:knctu/api/api.dart';
import 'package:knctu/models/question.dart';
import 'package:knctu/widgets/home/question_answer.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          padding: EdgeInsets.only(top: 10),
          child: Image(
            image: AssetImage(
              'assets/images/appbar1.png',
            ),
            alignment: Alignment.centerLeft,
            //fit: BoxFit.contain,
          ),
        ),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: getQuestions(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var questions = List<Question>();
            for (var data in jsonDecode(snapshot.data.body)) {
              questions.add(Question.fromJson(data));
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return questions[index].answers.length != 0
                    ? QuestionAnswer(
                        question: questions[index],
                      )
                    : Container();
              },
              itemCount: questions.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFF19b7c6),
              ),
            ),
          );
        },
      ),
    );
  }
}
