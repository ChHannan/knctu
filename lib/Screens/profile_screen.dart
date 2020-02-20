import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';
import 'package:knctu/Icons/knct_u_icons.dart';

class ProfileScreen extends StatelessWidget {

  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  final _tags = [
    {
      'name': 'Software Engineering',
      'isChecked': false,
      'followers': 98201,
    },
    {
      'name': 'NUST',
      'isChecked': false,
      'followers': 120829,
    },
    {
      'name': 'COMSATS',
      'isChecked': false,
      'followers': 70102,
    },
    {
      'name': 'Programming',
      'isChecked': false,
      'followers': 200925,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 0.25,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: constraints.maxHeight * 0.125,
                          decoration: BoxDecoration(color: Color(0xff19b7c6)),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/profile-avatar.jpg',
                            ),
                            radius: constraints.maxHeight * 0.075,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: FittedBox(
                      child: Text(
                        'Amamr Junaid',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: FittedBox(
                      child: Text('UI/UX Designer',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                          )),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            FittedBox(
                              child: IconButton(
                                icon: Icon(
                                  KnctUIcon.chat,
                                  color: Colors.black,
                                ),
                                iconSize: 30,
                                onPressed: null,
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            FittedBox(
                              child: IconButton(
                                icon: Icon(
                                  KnctUIcon.answers,
                                  color: Colors.black,
                                ),
                                iconSize: 30,
                                onPressed: null,
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            FittedBox(
                              child: IconButton(
                                icon: Icon(
                                  KnctUIcon.questions,
                                  color: Colors.black,
                                ),
                                iconSize: 30,
                                onPressed: null,
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding:
                EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'PROFILE INFORMATION',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.004,
                      child: Container(
                        width: 36,
                        color: Color(0xFF19b7c6),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.006,
                    ),
                    Row(
                      children: <Widget>[
                        FittedBox(
                          child: IconButton(
                            icon: Icon(
                              KnctUIcon.education,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: null,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          child: FittedBox(
                            child: Text(
                              'SEECS, NUST',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        FittedBox(
                          child: IconButton(
                            icon: Icon(
                              KnctUIcon.location,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: null,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          child: FittedBox(
                            child: Text(
                              'Islamabad, Pakistan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        FittedBox(
                          child: IconButton(
                            icon: Icon(
                              KnctUIcon.email_3,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: null,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          child: FittedBox(
                            child: Text(
                              'ammarj@gmail.com',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'TOPICS OF INTERESTS',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.004,
                      child: Container(
                        width: 36,
                        color: Color(0xFF19b7c6),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Tags(
                  key: _tagStateKey,
                  columns: 3,
                  runSpacing: 10,
                  itemCount: _tags.length,
                  itemBuilder: (index) {
                    return ItemTags(
                      key: Key(index.toString()),
                      index: index,
                      title: _tags[index]['name'],
                      activeColor: Color(0xFF19b7c6),
                      pressEnabled: false,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
