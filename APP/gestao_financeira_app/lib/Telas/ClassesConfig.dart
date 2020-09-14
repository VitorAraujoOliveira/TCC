import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_financeira_app/DatabaseConnections/DAO_Objects/ClassesDAO.dart';
import 'package:gestao_financeira_app/Models/Config/ClassesModel.dart';
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
  var teste = new ClassesModel(
      id_entry: 5, nome_classe: "Classe", tipo_classe: "Renda");
  var fonteLocal = TextStyle(fontSize: 30);

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
              print(teste);
              ClassesDAO().insertClass(teste);

              //ClassesDAO().getAllClasses();

              //build(context);
              setState(() {});
              setState(() {});
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
                height: MediaQuery.of(context).size.height * 0.60,
                child: FutureBuilder<dynamic>(
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
                                print("TEste");
                                ClassesDAO().delete(objeto[index]);
                                build(context);
                                print("TEste");

                                setState(() {});
                                setState(() {});
                              },
                            ),
                            // onTap: () async {
                            //   ClassesDAO().delete(objeto[index]);
                            // },
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
                height: MediaQuery.of(context).size.height * 0.60,
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
