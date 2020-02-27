import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:knctu/icons/knctu_icons.dart';
import 'package:knctu/models/question.dart';
import 'package:knctu/screens/profile_screen.dart';
import 'package:knctu/widgets/answer/answer-modal.dart';
import 'package:knctu/widgets/question/comment_modal.dart';
import 'package:knctu/widgets/question/question_toolbar.dart';

class QuestionDetailCard extends StatefulWidget {
  final Question question;
  final int index;
  final bool isLast;
  final bool isPushed;
  final Function notifyParent;

  const QuestionDetailCard({
    Key key,
    @required this.question,
    @required this.index,
    @required this.isLast,
    this.isPushed = false,
    @required this.notifyParent,
  }) : super(key: key);

  @override
  _QuestionDetailCardState createState() => _QuestionDetailCardState();
}

class _QuestionDetailCardState extends State<QuestionDetailCard> {
  bool isPushed = false;
  String upvotes = Random().nextInt(500).toString();

  @override
  void initState() {
    super.initState();
    isPushed = widget.isPushed;
    if (isPushed) {
      Timer(Duration(milliseconds: 300), showCommentModal);
    }
    isPushed = false;
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _isQuestion = widget.index == 0;
    final _answer =
        _isQuestion ? null : widget.question.answers[widget.index - 1];
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
                      color: Color(0xFF19b7c6),
                    ),
                  ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(top: 4),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: _isQuestion ? Color(0xFF19b7c6) : Colors.white,
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
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProfileScreen(
                                          id: _isQuestion
                                              ? widget.question.user.id
                                              : _answer.user.id,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        _isQuestion
                                            ? widget.question.user.name
                                            : _answer.user.name,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        _isQuestion
                                            ? widget.question.user.title
                                            : _answer.user.title,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
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
                                        child: Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Colors.amber,
                                        )),
                                    Text(
                                      upvotes,
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
                            _isQuestion ? widget.question.text : _answer.text,
                          ),
                        ),
                        QuestionToolbar(
                          notifyParent: widget.notifyParent,
                          answerModal: showAnswerModal,
                          modalCall: showCommentModal,
                          isQuestion: _isQuestion,
                          commentsCount:
                              _isQuestion ? 0 : _answer.commentsCount,
                          upvotes: _isQuestion
                              ? widget.question.upvoteCount
                              : _answer.upvoteCount,
                          views: _isQuestion
                              ? widget.question.viewCount
                              : _answer.viewCount,
                          infoUser: _isQuestion
                              ? widget.question.infoUser
                              : _answer.infoUser,
                        )
                      ],
                    ),
                  ),
                ),
                !widget.isLast
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
                            color: Color(0xFF19b7c6),
                          ),
                        ),
                      )
                    : Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                            ),
                            child: Container(
                              width: _size.width * 0.6,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFF19b7c6),
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    KnctUIcon.answers,
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
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                            id: _isQuestion
                                ? widget.question.user.id
                                : _answer.user.id)));
              },
              child: SizedBox(
                width: _size.width * 0.9,
                child: Align(
                  alignment: Alignment(
                    -0.9,
                    -1,
                  ),
                  child: CircleAvatar(),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  void showCommentModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) =>
            CommentModal(
          answer: widget.question.answers[widget.index - 1],
          comments: widget.question.answers[widget.index - 1].comments,
          upvotes: upvotes,
        ),
      ),
    );
  }

  void showAnswerModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AnswerModal();
      },
    );
  }
}
