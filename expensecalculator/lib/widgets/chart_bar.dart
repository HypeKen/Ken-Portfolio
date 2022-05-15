import 'package:expensecalculator/index.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    required this.label,
    required this.spendingAmount,
    required this.spendingPercentage,
    final Key? key,
  }) : super(key: key);

  final String label;
  final double spendingAmount;
  final double spendingPercentage;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentage,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(label),
      ],
    );
    //     const SizedBox(height: 4,),
    //     Text(Label),
    //   ],
    // )
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('label', label))
      ..add(DoubleProperty('spendingAmount', spendingAmount))
      ..add(DoubleProperty('spendingPercentage', spendingPercentage));
  }
}
