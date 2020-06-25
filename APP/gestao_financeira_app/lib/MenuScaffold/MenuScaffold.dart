import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gestao_financeira_app/Telas/TelaInicial.dart';


class MenuScaffold extends StatelessWidget {
  Widget build(BuildContext context){
    return Drawer(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            Container(
              height:100,
              child: DrawerHeader(
              child: Text("Gestão Financeira Pessoal e Familiar",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            )),
            ListTile(
              title: Text('Inicio'),
              trailing: Icon(Icons.home, color: Colors.black,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaInicial()),
                );
              },
            ),
            ListTile(
              title: Text('Despesas'),
              trailing: Icon(Icons.attach_money, color: Colors.red,),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Rendas'),
              trailing: Icon(Icons.attach_money, color: Colors.green,),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Projeções'),
              trailing: Icon(Icons.multiline_chart, color: Colors.blue,),
              onTap: () {

              },
            ),

            ListTile(
              title: Text('Alertas'),
              trailing: Icon(Icons.warning, color: Colors.yellow[900],),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Backup'),
              trailing: Icon(Icons.backup, color: Colors.blue,),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Classes'),
              trailing: Icon(Icons.widgets, color: Colors.blue,),
              onTap: () {

              },
            ),


            ListTile(
              title: Text('Confugurar Despesas'),
              trailing: Icon(Icons.pie_chart_outlined, color: Colors.red,),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Confugurar Rendas'),
              trailing: Icon(Icons.pie_chart, color: Colors.green,),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Configurações'),
              trailing: Icon(Icons.settings, color: Colors.black,),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },),
          ],
        ),
      );
  }
}