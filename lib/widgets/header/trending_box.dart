import 'package:flutter/material.dart';

class TrendingBox extends StatelessWidget {
  final String tagName;
  final String question;
  final String answer;
  final String name;

  const TrendingBox({
    Key key,
    this.tagName,
    this.question,
    this.answer,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            2.0,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            question,
            style: TextStyle(fontSize: 16),
          ),
          Row(
            children: <Widget>[
              Text(
                'Ans. ',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                answer,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 150,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/profile-avatar.jpg',
                      ),
                      radius: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 60,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Color(0xFF19b7c6),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      2.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    '$tagName',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
