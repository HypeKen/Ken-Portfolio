import 'package:expensecalculator/index.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    required this.transactions,
    final Key? key,
  }) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemBuilder: (final BuildContext ctx, final int index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Colors.purple,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat('M/d/y').format(transactions[index].date),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
        // ignore: always_specify_types
        // children: transactions.map((final tx) {}).toList(),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Transaction>('transactions', transactions));
  }
}
