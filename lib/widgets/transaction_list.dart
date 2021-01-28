import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No transactions added yet!',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        )),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
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
                        child: FittedBox(
                            child: Text("\$${transactions[index].amount}")),
                      ),
                    ),
                    title: Text(
                      "${transactions[index].title}",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    subtitle: Text(
                        "${DateFormat.yMMMd().format(transactions[index].date)}"),
                    trailing: MediaQuery.of(context).size.width > 400
                        ? FlatButton.icon(
                            icon: Icon(Icons.delete,
                                color: Theme.of(context).errorColor),
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                            label: Text("Delete"),
                            textColor: Theme.of(context).errorColor,
                          )
                        : IconButton(
                            icon: Icon(Icons.delete,
                                color: Theme.of(context).errorColor),
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                          ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
