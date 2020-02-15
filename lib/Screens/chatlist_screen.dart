//import 'package:flutter/material.dart';
//import 'package:knctu/widgets/message/favorite_contacts.dart';
//import 'package:knctu/widgets/message/recent_chats.dart';
//
//class ChatListScreen extends StatefulWidget {
//  ChatListScreen();
//
//  @override
//  _ChatListScreenState createState() => _ChatListScreenState();
//}
//
//class _ChatListScreenState extends State<ChatListScreen> {
//  @override
//  Widget build(BuildContext context) {
//    var _width = MediaQuery.of(context).size.width;
//
//    return Scaffold(
//      backgroundColor: Theme.of(context).primaryColor,
//      appBar: AppBar(
//        title: Text(
//          'Chats',
//          style: TextStyle(
//            fontSize: _width * 0.0553,
//            fontWeight: FontWeight.bold,
//          ),
//        ),
//
//        elevation: 15.0, //elevated appbar by default
//        centerTitle: true,
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            iconSize: _width * 0.069,
//            color: Colors.white,
//            onPressed: () {},
//          ),
//        ],
//      ),
//      body: Column(
//        children: <Widget>[
//          Expanded(
//            child: Container(
//              decoration: BoxDecoration(
//                color: Colors.white,
//              ),
//              child: Column(
//                children: <Widget>[
//                  FavoriteContacts(),
//                  RecentChats(),
//                ],
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
