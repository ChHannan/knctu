import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:knctu/models/chat_room.dart';
import 'package:knctu/widgets/message/favorite_contacts.dart';
import 'package:knctu/widgets/message/recent_chats.dart';

import 'package:knctu/api/api.dart';

class ChatListScreen extends StatefulWidget {
  ChatListScreen();

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
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
      body: FutureBuilder(
          future: getChatRooms(),
          builder: (context, snapshot) {
            if (snapshot.hasData && !snapshot.hasError) {
              var chatRooms = List<ChatRoom>();
              for (var chatRoom in jsonDecode(snapshot.data.body)) {
                chatRooms.add(ChatRoom.fromJson(chatRoom));
              }
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          FavoriteContacts(),
                          RecentChats(chatRooms: chatRooms),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
