import 'package:flutter/material.dart';
import 'package:knctu/widgets/message/favorite_contacts.dart';
import 'package:knctu/widgets/message/recent_chats.dart';

class ChatListScreen extends StatefulWidget {
  ChatListScreen();

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Image(
          image: AssetImage(
            'assets/images/appbar.png',
          ),
          height: 60,
          alignment: Alignment.centerLeft,
          //fit: BoxFit.contain,
        ),
        elevation: 0, //elevated appbar by default
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
