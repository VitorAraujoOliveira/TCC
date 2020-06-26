import 'package:flutter/material.dart';

import 'flutter_search_pannel/flutter_search_panel.dart';
import 'flutter_search_pannel/search_item.dart';


class SuspendedListPicker extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<SuspendedListPicker> {

  @override
  Widget build(BuildContext context) {
    List<SearchItem<int>> data = [
      SearchItem(0, 'Supermercado'),
      SearchItem(1, 'Netflix'),
      SearchItem(2, 'compras'),
      SearchItem(3, 'outros'),
      SearchItem(4, 'Carro'),
    ];

    return  Container(
          width: MediaQuery.of(context).size.width * 0.55,
          child: FlutterSearchPanel<int>(
                  title: "Classes",
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