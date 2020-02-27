import 'package:flutter/material.dart';
import 'package:knctu/icons/knctu_icons.dart';
import 'package:knctu/models/info_user.dart';

import 'package:knctu/api/api.dart';

class QuestionToolbar extends StatefulWidget {
  final bool isQuestion;
  final Function modalCall;
  final Function answerModal;
  final InfoUser infoUser;
  final Function notifyParent;

  final upvotes;
  final commentsCount;
  final shares;
  final answers;
  final views;

  const QuestionToolbar({
    Key key,
    @required this.modalCall,
    this.isQuestion = false,
    this.upvotes,
    this.commentsCount,
    this.shares,
    this.answers,
    this.views,
    @required this.answerModal,
    this.upvotes = 0,
    this.commentsCount = 0,
    this.shares = 0,
    this.answers = 0,
    this.views = 0,
    @required this.infoUser,
    @required this.notifyParent,
  }) : super(key: key);

  @override
  _QuestionToolbarState createState() => _QuestionToolbarState();
}

class _QuestionToolbarState extends State<QuestionToolbar> {
  bool hasUpvoted;

  @override
  void initState() {
    super.initState();
    hasUpvoted = widget.infoUser.hasUpvoted;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InfoPanel(
            upvotes: widget.upvotes,
            commentsCount: widget.commentsCount,
            shares: widget.shares,
            views: widget.views,
            answers: widget.answers,
            isQuestion: widget.isQuestion),
        Container(
          color: Colors.grey.withAlpha(30),
          height: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            QuestionToolbarOption(
              icon: hasUpvoted ? Icons.star : Icons.star_border,
              iconColor: hasUpvoted ? Colors.amber : Colors.black38,
              text: hasUpvoted ? 'Upvoted' : 'Upvote',
              function: () async {
                setState(() {
                  hasUpvoted = !widget.infoUser.hasUpvoted;
                });
                patchInfoUser(widget.infoUser.id, {'has_upvoted': hasUpvoted});
                widget.notifyParent();
              },
            ),
            widget.isQuestion
                ? QuestionToolbarOption(
                    icon: KnctUIcon.answers,
                    text: 'Answer',
                    function: () {
                      answerModal();
                    },
                  )
                : QuestionToolbarOption(
                    icon: KnctUIcon.chat,
                    text: 'Comments',
                    function: () {
                      widget.modalCall();
                    },
                  ),
            QuestionToolbarOption(
              icon: Icons.share,
              text: 'Share',
              function: null,
            ),
          ],
        ),
      ],
    );
  }
}

class QuestionToolbarOption extends StatelessWidget {
  final icon;
  final iconColor;
  final text;
  final function;
  final _size = 14.0;

  const QuestionToolbarOption({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.function,
    this.iconColor = Colors.black38,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: function,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: _size,
            color: iconColor,
          ),
          Text(
            ' $text',
            style: TextStyle(
              fontSize: _size,
              color: Colors.black38,
            ),
          )
        ],
      ),
    );
  }
}

class InfoPanel extends StatelessWidget {
  final upvotes;
  final commentsCount;
  final isQuestion;
  final shares;
  final answers;
  final views;

  final _infoTextStyle = const TextStyle(
    fontSize: 13,
    color: Colors.black54,
  );

  const InfoPanel(
      {Key key,
      this.upvotes = 0,
      this.commentsCount = 0,
      this.isQuestion = false,
      this.shares = 0,
      this.answers = 0,
      this.views = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _noInfo = upvotes == 0 &&
        commentsCount == 0 &&
        shares == 0 &&
        answers == 0 &&
        views == 0;
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey.withAlpha(30),
          height: (_noInfo) ? 0 : 1,
        ),
        _noInfo
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    upvotes != 0
                        ? Text(
                            '$upvotes upvotes',
                            style: _infoTextStyle,
                          )
                        : Container(),
                    Row(
                      children: <Widget>[
                        isQuestion
                            ? answers != 0
                                ? Text(
                                    '$answers answers',
                                    style: _infoTextStyle,
                                  )
                                : Container()
                            : commentsCount != 0
                                ? Text(
                                    '$commentsCount comments',
                                    style: _infoTextStyle,
                                  )
                                : Container(),
                        (commentsCount != 0 || answers != 0) && shares != 0
                            ? Text(
                                ' · $shares shares',
                                style: _infoTextStyle,
                              )
                            : shares != 0
                                ? Text(
                                    '$shares shares',
                                    style: _infoTextStyle,
                                  )
                                : Container(),
                        (commentsCount != 0 || answers != 0 || shares != 0) &&
                                views != 0
                            ? Text(
                                ' · $views views',
                                style: _infoTextStyle,
                              )
                            : views != 0
                                ? Text(
                                    '$views views',
                                    style: _infoTextStyle,
                                  )
                                : Container(),
                      ],
                    )
                  ],
                ),
              ),
      ],
    );
  }
}
