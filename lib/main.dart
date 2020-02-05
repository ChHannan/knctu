import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knctu/Screens/chat_screen.dart';
import 'package:knctu/Screens/chatlist_screen.dart';
import 'package:knctu/Screens/question_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionDetailScreen(),
    );
  }
}
