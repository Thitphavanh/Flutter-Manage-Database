import 'package:flutter/material.dart';
import 'package:flutter_manage_database/models/transaction.dart';
import 'package:flutter_manage_database/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

import 'form_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return FormScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, TransactionProvider provider, Widget? child) {
          return ListView.builder(
            itemCount: provider.transactions.length,
            itemBuilder: (context, int index) {
              Transaction data = provider.transactions[index];
              return Card(
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                elevation: 1,
                child: ListTile(
                  title: Text('${data.title}'),
                  subtitle: Text('${data.date.toString()}'),
                  trailing: Text('${data.amount.toString()}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
