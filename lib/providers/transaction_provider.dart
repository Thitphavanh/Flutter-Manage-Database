import 'package:flutter/material.dart';
import '../models/transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  addTransaction(Transactions statement) {
    transactions.insert(0, statement);
    notifyListeners();
  }
}
