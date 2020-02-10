import 'package:flutter/material.dart';
import 'package:knctu/Screens/question_detail_screen.dart';
import 'package:knctu/models/question.dart';
import 'package:knctu/widgets/question/question_toolbar.dart';

class QuestionAnswer extends StatelessWidget {
  final List<String> tags = const ['NUST', 'COMSATS', 'Engineering'];
  final Question question;

  const QuestionAnswer({Key key, @required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Card(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      QuestionDetailScreen(question: question)));
        },
        child: Container(
          padding: EdgeInsets.only(top: 12, left: 12, right: 12),
          width: _size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: _getTags(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  question.text,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Row(
                children: <Widget>[
                  CircleAvatar(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          question.answers[0]?.user?.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(question.answers[0]?.user?.title)
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(question.answers[0]?.text),
              ),
              Row(
                children: <Widget>[
                  QuestionToolbarOption(
                    icon: Icons.star_border,
                    text: 'Upvote',
                    function: () {},
                  ),
                  QuestionToolbarOption(
                    icon: Icons.comment,
                    text: 'Comment',
                    function: () {},
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
      ),
    );
  }

  List<Widget> _getTags() {
    List<Widget> _tagWidgets = List();
    for (int counter = 0;
        counter < (tags.length > 3 ? 3 : tags.length);
        counter++) {
      _tagWidgets.add(Text(
        counter == 0 ? tags[counter] : ' · ${tags[counter]}',
        style: TextStyle(
          fontSize: 13,
          color: Colors.black54,
        ),
      ));
    }
    return _tagWidgets;
  }
}
