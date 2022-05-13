import 'package:flutter/material.dart';
import 'package:flutter_manage_database/database/transaction_db.dart';
import '../models/transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    await db.InsertData(statement);

    db.loadAllData();
    transactions.insert(0, statement);
    notifyListeners();
  }
}
