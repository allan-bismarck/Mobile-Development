import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  int escolheu_data = 0;

  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  AdaptativeDatePicker(this.selectedDate, this.onDateChanged);

  _showDatePicker(BuildContext context) {
    escolheu_data = 0;
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
          height: 180,
          child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged,
          ),
        ) : Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    selectedDate == DateTime.now() && escolheu_data == 0
                        ? 'Nenhuma data selecionada!'
                        : 'Data Selecionada: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
                  ),
                ),
                TextButton(
                  child: Text('Selecionar Data'),
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    padding: EdgeInsets.all(10),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => _showDatePicker(context),
                ),
              ],
            ),
          );
  }
}
