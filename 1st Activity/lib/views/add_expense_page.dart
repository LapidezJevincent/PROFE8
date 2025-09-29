import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExpensePage extends StatefulWidget {
  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedCategory = 'Food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // MATERIAL WIDGET
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 12),
            // MATERIAL WIDGET
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            const SizedBox(height: 12),
            // CUPERTINO WIDGET
            const Text('Pick Date (Cupertino Style):'),
            SizedBox(
              height: 100,
              child: CupertinoDatePicker(
                initialDateTime: _selectedDate,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (date) =>
                    setState(() => _selectedDate = date),
              ),
            ),
            const SizedBox(height: 12),
            // CUPERTINO WIDGET
            CupertinoSegmentedControl<String>(
              children: const {
                'Food': Text('Food'),
                'Transport': Text('Transport'),
                'Other': Text('Other'),
              },
              groupValue: _selectedCategory,
              onValueChanged: (val) => setState(() => _selectedCategory = val),
            ),
            const Spacer(),
            // MATERIAL WIDGET
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // close form
              },
              child: const Text('Save Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
