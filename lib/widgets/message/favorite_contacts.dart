import 'package:flutter/material.dart';
import 'package:knctu/models/message_model.dart';
import 'package:knctu/screens/chat_screen.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _height * 0.015),
      child: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            child: ListView.builder(
              // To allow scroll without getting cut off by the container
              padding: EdgeInsets.only(left: _width * 0.028),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        // TODO: PARAMETER PASS HERE
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(_height * 0.01),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: _width * 0.083,
                          backgroundImage:
                              AssetImage(favorites[index].imageUrl),
                        ),
                        //  SizedBox(height:_height * 0.005),
                        Text(
                          favorites[index].name,
                          style: TextStyle(
                            fontSize: _width * 0.035,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
