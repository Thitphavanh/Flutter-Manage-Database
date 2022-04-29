import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [
    Transaction(title: 'Mac Studio', amount: 25200000, date: DateTime.now()),
    Transaction(
        title: 'iPhone 13 ProMax', amount: 15200000, date: DateTime.now()),
    Transaction(title: 'Macbook Air', amount: 12000000, date: DateTime.now()),
    Transaction(title: 'Mac mini', amount: 10000000, date: DateTime.now()),
  ];

  List<Transaction> getTransaction() {
    return transactions;
  }

  addTransaction(Transaction statement) {
    transactions.add(statement);
  }
}
