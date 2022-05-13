import 'package:expensecalculator/index.dart';

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

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  const MyHomePage({final Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late String titleInput;
  final List<Transaction> _userTransactions = <Transaction>[
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(final String txTitle, final double txAmount) {
    final Transaction newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  final List<Transaction> transactions = <Transaction>[];

  void _startAddNewTransaction(final BuildContext ctx) {
    // ignore: always_specify_types
    showModalBottomSheet<Transaction>(
      context: ctx,
      builder: (final _) {
        return NewTransaction(addTx: _addNewTransaction);
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Calculator'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _startAddNewTransaction(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
              child:
                  Card(color: Colors.blue, elevation: 5, child: Text('Chart!')),
            ),
            TransactionList(transactions: _userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Transaction>('transactions', transactions));
  }

  // ..add(StringProperty('amountInput', amountInput))
  // ..add(StringProperty('titleInput', titleInput));

}
