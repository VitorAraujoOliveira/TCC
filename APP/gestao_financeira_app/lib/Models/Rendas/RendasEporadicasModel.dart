import 'dart:ffi';

import 'package:flutter/rendering.dart';


class RendasEsporadicasModel {
  int id;
  DateTime data;
  DateTime data_registro;
  Double valor;
  String classe;

  RendasEsporadicasModel({
    this.id,
    this.data,
    this.valor,
    this.classe,
    this.data_registro
  });

  factory RendasEsporadicasModel.fromJson(Map<String, dynamic> json) => RendasEsporadicasModel(
    id: json["id"],
    data: json["data"],
    data_registro: json["data_registro"],
    valor: json["valor"],
    classe: json["classe"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data": data,
    "data_registro":data_registro,
    "valor":valor,
    "classe":classe
  };


  @override
  String toString() {
    // TODO: implement toString
    return """
    ----------------------------------
    id: $id,
    name: $data,
    data_registro: $data_registro,
    valor: $valor,
    classe: $classe
    ----------------------------------
    """;
  }
}