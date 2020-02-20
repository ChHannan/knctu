import 'package:flutter/material.dart';

class QuestionToolbar extends StatelessWidget {
  final bool isQuestion;
  final Function modalCall;

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InfoPanel(
            upvotes: upvotes,
            commentsCount: commentsCount,
            shares: shares,
            views: views,
            answers: answers,
            isQuestion: isQuestion),
        Container(
          color: Colors.grey.withAlpha(30),
          height: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            QuestionToolbarOption(
              icon: Icons.star_border,
              text: 'Upvote',
              function: null,
            ),
            isQuestion
                ? QuestionToolbarOption(
                    icon: Icons.edit,
                    text: 'Answer',
                    function: null,
                  )
                : QuestionToolbarOption(
                    icon: Icons.comment,
                    text: 'Comments',
                    function: () {
                      modalCall();
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
      this.upvotes,
      this.commentsCount,
      this.isQuestion = false,
      this.shares,
      this.answers,
      this.views})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _noInfo = upvotes == null &&
        commentsCount == 0 &&
        shares == null &&
        answers == null &&
        views == null;
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey.withAlpha(30),
          height: (_noInfo || isQuestion) ? 0 : 1,
        ),
        _noInfo
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    upvotes != null
                        ? Text(
                            '$upvotes upvotes',
                            style: _infoTextStyle,
                          )
                        : Container(),
                    Row(
                      children: <Widget>[
                        isQuestion
                            ? answers != null
                                ? Text(
                                    '$answers answers',
                                    style: _infoTextStyle,
                                  )
                                : Container()
                            : commentsCount != null
                                ? Text(
                                    '$commentsCount comments',
                                    style: _infoTextStyle,
                                  )
                                : Container(),
                        (commentsCount != null || answers != null) &&
                                shares != null
                            ? Text(
                                ' · $shares shares',
                                style: _infoTextStyle,
                              )
                            : shares != null
                                ? Text(
                                    '$shares shares',
                                    style: _infoTextStyle,
                                  )
                                : Container(),
                        (commentsCount != null ||
                                    answers != null ||
                                    shares != null) &&
                                views != null
                            ? Text(
                                ' · $views views',
                                style: _infoTextStyle,
                              )
                            : views != null
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
