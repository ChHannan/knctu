import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:knctu/widgets/header/header_bar.dart';
import 'package:knctu/widgets/header/trending_box.dart';

class CustomHeader extends StatefulWidget {
  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18,
        //vertical: 5,
      ),
      color: Color(0xFF19b7c6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderBar(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Trending',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 13.0),
            child: CarouselSlider(
              height: deviceHeight * 0.19,
              viewportFraction: 1.0,
              autoPlayInterval: Duration(seconds: 4),
              autoPlay: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeOut,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: <Widget>[
                const TrendingBox(
                  question:
                      'I want to be an entreprenuer, which field do I choose?',
                  answer: 'Software Engineering',
                  tagName: 'UET',
                  name: 'Maaz Bin Tahir',
                ),
                const TrendingBox(
                  tagName: 'GIKI',
                  question: 'Which field is the most profitable in 2020?',
                  answer: 'The field you are interested in.',
                  name: 'Eesha Arif',
                ),
                const TrendingBox(
                  tagName: 'NUST',
                  question: 'What is the acceptance rate in NUST?',
                  answer: 'Less than 10%',
                  name: 'Harris Amir',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DotsIndicator(
                current: _current,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    Key key,
    @required int current,
  })  : _current = current,
        super(key: key);

  final int _current;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 2.0,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
                  ? Color.fromRGBO(255, 255, 255, 0.8)
                  : Color.fromRGBO(0, 0, 0, 0.2),
            ),
          );
        },
      ),
    );
  }
}
