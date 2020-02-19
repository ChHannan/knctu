import 'package:flutter/material.dart';
import 'package:knctu/widgets/walkthrough/tag_grid.dart';
import 'package:flutter_tags/tag.dart';

class WalkthroughTagScreen extends StatefulWidget {
  @override
  _WalkthroughTagScreenState createState() => _WalkthroughTagScreenState();
}

class _WalkthroughTagScreenState extends State<WalkthroughTagScreen> {
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  var _selectedTags = [
    TagGrid(
      name: 'Software Engineering',
      isChecked: false,
      followers: 98201,
    ),
    TagGrid(
      name: 'NUST',
      isChecked: false,
      followers: 120829,
    ),
    TagGrid(
      name: 'COMSATS',
      isChecked: false,
      followers: 70102,
    ),
    TagGrid(
      name: 'Afiniti',
      isChecked: false,
      followers: 10021,
    ),
    TagGrid(
      name: 'Mechanical Engineering',
      isChecked: false,
      followers: 89167,
    ),
    TagGrid(
      name: 'Programming',
      isChecked: false,
      followers: 200925,
    ),
    TagGrid(
      name: 'Civil Engineering',
      isChecked: false,
      followers: 109167,
    ),
    TagGrid(
      name: 'Germany',
      isChecked: false,
      followers: 80925,
    ),
    TagGrid(
      name: 'International Opportunities',
      isChecked: false,
      followers: 2751,
    ),
    TagGrid(
      name: 'Punjab College',
      isChecked: false,
      followers: 301021,
    ),
  ];

  List<Widget> _buildSelectedTagRows() {
    var tagRows = <Widget>[];
    for (int i = 0; i < _selectedTags.length / 3; i++) {
      tagRows.add(Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: _buildSelectedTagRow(_selectedTags.iterator),
      ));
    }
    return tagRows;
  }

  Widget _buildSelectedTagRow(Iterator it) {
    var tags = <Widget>[];
    for (int i = 0; i < 3; i++) {
      if (it.moveNext()) {
        tags.add(Padding(
            padding: EdgeInsets.symmetric(horizontal: 1), child: it.current));
      } else {
        break;
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: tags,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Select tags'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                        )),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                child: Text(
                  'SELECTED',
                  style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            Container(
              height: size.height * 0.2,
              child: SingleChildScrollView(
                child: Tags(
                  key: _tagStateKey,
                  columns: 3,
                  runSpacing: 10,
                  itemCount: _selectedTags.length,
                  itemBuilder: (index) {
                    return ItemTags(
                      key: Key(index.toString()),
                      index: index,
                      title: _selectedTags[index].name,
                      removeButton: ItemTagsRemoveButton(),
                      activeColor: Colors.blue,
                      pressEnabled: false,
                      onRemoved: () {
                        setState(() {
                          _selectedTags.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                child: Text(
                  'RESULTS',
                  style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            Expanded(
              child: ListView.builder(itemCount: 6, itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.black87,
                        width: 1.0
                      )
                    ),
                  ),
                  title: Text(_selectedTags[index].name),
                  trailing: Text('${_selectedTags[index].followers} people'),
                );
              }),
            )
          ],
        ));
  }

  _getRepr(String followers) {
    bool _expand = followers.substring(1) == '0';
    String _letter = '';
    String _short = '${followers.substring(0)} $_letter+';
    String _long = '${followers.substring(0)}.${followers.substring(1)} $_letter+';
    if (followers.length == 4) {
      _letter = 'K';
    }
    else if (followers.length == 5) {

    }
  }
}
