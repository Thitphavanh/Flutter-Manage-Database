import 'package:flutter/material.dart';
import 'package:flutter_manage_database/providers/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return TransactionProvider();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const HomeScreen(title: 'Accountant App'),
      ),
    );
  }
}
