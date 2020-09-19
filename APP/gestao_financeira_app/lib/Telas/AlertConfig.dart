import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_financeira_app/DatabaseConnections/DAO_Objects/AlertsDAO.dart';
import 'package:gestao_financeira_app/DatabaseConnections/DAO_Objects/ClassesDAO.dart';
import 'package:gestao_financeira_app/Models/Config/ClassesModel.dart';
import 'package:gestao_financeira_app/Models/Config/AlertsModel.dart';
import 'package:gestao_financeira_app/UsableAssets/SuspendedListPicker.dart';
import 'package:gestao_financeira_app/UsableAssets/flutter_search_pannel/search_item.dart';
import '../MenuScaffold/MenuScaffold.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter/material.dart';

class AlertConfig extends StatefulWidget {
  AlertGeneral createState() => AlertGeneral();
}

class AlertGeneral extends State<AlertConfig> {
  //TelaConfigClasses telaConfigClasses;
  BotaoAdd botaoAdd;
  Widget currentPage;
  @override
  void initState() {
    super.initState();
    botaoAdd = BotaoAdd(this.callback);

    currentPage = botaoAdd;
  }

  void callback(Widget nextPage) {
    setState(() {
      this.currentPage = nextPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuração de Alertas"),
        backgroundColor: Colors.purple[300],
      ),
      persistentFooterButtons: <Widget>[BotaoAdd(this.callback)],
      body:
          Container(padding: EdgeInsets.all(10.0), child: TelaConfigClasses()),
      drawer: MenuScaffold(),
      backgroundColor: Colors.grey[300],
    );
  }
}

class TelaConfigClasses extends StatelessWidget {
  @override
  var controller = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');

  var fonteLocal = TextStyle(fontSize: 30);

  //var teste = new ClassesModel(id: 1, nome_classe: "null", tipo_classe: "Despesa");

  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          child: ItensLista(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
        ),
        Container(height: 10),
      ],
    );
  }
}

class BotaoAdd extends StatefulWidget {
  Function callback;
  BotaoAdd(this.callback);
  _BotaoAddState createState() => _BotaoAddState();
}

class _BotaoAddState extends State<BotaoAdd> {
  var valorAlerta = '';
  var descClasse = '';
  var descTipoAlerta = '';
  var valorQuandoAlertar = '';
  var controller = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');

  @override
  Widget build(BuildContext context) {
    var tipoClasse;

    // TODO: implement build
    return ButtonTheme(
      height: MediaQuery.of(context).size.height * 0.08,
      minWidth: MediaQuery.of(context).size.height * 1,
      child: FutureBuilder<dynamic>(
        future: ClassesDAO().getAllClasses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var objetoClasses = [SearchItem(0, '')];
            var objetoAlerts = [];
            var objeto = [];

            for (var i in snapshot.data) {
              objeto.add(i);
            }

            var k = 1;
            for (var j in objeto) {
              objetoClasses.add(SearchItem(k, j.nome_classe));
              k++;
            }
            print(objetoClasses);

            return RaisedButton(
              color: Colors.purple[300],
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(),
                      title: Text('Novo Alerta'),
                      content: new Column(children: [
                        new Container(height: 30),
                        Text(
                          'Tipo Alerta',
                          style: TextStyle(color: Colors.blue),
                        ),
                        new SuspendedListPicker(
                          data: [
                            SearchItem(0, ''),
                            SearchItem(1, 'Rendas'),
                            SearchItem(2, 'Despesas'),
                          ],
                          onChanged: (value, text) {
                            descTipoAlerta = text;
                          },
                        ),
                        new Text(
                          "Classe",
                          style: TextStyle(color: Colors.blue),
                        ),
                        new SuspendedListPicker(
                          data: objetoClasses,
                          onChanged: (value, text) {
                            tipoClasse = value;
                            descClasse = text;
                          },
                        ),
                        Container(
                          height: 20,
                        ),
                        Text(
                          'Valor',
                          style: TextStyle(color: Colors.blue),
                        ),
                        new Container(
                            //width: MediaQuery.of(context).size.width * 0.55,
                            child: TextField(
                          controller: controller,
                          keyboardType: TextInputType.number,
                          //style: fonteLocal,
                          textAlign: TextAlign.right,
                          onSubmitted: (value) {
                            valorAlerta = (value);
                            value = '';
                          },
                        )),
                        Container(
                          height: 20,
                        ),
                        Container(
                          height: 20,
                        ),
                        Text(
                          'Quando Alertar',
                          style: TextStyle(color: Colors.blue),
                        ),
                        new SuspendedListPicker(
                          data: [
                            SearchItem(0, ''),
                            SearchItem(1, 'Quando proximo do valor'),
                            SearchItem(2, 'Quando Passar o valor'),
                            SearchItem(3, 'Sempre que a classe for usada'),
                          ],
                          onChanged: (value, text) {
                            valorQuandoAlertar = text;
                          },
                        ),
                      ]),
                      actions: [
                        FlatButton(
                          child: Text('Voltar'),
                          onPressed: () {
                            setState(() {});
                            this.widget.callback(new TelaConfigClasses());
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('Registrar'),
                          onPressed: () {
                            var alerta = AlertsModel(
                              id_entry: Random().nextInt(10000),
                              tipo_Alerta: descTipoAlerta,
                              valor_Alerta: valorAlerta,
                              classe: descClasse,
                              classe_Alerta: valorQuandoAlertar,
                            );

                            AlertsDAO().insertAlert(alerta);
                            setState(() {});
                            this.widget.callback(new TelaConfigClasses());
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Adicionar Alerta ',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    WidgetSpan(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            throw snapshot.error;
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class ItensLista extends StatefulWidget {
  ItensListaState createState() => ItensListaState();
}

class ItensListaState extends State<ItensLista> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<dynamic>(
      future: AlertsDAO().getAllAlertsAndClasses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final objetoClasses = [];
          var objetoAlerts = [];
          var objeto = [];

          for (var i in snapshot.data) {
            objeto.add(i);
          }

          var k = 0;
          for (var j in objeto[1]) {
            objetoClasses.add(SearchItem(k, j.nome_classe));
            k++;
          }

          return ListView.builder(
            itemCount: objeto[0].length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: Text(
                    "${objeto[0][index].classe} ${objeto[0][index].classe_Alerta}  ${objeto[0][index].valor_Alerta}"),
                trailing: RaisedButton(
                  color: Colors.white,
                  child: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    print("Teste");
                    AlertsDAO().deleteAlert(objeto[0][index]);
                    setState(() {});
                  },
                ),
                onLongPress: () {},
              ));
            },
          );
        } else if (snapshot.hasError) {
          throw snapshot.error;
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
