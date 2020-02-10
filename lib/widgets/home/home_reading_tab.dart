import 'package:flutter/material.dart';
import 'package:knctu/models/question.dart';
import 'package:knctu/widgets/home/question_answer.dart';

class HomeReadingTab extends StatelessWidget {
  final List<Question> questions;

  const HomeReadingTab({Key key, this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return QuestionAnswer(question: questions[index]);
    }, itemCount: questions.length);
  }
}
