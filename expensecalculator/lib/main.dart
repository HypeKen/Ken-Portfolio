import 'package:expensecalculator/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({final Key? key}) : super(key: key);

  // late String titleInput;
  // late String amountInput;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  final List<Transaction> transactions = <Transaction>[];

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            child:
                Card(color: Colors.blue, elevation: 5, child: Text('Chart!')),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    // ignore: always_specify_types
                    // onChanged: (final val) {
                    //   titleInput = val;
                    // },
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    // ignore: always_specify_types
                    // onChanged: (final val) => amountInput = val,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    onPressed: () {
                      print(titleController.text);
                    },
                    child: const Text(
                      'Add Transasction',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const TransactionList()
        ],
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<Transaction>('transactions', transactions))
      ..add(
        DiagnosticsProperty<TextEditingController>(
          'amountController',
          amountController,
        ),
      )
      ..add(
        DiagnosticsProperty<TextEditingController>(
          'titleController',
          titleController,
        ),
      );
    // ..add(StringProperty('amountInput', amountInput))
    // ..add(StringProperty('titleInput', titleInput));
  }
}
