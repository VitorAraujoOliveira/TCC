import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_financeira_app/UsableAssets/DateTimePicker.dart';

import 'package:gestao_financeira_app/UsableAssets/SuspendedListPicker.dart';
import 'package:gestao_financeira_app/UsableAssets/flutter_search_pannel/search_item.dart';
import '../MenuScaffold/MenuScaffold.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter/material.dart';

import 'Projections.dart';

class DespesasConstantes extends StatefulWidget {
  @override
  DespesasConstantesT createState() => DespesasConstantesT();
}

class DespesasConstantesT extends State<DespesasConstantes> {
  var tipoFixa = false;
  var ativarlembrete = false;
  var controller = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');
  var fonteLocal = TextStyle(fontSize: 17);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Constantes"),
        backgroundColor: Colors.green,
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView(children: <Widget>[
                  ListTile(
                    title: Text(
                      "Fixa",
                      style: fonteLocal,
                    ),
                    trailing: Switch(
                      value: tipoFixa,
                      onChanged: (value) {
                        setState(() {
                          tipoFixa = value;
                          print(tipoFixa);
                        });
                      },
                      activeTrackColor: Colors.green,
                      activeColor: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text("Periodicidade", style: fonteLocal),
                    trailing: SuspendedListPicker([
                      SearchItem(1, "Mensal"),
                    ]),
                  ),
                  ListTile(
                    title: Text("Parcelas", style: fonteLocal),
                    trailing: SuspendedListPicker([
                      SearchItem(1, "2"),
                      SearchItem(1, "3"),
                      SearchItem(1, "..."),
                      SearchItem(1, "Até Cancelada"),
                    ]),
                  ),
                  ListTile(
                      title: Text("Dia Cobrança", style: fonteLocal),
                      trailing: SuspendedListPicker([
                        SearchItem(1, "1"),
                        SearchItem(2, "2"),
                        SearchItem(3, "3"),
                        SearchItem(4, "..."),
                        SearchItem(5, "31"),
                      ])),
                  //Container(height: 15),
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
                  //Container(height: 15),
                  ListTile(
                    title: Text("Classe", style: fonteLocal),
                    trailing: SuspendedListPicker([SearchItem(1, "Classe")]),
                  ),
                  ListTile(
                    autofocus: true,
                    title: Text("Lembrete", style: fonteLocal),
                    trailing: Switch(
                      value: ativarlembrete,
                      onChanged: (value) {
                        setState(() {
                          ativarlembrete = value;
                          print(ativarlembrete);
                        });
                      },
                      activeTrackColor: Colors.green,
                      activeColor: Colors.grey,
                    ),
                  )
                ]),
              ),
              Container(height: 10),
              ListTile(
                title: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width * 0.4,
                  height: 30.0,
                  child: FlatButton(
                    color: Colors.grey[300],
                    onPressed: () {},
                    child: Text("Limpar",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),
                ),
                trailing: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width * 0.5,
                  height: 60.0,
                  child: RaisedButton(
                    color: Colors.green[400],
                    onPressed: () {},
                    child: Text("Registrar",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
              Container(height: 10),
              ButtonTheme(
                minWidth: 50.0,
                height: 85.0,
                child: RaisedButton(
                  color: Colors.red[300],
                  onPressed: () {},
                  child: Text("Configuração de Despesas",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Container(height: 10),
              ButtonTheme(
                minWidth: 50.0,
                height: 85.0,
                child: RaisedButton(
                  color: Colors.blue[300],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Projections()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.body1,
                      children: [
                        TextSpan(
                            text: 'Tela de Projeções  ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        WidgetSpan(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Icon(
                              Icons.multiline_chart,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
      drawer: MenuScaffold(),
      backgroundColor: Colors.grey[300],
    );
  }
}

//Icon(Icons.multiline_chart, color: Colors.blue,)
