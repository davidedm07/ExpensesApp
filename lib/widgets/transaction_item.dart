import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTransaction;

  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(7),
            child: FittedBox(child: Text("\$${transaction.amount}")),
          ),
        ),
        title: Text(
          "${transaction.title}",
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text("${DateFormat.yMMMd().format(transaction.date)}"),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                onPressed: () => deleteTransaction(transaction.id),
                label: Text("Delete"),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                onPressed: () => deleteTransaction(transaction.id),
              ),
      ),
    );
  }
}
