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

  Future<bool?> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db);
    print(snapshot);
    return true;
  }
}
