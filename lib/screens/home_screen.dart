import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_manage_database/models/transactions.dart';
import 'package:flutter_manage_database/providers/transaction_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          "Acountant",
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text(
              'Exit',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, TransactionProvider provider, Widget? child) {
          var count = provider.transactions.length;
          if (count <= 0) {
            return Center(
              child: Text(
                'No Data',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: count,
              itemBuilder: (context, int index) {
                Transactions data = provider.transactions[index];
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  elevation: 1,
                  child: ListTile(
                    title: Text(
                      '${data.title}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle:
                        Text('${DateFormat("dd/MM/yyyy").format(data.date!)}'),
                    trailing: Text(
                      '${data.amount.toString()}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
