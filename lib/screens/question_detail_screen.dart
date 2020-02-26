import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:knctu/api/api.dart';
import 'package:knctu/models/question.dart';
import 'package:knctu/widgets/question/question_detail_card.dart';

class QuestionDetailScreen extends StatefulWidget {
  final Question question;
  final bool isPushed;

  const QuestionDetailScreen({
    Key key,
    @required this.question,
    this.isPushed = false,
  }) : super(key: key);

  @override
  _QuestionDetailScreenState createState() => _QuestionDetailScreenState();
}

class _QuestionDetailScreenState extends State<QuestionDetailScreen> {
  Stream stream;
  Question question;

  @override
  void initState() {
    super.initState();
    stream = subscribe(
      {'model': 'forum.question', 'id': widget.question.id},
    );
    stream = stream.asBroadcastStream();
    question = widget.question;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        title: Image(
          image: AssetImage(
            'assets/images/appbar.png',
          ),
          height: 60,
          alignment: Alignment.centerLeft,
          //fit: BoxFit.contain,
        ),
      ),
      body: FutureBuilder(
          future: getQuestionFromId(question.id),
          builder: (context, snapshot) {
            if (snapshot.hasData && !snapshot.hasError) {
              question = Question.fromJson(jsonDecode(snapshot.data.body));
            }
            return StreamBuilder(
                stream: stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData && !snapshot.hasError) {
                    final data = jsonDecode(snapshot.data);
                    if (data['type'] == 'UPDATE_QUESTION') {
                      data['payload']['info_user'] = question.infoUser.toJson();
                      for (int counter = 0;
                          counter < question.answers.length;
                          counter++) {
                        data['payload']['answers'][counter]['info_user'] =
                            widget.question.answers
                                .elementAt(counter)
                                .infoUser
                                .toJson();
                      }
                      return _getColumn(
                        Question.fromJson(data['payload']),
                        context,
                      );
                    }
                  }
                  return _getColumn(question, context);
                });
          }),
    );
  }

  Widget _getColumn(question, context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                return QuestionDetailCard(
                    question: question,
                    index: index,
                    isLast: question.answers.length == index,
                    isPushed: index == 1 ? widget.isPushed : false,
                    notifyParent: _refresh);
              },
              itemCount: question.answers.length + 1,
            ),
          ),
        ],
      ),
    );
  }

  _refresh() {
    setState(() {});
  }
}
