import 'package:flutter/material.dart';
import 'package:flutter_manage_database/database/transaction_db.dart';
import '../models/transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<dynamic> transactions = [];

  List<dynamic> getTransaction() {
    return transactions;
  }

  void initData() async {
    var db = TransactionDB(dbName: "transactions.db");
    transactions = await db.loadAllData();
    notifyListeners();
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    await db.InsertData(statement);
    transactions = await db.loadAllData();
    notifyListeners();
  }
}
