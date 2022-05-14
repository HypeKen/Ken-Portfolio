// ignore_for_file: always_specify_types, avoid_as

import 'package:expensecalculator/index.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({
    required this.recentTransactions,
    final Key? key,
  }) : super(key: key);

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (final int index) {
      final DateTime weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0, (final sum, final item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: SizedBox(
        child: Row(
          children:
              groupedTransactionValues.map((final Map<String, Object> data) {
            return ChartBar(
              label: data['day'] as String,
              spendingAmount: data['amount'] as double,
              spendingPercentage: totalSpending == 0
                  ? 0
                  : (data['amount'] as double) / totalSpending,
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        IterableProperty<Map<String, Object>>(
          'groupedTransactionValues',
          groupedTransactionValues,
        ),
      )
      ..add(
        IterableProperty<Transaction>(
          'recentTransactions',
          recentTransactions,
        ),
      )
      ..add(DoubleProperty('totalSpending', totalSpending));
  }
}
