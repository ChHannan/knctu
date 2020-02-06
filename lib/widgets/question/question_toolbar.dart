import 'package:flutter/material.dart';

class QuestionToolbar extends StatelessWidget {
  final bool isQuestion;
  final Function modalCall;

  final upVotes;
  final comments;
  final shares;
  final answers;
  final views;

  final _infoTextStyle = const TextStyle(
    fontSize: 13,
    color: Colors.black54,
  );

  const QuestionToolbar({
    Key key,
    @required this.modalCall,
    this.isQuestion = false,
    this.upVotes,
    this.comments,
    this.shares,
    this.answers,
    this.views,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _noInfo = upVotes == null &&
        comments == null &&
        shares == null &&
        answers == null &&
        views == null;
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey.withAlpha(30),
          height: _noInfo ? 0 : 1,
        ),
        _noInfo
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    upVotes != null
                        ? Text(
                            '$upVotes upvotes',
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
                            : comments != null
                                ? Text(
                                    '$comments comments',
                                    style: _infoTextStyle,
                                  )
                                : Container(),
                        (comments != null || answers != null) && shares != null
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
                        (comments != null ||
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
        Container(
          color: Colors.grey.withAlpha(30),
          height: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                      modalCall(context);
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
  final _size = 15.0;

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
