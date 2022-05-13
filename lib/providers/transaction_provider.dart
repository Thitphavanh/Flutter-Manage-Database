import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [];

  List<Transaction> getTransaction() {
    return transactions;
  }

  addTransaction(Transaction statement) {
    transactions.insert(0, statement);
    notifyListeners();
  }
}
