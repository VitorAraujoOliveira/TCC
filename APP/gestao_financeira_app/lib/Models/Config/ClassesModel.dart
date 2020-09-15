import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ClassesModel {
  int id_entry;
  String data_registro;
  String nome_classe;
  int tipo_classe;

  ClassesModel(
      {@required this.id_entry,
      @required this.nome_classe,
      @required this.tipo_classe,
      this.data_registro});

  factory ClassesModel.fromJson(Map<String, dynamic> json) => ClassesModel(
        id_entry: json["id_entry"],
        data_registro: json["data_registro"],
        nome_classe: json["nome_classe"],
        tipo_classe: json["tipo_classe"],
      );

  Map<String, dynamic> toJson() => {
        "id_entry": id_entry,
        "data_registro": DateTime.now().toString(),
        "nome_classe": nome_classe,
        "tipo_classe": tipo_classe
      };

  @override
  String toString() {
    // TODO: implement toString
    return """
    ----------------------------------
    id_entry: $id_entry,
    data_registro: $data_registro,
    nome_classe: $nome_classe,
    tipo_classe: $tipo_classe
    ----------------------------------
    """;
  }
}
