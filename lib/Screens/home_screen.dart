import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:knctu/api/api.dart';

import 'package:knctu/models/question.dart';
import 'package:knctu/widgets/header/custom_header.dart';
import 'package:knctu/widgets/home/question_answer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('knctU'), actions: <Widget>[
        Icon(Icons.search)
      ],),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: CustomAppBar(deviceHeight * 0.40),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                10,
                15,
                0,
                5,
              ),
              child: Text(
                'Recommended',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: getQuestions(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var questions = List<Question>();

                for (var data in jsonDecode(snapshot.data.body)) {
                  questions.add(Question.fromJson(data));
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => QuestionAnswer(
                      question: questions[index],
                    ),
                    childCount: questions.length,
                  ),
                );
              }
              return SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(
                    top: deviceHeight * 0.23,
                  ),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  CustomAppBar(this.expandedHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return CustomHeader();
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(CustomAppBar oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight;
  }
}
