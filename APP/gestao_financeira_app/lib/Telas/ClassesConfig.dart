import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_financeira_app/DatabaseConnections/DAO_Objects/ClassesDAO.dart';
import 'package:gestao_financeira_app/Models/Config/ClassesModel.dart';
import 'package:gestao_financeira_app/UsableAssets/SuspendedListPicker.dart';
import 'package:gestao_financeira_app/UsableAssets/flutter_search_pannel/search_item.dart';
import '../MenuScaffold/MenuScaffold.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter/material.dart';

class ClassesConfig extends StatefulWidget {
  ClassesGeneral createState() => ClassesGeneral();
}

class ClassesGeneral extends State<ClassesConfig> {
  @override
  var controller = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');

  var fonteLocal = TextStyle(fontSize: 30);
  var className = "";
  var tipoClasse;
  var id_entry_n = Random().nextInt(10000);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuração de Classes"),
        backgroundColor: Colors.purple[300],
      ),
      persistentFooterButtons: <Widget>[
        ButtonTheme(
          height: MediaQuery.of(context).size.height * 0.08,
          minWidth: MediaQuery.of(context).size.height * 1,
          child: RaisedButton(
            color: Colors.purple[300],
            onPressed: () {
              setState(() {});

              showDialog(
                context: context,
                barrierDismissible:
                    true, // dialog is dismissible with a tap on the barrier
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(),
                    title: Text('Dados de Classe'),
                    content: new Column(children: [
                      new Container(
                          width: 900,
                          child: new TextField(
                            autofocus: true,
                            decoration: new InputDecoration(
                                labelText: 'Nome da Classe',
                                labelStyle: TextStyle(fontSize: 20),
                                hintText: 'eg. Salário'),
                            onChanged: (value) {
                              className = value;
                            },
                          )),
                      new Container(height: 30),
                      new Text(
                        "Tipo de Classe",
                        style: TextStyle(color: Colors.blue),
                      ),
                      new SuspendedListPicker(
                        data: [
                          SearchItem(0, ""),
                          SearchItem(1, "Rendas"),
                          SearchItem(2, "Despesas")
                        ],
                        onChanged: (value, text) {
                          tipoClasse = value;
                          print("Tipo Classe: $tipoClasse");
                        },
                      )
                    ]),
                    actions: [
                      FlatButton(
                        child: Text('Voltar'),
                        onPressed: () {
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Registrar'),
                        onPressed: () {
                          var form = ClassesModel(
                              id_entry: (id_entry_n),
                              nome_classe: className,
                              tipo_classe: tipoClasse);
                          ClassesDAO().insertClass(form);

                          setState(() {});

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
                      text: 'Adicionar Classe ',
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
          ),
        )
      ],
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Text(
                "Classes de Rendas",
                style: fonteLocal,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.33,
                child: FutureBuilder<dynamic>(
                  future: ClassesDAO().getAllClasses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      //print("valor total = "+valFin.toString());
                      var objeto = [];

                      for (var i in snapshot.data) {
                        if (i.tipo_classe == 1) {
                          objeto.add(i);
                        }
                      }

                      return ListView.builder(
                        itemCount: objeto.length,
                        itemBuilder: (context, index) {
                          return Card(
                              shadowColor: Colors.black,
                              child: ListTile(
                                onTap: () {
                                  //className = objeto[index].nome_classe;
                                  showDialog(
                                    context: context,
                                    barrierDismissible:
                                        true, // dialog is dismissible with a tap on the barrier
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(),
                                        title: Text('Dados de Classe'),
                                        content: new Column(children: [
                                          new Container(
                                              width: 900,
                                              child: new TextField(
                                                autofocus: true,
                                                decoration: new InputDecoration(
                                                    labelText: 'Nome da Classe',
                                                    labelStyle:
                                                        TextStyle(fontSize: 20),
                                                    hintText: className),
                                                onChanged: (value) {
                                                  className = value;
                                                },
                                              )),
                                          new Container(height: 30),
                                          new Text(
                                            "Tipo de Classe",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          new SuspendedListPicker(
                                            data: [
                                              SearchItem(0, ""),
                                              SearchItem(1, "Rendas"),
                                              SearchItem(2, "Despesas")
                                            ],
                                            onChanged: (value, text) {
                                              tipoClasse = value;
                                              print("Tipo Classe: $tipoClasse");
                                            },
                                          )
                                        ]),
                                        actions: [
                                          FlatButton(
                                            child: Text('Voltar'),
                                            onPressed: () {
                                              setState(() {});
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          FlatButton(
                                            child: Text('Alterar'),
                                            onPressed: () {
                                              var form = ClassesModel(
                                                  id_entry:
                                                      objeto[index].id_entry,
                                                  nome_classe: className,
                                                  tipo_classe: tipoClasse);
                                              ClassesDAO().updateClass(form);

                                              setState(() {});

                                              //Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                title: Text(objeto[index].nome_classe),
                                trailing: RaisedButton(
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red[300],
                                  ),
                                  onPressed: () {
                                    ClassesDAO().delete(objeto[index]);
                                    build(context);

                                    setState(() {});
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
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
              ),
              Container(height: 10),
              Text(
                "Classes de Despesas",
                style: fonteLocal,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.33,
                child: FutureBuilder<dynamic>(
                  future: ClassesDAO().getAllClasses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      //print("valor total = "+valFin.toString());
                      var objeto = [];

                      for (var i in snapshot.data) {
                        if (i.tipo_classe == 2) {
                          objeto.add(i);
                        }
                      }

                      return ListView.builder(
                        itemCount: objeto.length,
                        itemBuilder: (context, index) {
                          //setState(() {});
                          return Card(
                              shadowColor: Colors.black,
                              child: ListTile(
                                title: Text(objeto[index].nome_classe),
                                trailing: RaisedButton(
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red[300],
                                  ),
                                  onPressed: () {
                                    ClassesDAO().delete(objeto[index]);
                                    build(context);

                                    setState(() {});
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
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
              ),
              Container(height: 10),
            ],
          )),
      drawer: MenuScaffold(),
      backgroundColor: Colors.grey[300],
    );
  }
}
