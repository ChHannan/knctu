import 'package:flutter/material.dart';

class TagGrid extends StatefulWidget {
  final String name;
  final isChecked;
  final followers;

  const TagGrid({
    Key key,
    this.name,
    this.isChecked,
    this.followers,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TagGridState();
}

class TagGridState extends State<TagGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blue,
        ),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.name.substring(
                0,
                widget.name.length > 10 ? 10 : widget.name.length,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(
              Icons.cancel,
              size: 14,
            ),
          )
        ],
      ),
    );
  }
}
