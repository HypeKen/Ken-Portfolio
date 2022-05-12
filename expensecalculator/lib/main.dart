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
        children: const <Widget>[
          SizedBox(
            width: double.infinity,
            child:
                Card(color: Colors.blue, elevation: 5, child: Text('Chart!')),
          ),
        
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
