//import 'dart:html' as html;

import 'package:flutter/material.dart';
import '../MenuScaffold/MenuScaffold.dart';
import 'package:flutter/material.dart';

class MainConfig extends StatefulWidget {
  @override
  MainConfigWidget createState() => MainConfigWidget();
}

class MainConfigWidget extends State<MainConfig> {
  bool modoNoturno = false;
  bool daltonismo = false;
  bool dislexia = false;
  bool notificaGeral = true;
  bool advanced = true;
  bool backupAuto = true;
  bool textObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CONFIGURAÇÕES"),
        backgroundColor: Colors.green,
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.grey[200],
            child: ListView(
              children: [
                ListTile(
                  leading: Text("Modo Noturno:"),
                  trailing: Switch(
                    value: modoNoturno,
                    onChanged: (value) {
                      setState(() {
                        modoNoturno = value;
                        print(modoNoturno);
                      });
                    },
                    activeTrackColor: Colors.black,
                    activeColor: Colors.grey,
                  ),
                ),
                ListTile(
                  leading: Text("Acessibilidade: Daltonismo:"),
                  trailing: Switch(
                    value: daltonismo,
                    onChanged: (value) {
                      setState(() {
                        daltonismo = value;
                        print(daltonismo);
                      });
                    },
                    activeTrackColor: Colors.green,
                    activeColor: Colors.grey,
                  ),
                ),
                ListTile(
                  leading: Text("Acessibilidade: Dislexia:"),
                  trailing: Switch(
                    value: dislexia,
                    onChanged: (value) {
                      setState(() {
                        dislexia = value;
                        print(dislexia);
                      });
                    },
                    activeTrackColor: Colors.green,
                    activeColor: Colors.grey,
                  ),
                ),
                ListTile(
                  leading: Text("Notificações Gerais"),
                  trailing: Switch(
                    value: notificaGeral,
                    onChanged: (value) {
                      setState(() {
                        notificaGeral = value;
                        print(dislexia);
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: Text("Modo Avançado"),
                  trailing: Switch(
                    value: advanced,
                    onChanged: (value) {
                      setState(() {
                        advanced = value;
                        print(dislexia);
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: Text("Backup Automático"),
                  trailing: Switch(
                    value: backupAuto,
                    onChanged: (value) {
                      setState(() {
                        backupAuto = value;
                        print(dislexia);
                      });
                    },
                  ),
                ),
                ListTile(
                    leading: Text("Email"),
                    trailing: Container(
                      width: 280,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                      ),
                    )),
                Container(
                  height: 15,
                ),
                Container(
                  width: 400,
                  height: 300,
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[300],
                  child: Column(
                    children: [
                      Text(
                        "Apagar informações",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                      ),
                      Container(
                        height: 40,
                      ),
                      Text("Senha:"),
                      Container(
                        child: ListTile(
                          trailing: Container(
                            width: 50,
                            child: ButtonTheme(
                              minWidth: 50.0,
                              height: 50.0,
                              child: RaisedButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      textObscure = !textObscure;
                                      print(dislexia);
                                    });
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      style: Theme.of(context).textTheme.body1,
                                      children: [
                                        WidgetSpan(
                                            child: Icon(Icons.remove_red_eye)),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          leading: Container(
                            width: 250,
                            child: TextFormField(
                              obscureText: textObscure,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
      drawer: MenuScaffold(),
      backgroundColor: Colors.grey[300],
    );
  }
}
