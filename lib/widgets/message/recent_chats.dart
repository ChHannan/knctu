import 'package:flutter/material.dart';
import 'package:knctu/Screens/chat_screen.dart';
import 'package:knctu/db/db.dart';
import 'package:knctu/models/chat_room.dart';
import 'package:knctu/models/message.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class RecentChats extends StatelessWidget {
  final List<ChatRoom> chatRooms;

  const RecentChats({Key key, this.chatRooms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    final db = Provider.of<AppDB>(context);
    return FutureBuilder(
        future: db.userDao.getLoggedInUser(),
        builder: (context, snapshot) {
          return Expanded(
            child: Container(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView.builder(
                  itemCount: chatRooms.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ChatRoom chatRoom = chatRooms[index];
                    var text = '';
                    if (snapshot.hasData && !snapshot.hasError) {
                      final otherUser = chatRoom.users
                          .singleWhere((ele) => ele.id != snapshot.data.id);
                      bool isMessageRead = true;
                      final lastMessage = chatRoom.messages.length > 0
                          ? chatRoom.messages[0]
                          : Message('new_message', 'Say hi to you new friend.',
                              otherUser, DateTime.now(), null);
                      if (lastMessage.id != 'new_message') {
                        if (lastMessage.user.id == snapshot.data.id) {
                          text = 'You: ${lastMessage.text}';
                        } else {
                          isMessageRead = chatRoom.messages[0].messageUsers
                              .singleWhere((ele) => ele.user.id != otherUser.id)
                              .isRead;
                          text = lastMessage.text;
                        }
                      }
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatScreen(
                              chatRoom: chatRoom,
                              otherUser: otherUser,
                            ),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 5.0,
                            bottom: 5.0,
                            right: 20.0,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: _width * 0.05532,
                            vertical: _height * 0.015,
                          ),
                          decoration: BoxDecoration(
                            // 0x7CA8D611 a pretty green
                            color: isMessageRead
                                ? Colors.white
                                : Color(0x7CA8D6EE),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                _width * 0.05532,
                              ),
                              bottomRight: Radius.circular(
                                _width * 0.05532,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundImage: otherUser.avatar == null
                                        ? AssetImage(
                                            'assets/images/profile-avatar.jpg',
                                          )
                                        : NetworkImage(otherUser.avatar),
                                  ),
                                  SizedBox(
                                    width: _width * 0.027,
                                  ),
                                  Column(
                                    // Aligns name to left-side
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        otherUser.name,
                                        style: TextStyle(
                                          fontSize: _width * 0.041,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _height * 0.0085,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: Text(
                                          text,
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: _width * 0.035,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(height: _height * 0.034),
                                  Text(
                                    DateFormat.jm()
                                        .format(lastMessage.createdAt)
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: _width * 0.0314,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF19b7c6),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}
