import 'package:flutter/material.dart';
import 'package:knctu/models/question.dart';
import 'package:knctu/widgets/home/question_answer.dart';

class HomeReadingTab extends StatelessWidget {
  final List<Question> questions;

  const HomeReadingTab({Key key, this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      if (questions[index].answers.length != 0) {
        return QuestionAnswer(question: questions[index]);
      }
      return Container();
    }, itemCount: questions.length);
  }
}
