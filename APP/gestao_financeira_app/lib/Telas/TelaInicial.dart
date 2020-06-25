import 'package:flutter/material.dart';
import '../MenuScaffold/MenuScaffold.dart';
import 'DespesasEsporadicas.dart';

class TelaInicial extends StatelessWidget {
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
          'Visão Mensal - (Agosto,2020)',
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
                    style: TextStyle(color: Colors.red, fontSize: 20))),
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
          height: 190,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
        ),
        Container(
          height: 500,
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: <Widget>[
              ButtonTheme(
                minWidth: 50.0,
                height: 85.0,
                child: RaisedButton(
                    color: Colors.blue[200],
                    onPressed: () {},
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
              Container(height: 10,),
              ButtonTheme(
                minWidth: 50.0,
                height: 85.0,
                child: RaisedButton(
                  color: Colors.red[200],
                  onPressed: () {},
                  child: Text("Adicionar Despesas Constantes",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),

              Container(height: 10,),
              ButtonTheme(
                minWidth: 50.0,
                height: 85.0,
                child: RaisedButton(
                  color: Colors.green[200],
                  onPressed: () {},
                  child: Text("Adicionar Rendas Constantes",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Container(height: 10,),
              ButtonTheme(
                minWidth: 50.0,
                height: 85.0,
                child: RaisedButton(
                  color: Colors.green[400],
                  onPressed: () {},
                  child: Text("Adicionar Rendas Esporádicas",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Container(height: 10,),
              ButtonTheme(
                minWidth: 100.0,
                height: 85.0,
                child: RaisedButton(
                  color: Colors.red[400],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DespesasEsporadicas()),
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
