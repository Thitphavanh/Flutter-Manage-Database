import 'package:flutter/material.dart';
import 'package:flutter_manage_database/providers/transaction_provider.dart';
import 'package:flutter_manage_database/screens/form_screen.dart';
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
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            body: TabBarView(
              children: [
                HomeScreen(),
                FormScreen(),
              ],
            ),
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(
                  text: 'Show List',
                  icon: Icon(
                    Icons.list,
                  ),
                ),
                Tab(text: 'Add List',
                  icon: Icon(
                    Icons.add,
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
