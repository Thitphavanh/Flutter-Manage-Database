import 'package:flutter/material.dart';
import 'package:flutter_manage_database/models/transactions.dart';
import 'package:flutter_manage_database/providers/transaction_provider.dart';
import 'package:flutter_manage_database/screens/app.dart';
import 'package:flutter_manage_database/screens/home_screen.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Form Screen',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Name :'),
                autofocus: false,
                controller: titleController,
                validator: (String? string) {
                  if (string!.isEmpty) {
                    return 'ກະລຸນາຕື່ມຂໍ້ມູນ ລາຍການ';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Price :'),
                keyboardType: TextInputType.number,
                controller: amountController,
                validator: (String? string) {
                  if (string!.isEmpty) {
                    return 'ກະລຸນາຕື່ມຂໍ້ມູນ ຈຳນວນເງິນ';
                  }
                  if (double.parse(string) <= 0) {
                    return 'ກະລຸນາຕື່ມຂໍ້ມູນຫຼາຍກວ່າ ຫຼືເທົ່າກັບ 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var title = titleController.text;
                    var amount = amountController.text;

                    Transactions statement = Transactions(
                      title: title,
                      amount: double.parse(amount),
                      date: DateTime.now(),
                    );

                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);
                    provider.addTransaction(statement);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) {
                          return App();
                        },
                      ),
                    );
                  }
                },
                child: const Text('Add'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
