import 'package:flutter/material.dart';
import 'package:knctu/icons/knctu_icons.dart';
import 'package:knctu/models/message_model.dart';
import 'package:knctu/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user; // chat room id when applying backend
  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var _width, _height;

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
                // To capitalize the first letter
                onChanged: (value) {},
                decoration: InputDecoration.collapsed(
                  hintText: 'Enter a message',
                )),
          ),
          IconButton(
            icon: Icon(KnctUIcon.answers),
            iconSize: _width * 0.069,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _buildMessage(Message1 message, bool isMe) {
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
                message.time,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: _width * 0.0331,
                  fontWeight: FontWeight.w600,
                ),
              ),
              !message.unread
                  ? Icon(
                      Icons.done_all,
                      color: Colors.blueGrey,
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
        brightness: Brightness.light,
          title: Text(widget.user.name,
              style: TextStyle(
                fontSize: _width * 0.0553,
                fontWeight: FontWeight.bold,
                color: Colors.white
              )),
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: _width * 0.0691,
              color: Colors.white,
              onPressed: () {},
            )
          ]),
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
                  child: ListView.builder(
                      reverse: true,
                      //messages start from the bottom and then rises up
                      padding: EdgeInsets.only(top: _height * 0.025),
                      itemCount: messages.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final Message1 message = messages[index];
                        final bool isMe = message.sender.id == currentUser.id;
                        return _buildMessage(
                          message,
                          isMe,
                        );
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
