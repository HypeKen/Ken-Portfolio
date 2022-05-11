import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Calculator'),
      ),
      body: Column(
        children: const <Widget>[
          SizedBox(
            width: double.infinity,
            child:
                Card(color: Colors.blue, child: Text('Chart!'), elevation: 5),
          ),
          Card(child: Text('List of TX')),
        ],
      ),
    );
  }
}
