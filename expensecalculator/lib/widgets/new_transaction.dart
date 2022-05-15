// ignore_for_file: lines_longer_than_80_chars

import 'package:expensecalculator/index.dart';
import 'package:intl/intl.dart';

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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    final String enteredTitle = _titleController.text;
    final double enteredAmount = double.parse(_amountController.text);

    if (_amountController.text.isEmpty) {
      return;
    }

    // ignore: unnecessary_null_comparison
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    // ignore: avoid_dynamic_calls
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
      _titleController.text,
      double.parse(_amountController.text),
      Navigator.of(context).pop(),
    );
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
      // ignore: always_specify_types
    ).then((final pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (final _) => _submitData(),
              // ignore: always_specify_types
              // onChanged: (final val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (final _) => _submitData(),
              // ignore: always_specify_types
              // onChanged: (final val) => amountInput = val,
            ),
            SizedBox(
              height: 80,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      // ignore: unnecessary_null_comparison
                      _selectedDate == null
                          ? 'No Date Chosen'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                    child: const Text('Choose Date'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              // style: TextButton.styleFrom(
              //   primary: Colors.red,
              // ),
              onPressed: () {
                // ignore: avoid_dynamic_calls
                widget.addTx(
                  _titleController.text,
                  double.parse(_amountController.text),
                  Navigator.of(context).pop(),
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
          _titleController,
        ),
      )
      ..add(
        DiagnosticsProperty<TextEditingController>(
          'amountController',
          _amountController,
        ),
      )
      ..add(DiagnosticsProperty<Function>('addTx', widget.addTx));
  }
}
