import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';
import 'package:knctu/Screens/screen_controller.dart';

class WalkthroughTagScreen extends StatefulWidget {
  @override
  _WalkthroughTagScreenState createState() => _WalkthroughTagScreenState();
}

class _WalkthroughTagScreenState extends State<WalkthroughTagScreen> {
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  var _selectedTags = [];

  var _tags = [
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
      'name': 'Afiniti',
      'isChecked': false,
      'followers': 10021,
    },
    {
      'name': 'Mechanical Engineering',
      'isChecked': false,
      'followers': 89167,
    },
    {
      'name': 'Programming',
      'isChecked': false,
      'followers': 200925,
    },
    {
      'name': 'Civil Engineering',
      'isChecked': false,
      'followers': 109167,
    },
    {
      'name': 'Germany',
      'isChecked': false,
      'followers': 80925,
    },
    {
      'name': 'International Opportunities',
      'isChecked': false,
      'followers': 2751,
    },
    {
      'name': 'Punjab College',
      'isChecked': false,
      'followers': 301021,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text('Select tags', style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ScreenController(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(
              8.0,
              20.0,
              8.0,
              8.0,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search tags...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _selectedTags.length == 0
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Align(
                    child: Text(
                      'SELECTED',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
          _selectedTags.length == 0
              ? Container()
              : Container(
                  child: Tags(
                    key: _tagStateKey,
                    columns: 3,
                    runSpacing: 10,
                    itemCount: _selectedTags.length,
                    itemBuilder: (index) {
                      return ItemTags(
                        key: Key(index.toString()),
                        index: index,
                        title: _selectedTags[index]['name'],
                        removeButton: ItemTagsRemoveButton(),
                        activeColor: Colors.blue,
                        pressEnabled: false,
                        onRemoved: () {
                          setState(() {
                            _selectedTags[index]['isChecked'] = false;
                            _tags.add(_selectedTags[index]);
                            _selectedTags.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Align(
              child: Text(
                'RESULTS',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _tags.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(_tags[index]['name']),
                    value: _tags[index]['isChecked'],
                    onChanged: (value) {
                      setState(() {
                        value = !value;
                        _tags[index]['isChecked'] = !value;
                        _selectedTags.add(_tags[index]);
                        _tags.removeAt(index);
                      });
                    },
                  );
                }),
          )
        ],
      ),
    );
  }

//  _getRepr(String followers) {
//    if (followers.length > 3) {
//      if (followers.length % 3 == 0) {
//        return '${followers.substring(0, 3)} K+';
//      } else if (followers.length % 2 == 0) {
//        return '${followers.substring(0, 2)} K+';
//      } else {
//        if (followers.substring(1, 2) == '0') {
//          return '${followers.substring(0, 1)} K+';
//        } else {
//          return '${followers.substring(0, 1)}.${followers.substring(1, 2)} K+';
//        }
//      }
//    } else {
//      return followers;
//    }
//  }
}
