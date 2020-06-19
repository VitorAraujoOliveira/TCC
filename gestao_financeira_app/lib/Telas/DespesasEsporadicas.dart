

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_financeira_app/UsableAssets/DateTimePicker.dart';
import '../MenuScaffold/MenuScaffold.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class DespesasEsporadicas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Esporádicas"),
        backgroundColor: Colors.green,
      ),
      body: TelaDespEsporadicas(),
      drawer: MenuScaffold(),
      backgroundColor: Colors.grey[300],
    );
  }
}

class TelaDespEsporadicas extends StatelessWidget {

  

  @override
  var DataPega;
  var controller = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');
  final format = DateFormat("yyyy-MM-dd HH:mm");
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      height: 400,
      child: ListView(children: <Widget>[
        ListTile(
            title: Text("Data", style: TextStyle(fontSize: 40)),
            trailing: Container(width: 200, child: DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1960),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime.now());
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),)
          ),
        ListTile(
          title: Text("Valor", style: TextStyle(fontSize: 40)),
          trailing: Container(
              width: 200,
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.right,
              )),
        ),
        ListTile(
          title: Text("Classe", style: TextStyle(fontSize: 40)),
          trailing: Container(
            width: 200,
            child: Text("Placeholder"),
          ),
        ),
      ]),
    );
  }
}


class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic date & time field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    ]);
  }
}
