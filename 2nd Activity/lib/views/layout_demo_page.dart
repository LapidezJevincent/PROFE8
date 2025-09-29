import 'package:flutter/material.dart';
import '../services/expense_service.dart';
import '../models/expense.dart';

class LayoutDemoPage extends StatefulWidget {
  const LayoutDemoPage({super.key});

  @override
  State<LayoutDemoPage> createState() => _LayoutDemoPageState();
}

class _LayoutDemoPageState extends State<LayoutDemoPage> {
  final ExpenseService _expenseService = ExpenseService();

  @override
  Widget build(BuildContext context) {
    final expenses = _expenseService.expenses;
    final totalAmount = _expenseService.totalAmount;
    final averageAmount = expenses.isNotEmpty ? totalAmount / expenses.length : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Layouts'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Three Text widgets in a Row with equal spacing - Expense Summary
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${expenses.length}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const Text('Total Entries', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '₱${totalAmount.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const Text('Total Amount', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '₱${averageAmount.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        const Text('Average', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 2. Two buttons in a Column, centered - Quick Actions
            const SizedBox(height: 20),
            SizedBox(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate back to home page for actual expense adding
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false,
                      );
                      // Update the main page to show home
                      Future.delayed(const Duration(milliseconds: 100), () {
                        // This would switch to home tab
                      });
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Expense'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () => _clearAllExpenses(),
                    icon: const Icon(Icons.clear_all),
                    label: const Text('Clear All'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 3. Container with padding, margin, and background color - Latest Expense Card
            const SizedBox(height: 20),
            if (expenses.isNotEmpty)
              Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade100, Colors.blue.shade100],
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.purple, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expenses.last.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Category: ${expenses.last.category}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Amount: ₱${expenses.last.amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              )
            else
              Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: const Text(
                  'No expenses added yet',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            const SizedBox(height: 30),

            // 4. Profile card layout - User Financial Profile
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row for profile picture and name
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.green.shade400, Colors.blue.shade400],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lapidez, Jevincent A',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'BS Information Systems',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Column for financial details
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: lapidez@gmail.com'),
                      Text('Phone: +63 970 509 3270'),
                      Text('Location: Talisay City'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.red.shade200,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Food', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('₱${_getCategoryTotal('Food').toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Transport', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('₱${_getCategoryTotal('Transport').toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.restaurant, size: 24, color: Colors.orange.shade700),
                  Icon(Icons.train, size: 24, color: Colors.blue.shade700),
                  Icon(Icons.shopping_bag, size: 24, color: Colors.green.shade700),
                  Icon(Icons.medical_services, size: 24, color: Colors.red.shade700),
                ],
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  // Background image (provide your image at assets/images/bg.jpg)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bg.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Floating button
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: FloatingActionButton(
                      onPressed: () {
                        // Navigate back to home page for actual expense adding
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => false,
                        );
                      },
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.add, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      color: Colors.red.shade200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${_getDaysActive()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const Text('Days Active'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      color: Colors.green.shade200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '₱${totalAmount.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            const Text('Total Expense'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      color: Colors.blue.shade200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${_getUniqueCategories().length}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const Text('Categories'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            Column(
              children: [
                // System message
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: const Text('Muzta?'),
                  ),
                ),
                // User response
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.shade500,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'OKs Lng A',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        margin: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade200,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('🍕 Food', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('₱${_getCategoryTotal('Food').toStringAsFixed(0)}'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        margin: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('🚌 Transport', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('₱${_getCategoryTotal('Transport').toStringAsFixed(0)}'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        margin: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.green.shade200,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('🛍️ Shopping', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('₱${_getCategoryTotal('Shopping').toStringAsFixed(0)}'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        margin: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade200,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('💊 Health', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('₱${_getCategoryTotal('Health').toStringAsFixed(0)}'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        margin: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.red.shade200,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('🎬 Entertainment', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('₱${_getCategoryTotal('Entertainment').toStringAsFixed(0)}'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        margin: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade200,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('🏠 Bills', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('₱${_getCategoryTotal('Bills').toStringAsFixed(0)}'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Helper methods for expense tracker functionality
  double _getCategoryTotal(String category) {
    return _expenseService.expenses
        .where((expense) => expense.category == category)
        .fold(0.0, (sum, expense) => sum + expense.amount);
  }

  List<String> _getUniqueCategories() {
    return _expenseService.expenses.map((e) => e.category).toSet().toList();
  }

  String _getMostUsedCategory() {
    if (_expenseService.expenses.isEmpty) return 'None';
    
    final categoryCount = <String, int>{};
    for (final expense in _expenseService.expenses) {
      categoryCount[expense.category] = (categoryCount[expense.category] ?? 0) + 1;
    }
    
    return categoryCount.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }

  int _getDaysActive() {
    if (_expenseService.expenses.isEmpty) return 0;
    
    final uniqueDates = _expenseService.expenses
        .map((e) => DateTime(e.date.year, e.date.month, e.date.day))
        .toSet();
    return uniqueDates.length;
  }

  void _clearAllExpenses() {
    setState(() {
      _expenseService.expenses.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All expenses cleared!')),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }
}

// Simple Add Expense Demo Page for the button functionality
class AddExpenseDemoPage extends StatelessWidget {
  const AddExpenseDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'This would redirect to the actual Add Expense page!\n\nGo back to HOME tab to add expenses.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}