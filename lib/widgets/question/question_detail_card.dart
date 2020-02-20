import 'dart:math';

import 'package:flutter/material.dart';
import 'package:knctu/models/question.dart';
import 'package:knctu/widgets/question/comment_modal.dart';
import 'package:knctu/widgets/question/question_toolbar.dart';

class QuestionDetailCard extends StatelessWidget {
  final Question question;
  final int index;
  final bool isLast;

  const QuestionDetailCard({
    Key key,
    @required this.question,
    @required this.index,
    @required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _isQuestion = index == 0;
    final _answer = _isQuestion ? null : question.answers[index - 1];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            _isQuestion
                ? Container()
                : Container(
                    width: _size.width * 0.9,
                    alignment: Alignment(
                      -0.815,
                      -1,
                    ),
                    child: Container(
                      height: 40,
                      width: 10,
                      color: Colors.lightBlue,
                    ),
                  ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(top: 4),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: _isQuestion ? Colors.blueAccent : Colors.white,
                        width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: Container(
                    width: _size.width * 0.9,
                    constraints: BoxConstraints(minHeight: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: _size.width * 0.8 * 0.2,
                            top: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      _isQuestion
                                          ? question.user.name
                                          : _answer.user.name,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      _isQuestion
                                          ? question.user.title
                                          : _answer.user.title,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 5,
                                      ),
                                      child: true
                                          ? Icon(
                                              Icons.star,
                                              size: 20,
                                              color: Colors.amber,
                                            )
                                          : Icon(
                                              Icons.star_border,
                                              size: 20,
                                            ),
                                    ),
                                    Text(
                                      Random().nextInt(500).toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            _isQuestion ? question.text : _answer.text,
                          ),
                        ),
                        QuestionToolbar(
                          modalCall: showCommentModal,
                          isQuestion: _isQuestion,
                          commentsCount:
                              _isQuestion ? null : _answer.commentsCount,
                        )
                      ],
                    ),
                  ),
                ),
                !isLast
                    ? Container(
                        width: _size.width * 0.9,
                        child: Align(
                          alignment: Alignment(
                            -0.815,
                            -1,
                          ),
                          child: Container(
                            width: 10,
                            height: 30,
                            color: Colors.lightBlue,
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        child: Container(
                          width: _size.width * 0.6,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              Text(
                                '  Got Answer?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(
              width: _size.width * 0.9,
              child: Align(
                alignment: Alignment(
                  -0.9,
                  -1,
                ),
                child: CircleAvatar(),
              ),
            ),
          ],
        )
      ],
    );
  }

  void showCommentModal(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (context) => CommentModal(
        comments: question.answers[index - 1].comments,
      ),
    );
  }
}
