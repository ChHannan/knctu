import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:knctu/api/api.dart';
import 'package:knctu/models/question.dart';

import 'package:knctu/widgets/home/home_reading_tab.dart';
import 'package:knctu/widgets/home/home_answer_tab.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    getQuestions();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('knctU'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
            bottom: TabBar(
              tabs: <Widget>[
                _Tab(icon: Icons.chrome_reader_mode, text: 'Reading'),
                _Tab(icon: Icons.edit, text: 'Answer')
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              FutureBuilder(builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var questions = List<Question>();
                  for (var data in jsonDecode(snapshot.data.body)) {
                    questions.add(Question.fromJson(data));
                  }
                  return HomeReadingTab(questions: questions);
                }
                return Center(child: CircularProgressIndicator());
              },
              future: getQuestions()),
              HomeAnswerTab()
            ],
          )),
    );
  }
}

class _Tab extends StatelessWidget {
  final icon;
  final text;

  const _Tab({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[Icon(icon), Text('   $text')],
      ),
    );
  }
}
