import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_text_field.dart';
import 'adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _SubmitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + (MediaQuery.of(context).viewInsets.bottom),
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                'Título',
                _titleController,
                TextInputType.text,
                (_) => _SubmitForm(),
              ),
              AdaptativeTextField(
                'Valor (R\$)',
                _valueController,
                TextInputType.numberWithOptions(decimal: true),
                (_) => _SubmitForm(),
              ),
              AdaptativeDatePicker(_selectedDate, (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              }),
              Container(
                alignment: AlignmentDirectional.bottomEnd,
                margin: EdgeInsets.all(10),
                child: AdaptativeButton('Nova Transação', _SubmitForm),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
