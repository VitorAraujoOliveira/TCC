import 'package:flutter/material.dart';
import 'package:gestao_financeira_app/Telas/DespesasConstantes.dart';
import '../MenuScaffold/MenuScaffold.dart';
import 'DespesasEsporadicas.dart';
import 'MainConfig.dart';
import 'DespesasConstantes.dart';
import 'RendasEsporadicas.dart';

class TelaInicial extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerência Financeira"),
        backgroundColor: Colors.green,
      ),
      body: TelaPrincipal(),
      drawer: MenuScaffold(),
      backgroundColor: Colors.grey[300],
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Text(
          'Visão Mensal - (Setembro,2020)',
          style: TextStyle(fontSize: 20),
        ),
        Container(
          //color: Colors.grey[300],
          child: ListView(children: <Widget>[
            ExpansionTile(
              title: Text(
                "Rendas Totais: ",
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              trailing: Text('\$ 445,56',
                  style: TextStyle(color: Colors.green, fontSize: 20)),
            ),
            ExpansionTile(
              title: Text("Despesas Totais: ",
                  style: TextStyle(color: Colors.red, fontSize: 20)),
              trailing: Text('\$ 123,33',
                  style: TextStyle(color: Colors.red, fontSize: 20)),
              children: [
                ListTile(
                  title: Text("10/09/2020"),
                  trailing: Text("10,33"),
                ),
                ListTile(
                  title: Text("03/09/2020"),
                  trailing: Text("13,00"),
                ),
                ListTile(
                  title: Text("01/09/2020"),
                  trailing: Text("100,00"),
                ),
              ],
            ),
            ExpansionTile(
                title: Text(
                  "Saldos Totais: ",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Text(
                  '\$ 332,23',
                  style: TextStyle(fontSize: 20),
                ))
          ]),
          height: MediaQuery.of(context).size.height * 0.25,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.59,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.10,
                child: RaisedButton(
                    color: Colors.blue[200],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainConfig()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.body1,
                        children: [
                          TextSpan(
                              text: 'Configurações  ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          WidgetSpan(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              Container(
                height: 10,
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.10,
                child: RaisedButton(
                  color: Colors.red[200],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DespesasConstantes()),
                    );
                  },
                  child: Text("Adicionar Despesas Constantes",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Container(
                height: 10,
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.10,
                child: RaisedButton(
                  color: Colors.green[200],
                  onPressed: () {},
                  child: Text("Adicionar Rendas Constantes",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Container(
                height: 10,
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.10,
                child: RaisedButton(
                  color: Colors.green[400],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RendasEsporadicas()),
                    );
                  },
                  child: Text("Adicionar Rendas Esporádicas",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Container(
                height: 10,
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.10,
                child: RaisedButton(
                  color: Colors.red[400],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DespesasEsporadicas()),
                    );
                  },
                  child: Text("Adicionar Despesas Esporádicas",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
