import 'dart:io';
import 'package:flutter_manage_database/models/transactions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  String? dbName;

  TransactionDB({
    this.dbName,
  });

  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<int> InsertData(Transactions statement) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    var keyID = store.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date!.toIso8601String(),
    });
    db.close();
    return keyID;
  }

  Future<List<dynamic>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(
      db,
      finder: Finder(
        sortOrders: [
          SortOrder(
            Field.key,
            false,
          ),
        ],
      ),
    );
    // ignore: deprecated_member_use
    List transactionList = <Transactions>[];
    for (var record in snapshot) {
      transactionList.add(
        Transactions(
          title: record["title"] as String,
          amount: record["amount"] as double,
          date: DateTime.parse(record["date"] as String),
        ),
      );
    }
    return transactionList;
  }
}
