import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Calculator'),
      ),
      body: Column(
        children: const <Widget>[
          SizedBox(
            width: double.infinity,
            child:
                Card(color: Colors.blue, elevation: 5, child: Text('Chart!')),
          ),
          Card(child: Text('List of TX')),
        ],
      ),
    );
  }
}
