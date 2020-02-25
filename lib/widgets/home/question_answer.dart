import 'package:flutter/material.dart';
import 'package:knctu/Screens/question_detail_screen.dart';
import 'package:knctu/models/question.dart';
import 'package:knctu/screens/profile_screen.dart';
import 'package:knctu/widgets/question/question_toolbar.dart';

class QuestionAnswer extends StatefulWidget {
  final Question question;

  const QuestionAnswer({
    Key key,
    @required this.question,
  }) : super(key: key);

  @override
  _QuestionAnswerState createState() => _QuestionAnswerState();
}

class _QuestionAnswerState extends State<QuestionAnswer> {
  final List<String> tags = const ['NUST', 'COMSATS', 'Engineering'];

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionDetailScreen(
              question: widget.question,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 12, left: 12, right: 12),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        width: _size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300].withOpacity(.5),
              blurRadius: 10.0, // soften the shadow
              offset: Offset(
                2.0, // Move to right 10  horizontally
                2.0, // Move to bottom 10 Vertically
              ),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: _getTags(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                widget.question.text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                            id: widget.question?.answers[0]?.user?.id)));
              },
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 17,
                    backgroundImage: widget.question?.user?.avatar != null
                        ? NetworkImage(widget.question?.user?.avatar)
                        : AssetImage(
                            'assets/images/profile-avatar.jpg',
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                          ),
                          child: Text(
                            widget.question?.answers[0]?.user?.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                          ),
                          child: Text(
                            widget.question?.answers[0]?.user?.title,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 3),
              child: Text(
                widget.question.answers[0].text.length > 107
                    ? widget.question.answers[0].text.substring(0, 107) + '...'
                    : widget.question.answers[0].text,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                QuestionToolbarOption(
                  icon: widget.question.answers[0].hasUpvoted
                      ? Icons.star
                      : Icons.star_border,
                  text: widget.question.answers[0].hasUpvoted
                      ? 'Upvoted'
                      : 'Upvote',
                  iconColor: widget.question.answers[0].hasUpvoted
                      ? Colors.amber
                      : Colors.black38,
                  function: () {
                    setState(() {
                      widget.question.answers[0].hasUpvoted =
                          !widget.question.answers[0].hasUpvoted;
                    });
                  },
                ),
                QuestionToolbarOption(
                  icon: Icons.comment,
                  text: 'Comment',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionDetailScreen(
                            question: widget.question, isPushed: true),
                      ),
                    );
                  },
                ),
                QuestionToolbarOption(
                  icon: Icons.share,
                  text: 'Share',
                  function: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getTags() {
    List<Widget> _tagWidgets = List();
    for (int counter = 0;
        counter < (tags.length > 3 ? 3 : tags.length);
        counter++) {
      _tagWidgets.add(
        Text(
          counter == 0 ? tags[counter] : ' · ${tags[counter]}',
          style: TextStyle(
            fontSize: 13,
            color: Colors.black54,
          ),
        ),
      );
    }
    return _tagWidgets;
  }
}
