import 'package:flutter/material.dart';

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
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, int index) {
          return const Card(
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            elevation: 1,
            child: ListTile(
              title: Text('Menu'),
              subtitle: Text('2022/04/25'),
              trailing: Text('200000 LAK'),
            ),
          );
        },
      ),
    );
  }
}
