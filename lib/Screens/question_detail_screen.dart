import 'package:flutter/material.dart';
import 'package:knctu/widgets/question/question_detail_card.dart';

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
      comments: [
        {
          'name': 'Harris Amir',
          'text':
              'An extremely insightful answer! I felt my mind blowing after reading this. The amount of information contained in this answer can only be explained and understood if you have Einstein\'s IQ.',
          'replies': [
            {'name': 'Ramish Amir', 'text': 'I second this. I have run out of stuff to say, just checking if text overflow is catered for.'},
            {'name': 'Maaz Bin Tahir Saeed', 'text': 'XD'}
          ]
        },
        {'name': 'Maaz Bin Tahir Saeed', 'text': 'No you.', 'replies': []}
      ],
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
        isLast: true)
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
