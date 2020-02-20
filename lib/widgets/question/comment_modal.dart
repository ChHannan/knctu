import 'package:flutter/material.dart';
import 'package:knctu/models/comment.dart';
import 'package:knctu/widgets/question/comment_card.dart';

class CommentModal extends StatefulWidget {
  final List<Comment> comments;

  const CommentModal({
    Key key,
    this.comments,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CommentModalState();
}

class CommentModalState extends State<CommentModal>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int replyIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  replyTab() {
    setState(() {
      _tabController.animateTo(1);
    });
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
                            '9000 Upvotes',
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
                            comment: widget.comments[replyIndex],
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
                        icon: Icon(Icons.add_comment),
                        iconSize: _size.width * 0.069,
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
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
