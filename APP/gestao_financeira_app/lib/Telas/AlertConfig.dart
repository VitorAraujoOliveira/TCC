import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_financeira_app/DatabaseConnections/DAO_Objects/ClassesDAO.dart';
import 'package:gestao_financeira_app/Models/Config/ClassesModel.dart';
import '../MenuScaffold/MenuScaffold.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter/material.dart';

class AlertConfig extends StatefulWidget {
  AlertGeneral createState() => AlertGeneral();
}

class AlertGeneral extends State<AlertConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuração de Alertas"),
        backgroundColor: Colors.purple[300],
      ),
      persistentFooterButtons: <Widget>[BotaoAdd()],
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

class BotaoAdd extends StatelessWidget {
  @override
  var teste = new ClassesModel(
      id_entry: 55855, nome_classe: "Classe", tipo_classe: "Renda");

  Widget build(BuildContext context) {
    // TODO: implement build
    return ButtonTheme(
      height: MediaQuery.of(context).size.height * 0.08,
      minWidth: MediaQuery.of(context).size.height * 1,
      child: RaisedButton(
        color: Colors.purple[300],
        onPressed: () {
          print(teste);
          ClassesDAO().insertClass(teste);
          //ItensLista().build(context);
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
      ),
    );
  }
}

class ItensLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<dynamic>(
      future: ClassesDAO().getAllClasses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          //print("valor total = "+valFin.toString());
          var objeto = [];

          for (var i in snapshot.data) {
            objeto.add(i);
          }

          return ListView.builder(
            itemCount: objeto.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(objeto[index].toString()),
                trailing: RaisedButton(
                  child: Text("delete"),
                  onPressed: () {
                    print("Teste");
                    var X = new ClassesDAO().delete(objeto[index]);
                    new ItensLista().build(context);
                    print("Teste");
                    print(X);
                  },
                ),
                onTap: () async {
                  ClassesDAO().delete(objeto[index]);
                },
                onLongPress: () {},
              );
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