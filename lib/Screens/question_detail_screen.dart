import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:knctu/api/api.dart';
import 'package:knctu/models/question.dart';
import 'package:knctu/widgets/question/question_detail_card.dart';

class QuestionDetailScreen extends StatefulWidget {
  final Question question;

  const QuestionDetailScreen({
    Key key,
    @required this.question,
  }) : super(key: key);

  @override
  _QuestionDetailScreenState createState() => _QuestionDetailScreenState();
}

class _QuestionDetailScreenState extends State<QuestionDetailScreen> {

  Stream stream;

  @override
  void initState() {
    super.initState();
    stream = subscribe(
      {'model': 'forum.question', 'id': widget.question.id},
    );
    stream = stream.asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.hasData && !snapshot.hasError) {
              final data = jsonDecode(snapshot.data);
              if (data['type'] == 'UPDATE_QUESTION') {
                return _getColumn(
                  Question.fromJson(data['payload']),
                  context,
                );
              }
            }
            return _getColumn(widget.question, context);
          }),
    );
  }

  Widget _getColumn(question, context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        // AppBar Space
        Container(
          color: Colors.blue,
          height: _size.height * 0.1,
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemBuilder: (context, index) {
              return QuestionDetailCard(
                question: question,
                index: index,
                isLast: question.answers.length == index,
              );
            },
            itemCount: question.answers.length + 1,
          ),
        ),
      ],
    );
  }
}
