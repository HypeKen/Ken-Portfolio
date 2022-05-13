import 'package:expensecalculator/index.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({
    required this.addTx,
    final Key? key,
  }) : super(key: key);

  final Function addTx;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Function>('addTx', addTx));
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  void submitData() {
    final String enteredTitle = titleController.text;
    final double enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    // ignore: avoid_dynamic_calls
    widget.addTx(
      enteredTitle,
      enteredAmount,
      titleController.text,
      double.parse(amountController.text),
      Navigator.of(context).pop(),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (final _) => submitData(),
              // ignore: always_specify_types
              // onChanged: (final val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (final _) => submitData(),
              // ignore: always_specify_types
              // onChanged: (final val) => amountInput = val,
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
              onPressed: () {
                // ignore: avoid_dynamic_calls
                widget.addTx(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: const Text(
                'Add Transaction',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<TextEditingController>(
          'titleController',
          titleController,
        ),
      )
      ..add(
        DiagnosticsProperty<TextEditingController>(
          'amountController',
          amountController,
        ),
      )
      ..add(DiagnosticsProperty<Function>('addTx', widget.addTx));
  }
}
