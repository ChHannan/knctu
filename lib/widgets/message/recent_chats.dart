import 'package:flutter/material.dart';
import 'package:knctu/api/api.dart';
import 'package:knctu/models/chat_room.dart';
import 'package:knctu/models/message_model.dart';
import 'package:knctu/screens/chat_screen.dart';

class RecentChats extends StatelessWidget {
  final List<ChatRoom> chatRooms;

  const RecentChats({Key key, this.chatRooms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
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
              final otherUser =
                  chatRoom.users.singleWhere((ele) => ele.id != loggedInUserId);
              bool isMessageRead = true;
              final lastMessage = chatRoom.messages[0];
              if (lastMessage.user.id == loggedInUserId) {
                lastMessage.text = 'You: ${lastMessage.text}';
              } else {
                isMessageRead = chatRoom.messages[0].messageUsers
                    .singleWhere((ele) => ele.user.id == otherUser.id)
                    .isRead;
              }
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                        // TODO: PARAMETER PASS HERE
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
                    color: isMessageRead ? Colors.white : Color(0x7CA8D6EE),
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
                            radius: _width * 0.083,
                            backgroundImage: otherUser.avatar == null
                                ? AssetImage('assets/image/profile-avatar.jpg')
                                : NetworkImage(otherUser.avatar),
                          ),
                          SizedBox(
                            width: _width * 0.027,
                          ),
                          Column(
                            // Aligns name to left-side
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                // for overflow //width restriction
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  lastMessage.text,
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
                            lastMessage.createdAt.toIso8601String(),
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
            },
          ),
        ),
      ),
    );
  }
}
