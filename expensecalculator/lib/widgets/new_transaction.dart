import 'package:expensecalculator/index.dart';

class NewTransaction extends StatelessWidget {

  NewTransaction({
        required this.addTx,
    final Key? key,}) : super(key: key);
  
  final Function addTx;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

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
                // ignore: avoid_dynamic_calls
                addTx(
                    titleController.text, double.parse(amountController.text),);
              },
              child: const Text(
                'Add Transasction',
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
    ..add(DiagnosticsProperty<Function>('addTx', addTx));
  }
}
