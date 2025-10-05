import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../services/expense_service.dart';
import '../widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ExpenseService _expenseService = ExpenseService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String _selectedCategory = 'Food';

  void _addExpense() {
    if (_nameController.text.isEmpty || _amountController.text.isEmpty) return;

    final expense = Expense(
      name: _nameController.text,
      amount: double.tryParse(_amountController.text) ?? 0,
      category: _selectedCategory,
      date: DateTime.now(),
    );

    setState(() {
      _expenseService.addExpense(expense);
      _nameController.clear();
      _amountController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input form
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Expense Name'),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            const SizedBox(height: 10),
            CupertinoSegmentedControl<String>(
              children: const {
                'Food': Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Food'),
                ),
                'Transport': Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Transport'),
                ),
                'Shopping': Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Shopping'),
                ),
              },
              groupValue: _selectedCategory,
              onValueChanged: (val) {
                setState(() {
                  _selectedCategory = val;
                });
              },
            ),
            const SizedBox(height: 10),

// Cupertino Date Picker
            const Text('Pick Date (optional):'),
            SizedBox(
              height: 100,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (date) {
                  // You can save this to your Expense later
                },
              ),
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: 'Add Expense',
              onPressed: _addExpense,
            ),
            const SizedBox(height: 20),

            // Expense list
            Expanded(
              child: ListView.builder(
                itemCount: _expenseService.expenses.length,
                itemBuilder: (context, index) {
                  final e = _expenseService.expenses[index];
                  return Card(
                    child: ListTile(
                      title: Text(e.name),
                      subtitle: Text('${e.category} • ${e.date.toLocal()}'),
                      trailing: Text('₱${e.amount.toStringAsFixed(2)}'),
                    ),
                  );
                },
              ),
            ),

            // Total
            Text(
              'Total: ₱${_expenseService.totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
