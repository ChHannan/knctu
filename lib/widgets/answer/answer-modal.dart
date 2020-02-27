import 'package:flutter/material.dart';


class AnswerModal extends StatelessWidget {
  const AnswerModal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.85,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 10,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Color(
                      0xFF19b7c6,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                  top: 10.0,
                ),
                child: Text(
                  'Answer',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(
                  top: 10.0,
                  right: 10,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(
                        0xFF19b7c6,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          Container(
            height: deviceHeight * 0.775,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        8.0,
                        0.0,
                        8.0,
                        10.0,
                      ),
                      child: Text(
                        'Can we win HackFair 2020? Can we win HackFair 2020?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    height: 7,
                    color: Colors.grey[300],
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        8.0,
                        8.0,
                        8.0,
                        MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: TextField(
                        cursorColor: Color(
                          0xFF19b7c6,
                        ),
                        autofocus: true,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Write Your Answer',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
