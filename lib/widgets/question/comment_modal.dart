import 'package:flutter/material.dart';
import 'package:knctu/api/api.dart';
import 'package:knctu/icons/knctu_icons.dart';
import 'package:knctu/models/answer.dart';
import 'package:knctu/models/comment.dart';
import 'package:knctu/widgets/question/comment_card.dart';

class CommentModal extends StatefulWidget {
  final Answer answer;
  final List<Comment> comments;
  final String upvotes;

  const CommentModal(
      {Key key, this.comments, this.upvotes = '10', @required this.answer})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CommentModalState();
}

class CommentModalState extends State<CommentModal>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController _textController;
  Comment _currentComment;
  int replyIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  replyTab(comment) {
    setState(() {
      _currentComment = comment;
    });
    print('asd');
    _tabController.animateTo(1);
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (_tabController.index == 0) {
          return true;
        } else {
          setState(() {
            _tabController.index = 0;
          });
          return false;
        }
      },
      child: SingleChildScrollView(
        child: Container(
          height: _size.height * 0.95,
          width: _size.width,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: _tabController.index == 0
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${widget.upvotes} Upvotes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                _tabController.index = 0;
                              });
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                            ),
                          ),
                          Text(
                            'Replies',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          )
                        ],
                      ),
              ),
              Container(
                color: Colors.grey.withAlpha(30),
                height: 1,
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: <Widget>[
                    ListView.builder(
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) => CommentCard(
                        comment: widget.comments[index],
                        function: replyTab,
                      ),
                      itemCount: widget.comments.length,
                    ),
                    replyIndex < widget.comments.length
                        ? CommentCard(
                            comment: _currentComment,
                            canExpand: true,
                          )
                        : Container(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          controller: _textController,
                          textCapitalization: TextCapitalization.sentences,
                          // To capitalize the first letter
                          onChanged: (value) {},
                          decoration: InputDecoration.collapsed(
                            hintText: _tabController.index == 0
                                ? 'Write a comment...'
                                : 'Write a reply...',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(KnctUIcon.answers),
                        iconSize: _size.width * 0.069,
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          setState(() {
                            if (_textController.text != '') {
                              if (_tabController.index == 0) {
                                postComment({
                                  'text': _textController.text,
                                  'answer': widget.answer.id
                                });
                              } else {
                                postReply({
                                  'text': _textController.text,
                                  'comment': _currentComment.id
                                });
                              }
                            }
                          });
                          _textController.text = '';
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
