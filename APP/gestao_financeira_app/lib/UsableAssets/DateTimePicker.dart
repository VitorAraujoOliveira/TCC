
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';


class EsporadicDateTimePicker extends StatelessWidget {
  final format = DateFormat("dd/MM/yy 'as' HH:mm");
  var tamanhoFonte = 20.0;
  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width * 0.6 ,child:
      DateTimeField(
        format: format,
        style: TextStyle(fontSize: tamanhoFonte),
        textAlign: TextAlign.right,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1950),
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
      ),
    );
  }
}

class EsporadicGainDatePicker extends StatelessWidget {
  final format = DateFormat("dd/MM/yy 'as' HH:mm");
  var tamanhoFonte = 20.0;
  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width * 0.6 ,child:
      DateTimeField(
        format: format,
        style: TextStyle(fontSize: tamanhoFonte),
        textAlign: TextAlign.right,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1950),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2200));
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
    );
  }
}