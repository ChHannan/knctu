import 'package:flutter/material.dart';

class QuestionDetailCard extends StatelessWidget {
  final isQuestion;
  final name;
  final title;
  final isStarred;
  final starCounter;
  final text;
  final isLast;

  const QuestionDetailCard(
      {Key key,
      this.isQuestion = false,
      @required this.name,
      @required this.title,
      this.isStarred = false,
      this.starCounter = 0,
      @required this.text,
      this.isLast = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(top: 4),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: isQuestion ? Colors.blueAccent : Colors.white,
                          width: 1.5),
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 2,
                  child: Container(
                    width: size.width * 0.9,
                    constraints: BoxConstraints(minHeight: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.8 * 0.2, top: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    title,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: isStarred
                                          ? Icon(Icons.star,
                                              size: 20, color: Colors.amber)
                                          : Icon(
                                              Icons.star_border,
                                              size: 20,
                                            ),
                                    ),
                                    Text(
                                      '($starCounter)',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            text,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                !isLast
                    ? Container(
                  width: size.width * 0.9,
                        child: Align(
                          alignment: Alignment(-0.815, -1),
                          child: Container(
                              width: 10, height: 40, color: Colors.blue),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Container(
                            width: size.width * 0.6,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                        ),
                      )
              ],
            ),
            SizedBox(
              width: size.width * 0.9,
              child: Align(
                alignment: Alignment(-0.9, -1),
                child: CircleAvatar(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
