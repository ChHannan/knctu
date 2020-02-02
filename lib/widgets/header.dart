import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'knctU',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/default_avatar.jpg',
                ),
                radius: 22,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Top picks for you',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(
                  4.0,
                ),
                margin: EdgeInsets.only(
                  right: 4,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  5,
                ),
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing '
                    'elit sed do eiusmod tempor incididunt ut labore ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/default_avatar.jpg',
                      ),
                      radius: 15,
                    ),
                    Text('Lorem ipsum'),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            5,
                          ),
                        ),
                      ),
                      child: Text(
                        'Trending',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
