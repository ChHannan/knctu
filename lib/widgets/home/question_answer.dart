import 'package:flutter/material.dart';
import 'package:knctu/Screens/question_detail_screen.dart';
import 'package:knctu/models/question.dart';
import 'package:knctu/widgets/question/question_toolbar.dart';

class QuestionAnswer extends StatelessWidget {
  final List<String> tags = const ['NUST', 'COMSATS', 'Engineering'];
  final Question question;

  const QuestionAnswer({
    Key key,
    @required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      //behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionDetailScreen(
              question: question,
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
                question.text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 17,
                  backgroundImage: AssetImage(
                    'assets/images/customer-3.jpg',
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
                          question?.user?.name,
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
                          question?.user?.title,
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
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 3),
              child: Text(
                question.answers[0].text.length > 107
                    ? question.answers[0].text.substring(0, 107) + '...'
                    : question.answers[0].text,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
