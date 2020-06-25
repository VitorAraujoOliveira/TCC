import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_financeira_app/UsableAssets/DateTimePicker.dart';
import '../MenuScaffold/MenuScaffold.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter/material.dart';

class DespesasEsporadicas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Esporádicas"),
        backgroundColor: Colors.green,
      ),
      body: Container(
          padding: EdgeInsets.all(10.0), child: TelaDespEsporadicas()),
      drawer: MenuScaffold(),
      backgroundColor: Colors.grey[300],
    );
  }
}

class TelaDespEsporadicas extends StatelessWidget {
  @override
  var controller = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');

  var fonteLocal = TextStyle(fontSize: 30);

  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView(children: <Widget>[
            ListTile(
                title: Text("Data", style: fonteLocal),
                trailing: EsporadicDateTimePicker()),
            Container(height: 15),
            ListTile(
              title: Text("Valor", style: fonteLocal),
              trailing: Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    style: fonteLocal,
                    textAlign: TextAlign.right,
                  )),
            ),
            Container(height: 15),
            ListTile(
              title: Text("Classe", style: fonteLocal),
              trailing: Container(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text("Placeholder"),
              ),
            ),
          ]),
        ),
        ListTile(
          title: FlatButton(
            child: Text("AAA"),
          ),
          trailing: RaisedButton(),
        ),
        ButtonTheme(
          minWidth: 50.0,
          height: 85.0,
          child: RaisedButton(
            color: Colors.green[400],
            onPressed: () {},
            child: Text("Configuração de Despesas",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        )
      ],
    );
  }
}
