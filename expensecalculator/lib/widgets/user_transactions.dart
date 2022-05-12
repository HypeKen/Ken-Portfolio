import 'package:expensecalculator/index.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({final Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          addTx: _addNewTransaction,
        ),
        // ignore: always_specify_types
        TransactionList(
          transactions: _userTransactions,
          // ignore: always_specify_types
        )
      ],
    );
  }
}
