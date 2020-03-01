import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:knctu/api/api.dart';
import 'package:knctu/icons/knctu_icons.dart';
import 'package:knctu/models/chat_room.dart';
import 'package:knctu/models/message.dart';
import 'package:knctu/models/user.dart';

class ChatScreen extends StatefulWidget {
  final ChatRoom chatRoom;
  final User otherUser;

  const ChatScreen({Key key, @required this.chatRoom, @required this.otherUser})
      : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var _width, _height;
  TextEditingController textController;

  @override
  initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  dispose() {
    textController.dispose();
    super.dispose();
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: _height * 0.08,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: textController,
              decoration: InputDecoration.collapsed(
                hintText: 'Enter a message',
              ),
            ),
          ),
          IconButton(
            icon: Icon(KnctUIcon.answers),
            iconSize: _width * 0.069,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              subscribe({
                'model': 'chat.chat_room',
                'info': 'CREATE_MESSAGE',
                'id': widget.chatRoom.id,
                'payload': {'text': textController.text}
              });
              textController.text = '';
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
    );
  }

  _buildMessage(Message message, bool isMe) {
    return Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
              left: 60.0,
            )
          : EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
              right: 60.0,
            ),
      padding: EdgeInsets.symmetric(
        horizontal: _width * 0.069,
        vertical: _height * 0.02,
      ),
      decoration: BoxDecoration(
        color: isMe ? Color(0xFF464646) : Color(0xFFF0F0F0),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0))
            : BorderRadius.only(
                topRight: Radius.circular(_width * 0.041),
                bottomRight: Radius.circular(_width * 0.041),
              ),
      ),
      child: Column(
        // Left justifies the columns text
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.text,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black,
              fontSize: _width * 0.0373,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: _height * 0.013),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                message.createdAt.toIso8601String(),
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: _width * 0.0331,
                  fontWeight: FontWeight.w600,
                ),
              ),
              message.messageUsers
                      .singleWhere((ele) => ele.user.id != widget.otherUser.id)
                      .isRead
                  ? Icon(
                      Icons.done_all,
                      color: Colors.white,
                      size: _width * 0.0553,
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        //brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          widget.otherUser.name,
          style: TextStyle(
            fontSize: _width * 0.0553,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_horiz,
            ),
            iconSize: _width * 0.0691,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: GestureDetector(
        // Minimizes keyboard on tap
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_width * 0.0553),
                    topRight: Radius.circular(_width * 0.0553),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_width * 0.0553),
                    topRight: Radius.circular(_width * 0.0553),
                  ),
                  child: StreamBuilder(
                      stream: socketStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && !snapshot.hasError) {
                          final data = jsonDecode(snapshot.data);
                          if (data['type'] == 'UPDATE_CHAT_ROOM') {
                            final chatRoom = ChatRoom.fromJson(data['payload']);
                            return ListView.builder(
                                reverse: true,
                                padding: EdgeInsets.only(top: _height * 0.025),
                                itemCount: widget.chatRoom.messages.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  final bool isMe =
                                      chatRoom.messages[index].user.id !=
                                          widget.otherUser.id;
                                  return _buildMessage(
                                    chatRoom.messages[index],
                                    isMe,
                                  );
                                });
                          }
                        }
                        return ListView.builder(
                            reverse: true,
                            padding: EdgeInsets.only(top: _height * 0.025),
                            itemCount: widget.chatRoom.messages.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              final bool isMe =
                                  widget.chatRoom.messages[index].user.id !=
                                      widget.otherUser.id;
                              return _buildMessage(
                                widget.chatRoom.messages[index],
                                isMe,
                              );
                            });
                      }),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
