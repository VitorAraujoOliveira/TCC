
import 'package:gestao_financeira_app/UsableAssets/LineChart.dart';

import '../MenuScaffold/MenuScaffold.dart';

import 'package:flutter/material.dart';




class Projections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projeções"),
        backgroundColor: Colors.green,
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 15), 
          child: TelaProjections()),
      drawer: MenuScaffold(),
      backgroundColor: Colors.grey[300],
    );
  }
}

class TelaProjections extends StatelessWidget {
  @override

  final estilo_texto =  TextStyle(fontSize: 20,);

  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(15),
          child: LineChartSample1(),
        ),
        Container(height: 5),
        Container(child: ListTile(
          title: Text("Data de Hoje: ", style: estilo_texto),
          trailing: Text(DateTime.now().day.toString()+"/"+DateTime.now().month.toString()+"/"+DateTime.now().year.toString(), style: estilo_texto,),
        )),
                Container(child: ListTile(
          title: Text("Total Despesas: ", style: estilo_texto),
          trailing: Text("Placeholder"),
        )),
                Container(child: ListTile(
          title: Text("Total Rendas: ", style: estilo_texto),
          trailing: Text("Placeholder"),
        )),
        Container(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(15),
          child: ListView(
            children: <Widget>[
              Text("Ultimos Ganhos", style: estilo_texto,),

            ],

          ),
        )
      ],
    );
  }
}

  
