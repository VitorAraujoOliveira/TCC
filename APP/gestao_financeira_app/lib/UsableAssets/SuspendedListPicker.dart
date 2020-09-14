import 'package:flutter/material.dart';

import 'flutter_search_pannel/flutter_search_panel.dart';
import 'flutter_search_pannel/search_item.dart';

class SuspendedListPicker extends StatefulWidget {
  SuspendedListPicker(this.data);
  List<SearchItem<int>> data = [];
  @override
  _MyAppState createState() => new _MyAppState(data);
}

class _MyAppState extends State<SuspendedListPicker> {
  _MyAppState(this.data);
  List<SearchItem<int>> data = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.55,
        child: FlutterSearchPanel<int>(
          title: "Selecione",
          data: data,
          //padding: EdgeInsets.all(10.0),
          icon: Icon(Icons.label, color: Colors.blue[300]),
          color: Colors.white,

          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 28.0,
            // onChanged: (value) {
            //   print(value);
            // },
          ),
        ));
  }
}
