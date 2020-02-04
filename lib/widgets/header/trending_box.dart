import 'package:flutter/material.dart';

class TrendingBox extends StatelessWidget {
  const TrendingBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            5,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Lorem ipsum dolor sit amet, consectetur adip '
            'elit sed do eiusmod temp?',
            style: TextStyle(fontSize: 16),
          ),
          Row(
            children: <Widget>[
              Text(
                'Answer . ',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text('The Internet')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/default_avatar.jpg',
                      ),
                      radius: 15,
                    ),
                    Text(
                      'Lorem ipsum',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      2.0,
                    ),
                  ),
                ),
                child: Text(
                  'Trending',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
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
