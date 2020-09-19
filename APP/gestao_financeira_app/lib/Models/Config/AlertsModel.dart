import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AlertsModel {
  int id_entry;
  String data_registro;
  String tipo_Alerta;
  String valor_Alerta;
  String classe;
  String classe_Alerta;

  AlertsModel(
      {@required this.id_entry,
      @required this.tipo_Alerta,
      @required this.valor_Alerta,
      @required this.classe,
      @required this.classe_Alerta,
      this.data_registro});

  factory AlertsModel.fromJson(Map<String, dynamic> json) => AlertsModel(
        id_entry: json["id_entry"],
        data_registro: json["data_registro"],
        tipo_Alerta: json["tipo_Alerta"],
        valor_Alerta: json["valor_Alerta"],
        classe: json["classe"],
        classe_Alerta: json["classe_Alerta"],
      );

  Map<String, dynamic> toJson() => {
        "id_entry": id_entry,
        "data_registro": DateTime.now().toString(),
        "tipo_Alerta": tipo_Alerta,
        "valor_Alerta": valor_Alerta,
        "classe": classe,
        "classe_Alerta": classe_Alerta,
      };

  @override
  String toString() {
    // TODO: implement toString
    return """
    ----------------------------------
        "id_entry": $id_entry,
        "data_registro": $data_registro,
        "tipo_Alerta": $tipo_Alerta,
        "valor_Alerta": $valor_Alerta,
        "classe": $classe,
        "classe_Alerta": $classe_Alerta,
    ----------------------------------
    """;
  }
}
