import 'package:flutter/material.dart';
import '../MenuScaffold/MenuScaffold.dart';

class DespesasEsporadicas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Esporádicas"),
        backgroundColor: Colors.green,
      ),
      body: TelaDespEsporadicas(),
      drawer: MenuScaffold(),
      backgroundColor: Colors.grey[300],
    );
  }
}

class TelaDespEsporadicas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: ListView(
        children: <Widget>[ListTile(
          title: Text("AAA"),
          trailing: Text( (DateTime.now().toString())),
        ),
        ListTile(
          title: Text("1"),
        ),
        ListTile(
          title: Text("1"),
        ),]
      ),
    );
  }
}
