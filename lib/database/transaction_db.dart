import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TransactionDB {
  String? dbName;

  TransactionDB({
    this.dbName,
  });

  Future<String?> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    return dbLocation;
  }
}
