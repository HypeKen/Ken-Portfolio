import 'package:expensecalculator/index.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
      // ignore: always_specify_types
      children: _userTransactions.map((final tx) {
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
                  '\$${tx.amount}',
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
                    tx.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('M/d/y').format(tx.date),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
