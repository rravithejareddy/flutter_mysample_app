import 'package:flutter_sample_app/models/filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/extensions/string_extenstion.dart';

class CheckBoxList extends StatefulWidget {
  CheckBoxList({
    Key key,
    @required this.onSelected,
    @required this.values,
    @required this.filter,
  }) : super(key: key);

  final Function onSelected;
  final Map<String, bool> values;
  final Filter filter;

  @override
  _CheckBoxListState createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  List<String> cropType = ["pulses", "oilAndSeeds", "vegetables"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('CheckboxListTile demo')),
      body: new ListView(
        children: cropType.map(
          (String key) {
            return new CheckboxListTile(
              title: new Text(key.capitalize()),
              value: widget.filter.cropType.contains(key),
              onChanged: (value) {
                if (value) {
                  Filter temp = widget.filter.fromAddedItem(
                    cropType: key,
                  );

                  widget.onSelected(temp);
                } else {
                  Filter temp = widget.filter.fromRemovedItem(
                    cropType: key,
                  );

                  widget.onSelected(temp);
                }
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
