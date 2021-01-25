import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _chosenDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _chosenDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _chosenDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }

      setState(() {
        _chosenDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isAndroid = Platform.isAndroid;
    final chooseDateButtonText = Text(
      'Choose a date',
      style: TextStyle(fontWeight: FontWeight.bold),
    );

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) => amountInput = val,
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_chosenDate == null
                          ? 'No Date Chosen!'
                          : DateFormat.yMMMd().format(_chosenDate)),
                    ),
                    AdaptiveFlatButton(
                      Text(
                        'Choose a date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      _presentDatePicker,
                    ),
                  ],
                ),
              ),
              isAndroid
                  ? RaisedButton(
                      child: Text('Add Transaction'),
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).textTheme.button.color,
                      onPressed: _submitData,
                    )
                  : CupertinoButton(
                      child: Text('Add Transaction'),
                      onPressed: _submitData,
                      color: Colors.blue,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
