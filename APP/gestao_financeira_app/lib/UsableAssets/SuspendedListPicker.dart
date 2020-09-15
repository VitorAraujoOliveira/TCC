import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';

import 'flutter_search_pannel/flutter_search_panel.dart';
import 'flutter_search_pannel/search_item.dart';

class SuspendedListPicker extends StatefulWidget {
  SuspendedListPicker({
    Key key,
    this.data,
    this.onChanged,
  }) : super(key: key);

  List<SearchItem<int>> data = [];
  final Function onChanged;

  @override
  _SuspendedListPickerState createState() => _SuspendedListPickerState();
}

class _SuspendedListPickerState extends State<SuspendedListPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.55,
        child: FlutterSearchPanel<int>(
          title: "Selecione",
          data: widget.data,
          //padding: EdgeInsets.all(10.0),
          icon: Icon(Icons.label, color: Colors.blue[300]),
          color: Colors.white,
          textStyle: TextStyle(color: Colors.black, fontSize: 28.0),
          onChanged: (value) {
            widget.onChanged(value);
          },
        ));
  }
}
