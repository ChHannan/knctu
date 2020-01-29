import 'package:flutter/material.dart';

class AddQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.3,
      width: width,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Align(
            alignment: Alignment(-0.9, 0),
            child: Text('knctU', style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),),
          ),
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: width * 0.8,
              height: height * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                  ),
                  InkWell(
                      onTap: () => Navigator.of(context).push(_createRoute()),
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          width: width * 0.55,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black38)
                          ),
                          child: Align(
                            alignment: Alignment(-0.6, 0),
                            child: Text('What is your question?'),
                          )
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          AddQuestionScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      }
  );
}

class AddQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Question'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
           Container(
             height: 300,
             child: Padding(
               padding: EdgeInsets.all(10),
               child: TextField(
                 maxLines: 5,
                 style: TextStyle(
                   fontSize: 30
                 ),
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText: 'What\'s on your mind?',
                   hintStyle: TextStyle(
                     fontSize: 30,
                     color: Colors.black38
                   )
                 ),
               ),
             ),
           ),
          Expanded(
            child: Container(
              color: Colors.black38,
            ),
          )
        ],
      ),
    );
  }
}
