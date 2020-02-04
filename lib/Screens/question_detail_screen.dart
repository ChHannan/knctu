import 'package:flutter/material.dart';
import 'package:knctu/widgets/card/question_detail_card.dart';

class QuestionDetailScreen extends StatelessWidget {
  final widgets = [
    QuestionDetailCard(
      isQuestion: true,
      name: 'Maaz Bin Tahir Saeed',
      title: 'Software Developer',
      isStarred: true,
      starCounter: 101,
      text: 'Is there any way we can win Hackfair 2020?',
    ),
    QuestionDetailCard(
      name: 'Abdul Hannan',
      title: 'FrontEnd Developer',
      starCounter: 420,
      text: 'Yes, but only if you develop a beautiful user interface.',
    ),
    QuestionDetailCard(
      name: 'Ammar Junaid',
      title: '3.6 GPA',
      starCounter: 9000,
      isStarred: true,
      text: 'No.',
    ),
    QuestionDetailCard(
      name: 'Ramish Amir',
      title: 'Backend Developer',
      starCounter: 269,
      text: 'Let\'s play badminton',
    ),
    QuestionDetailCard(
      name: 'Eesha Arif',
      title: 'Master of all trades',
      starCounter: 499,
      text:
          'With meticulous planning and a good business plan, you can easily nail it!',
      isLast: true
    )
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          // AppBar Space
          Container(
            color: Colors.blue,
            height: size.height * 0.1,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                return widgets[index];
              },
              itemCount: widgets.length,
            ),
          )
        ],
      ),
    );
  }
}
