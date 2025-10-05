import 'package:flutter/material.dart';
import '../services/expense_service.dart';
import '../models/expense.dart';
import 'dart:math';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final ExpenseService _expenseService = ExpenseService();

  Map<String, double> getCategoryTotals() {
    final Map<String, double> totals = {};
    for (Expense e in _expenseService.expenses) {
      totals[e.category] = (totals[e.category] ?? 0) + e.amount;
    }
    return totals;
  }

  final List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    final totals = getCategoryTotals();
    final totalAmount = totals.values.isEmpty
        ? 0.0
        : totals.values.reduce((a, b) => a + b).toDouble();

    return Scaffold(
      appBar: AppBar(title: const Text('Stats')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: totals.isEmpty
            ? const Center(child: Text('No expenses yet'))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Expenses by Category',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CustomPaint(
                      painter: PieChartPainter(totals, totalAmount, colors),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // ✅ Color-dot legend
                  ...totals.entries.toList().asMap().entries.map((entry) {
                    final index = entry.key;
                    final category = entry.value.key;
                    final amount = entry.value.value;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors[index % colors.length],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '$category: ₱${amount.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final Map<String, double> data;
  final double total;
  final List<Color> colors;

  PieChartPainter(this.data, this.total, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    if (total == 0) return;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()..style = PaintingStyle.fill;

    double startAngle = -pi / 2;
    int colorIndex = 0;

    data.forEach((category, amount) {
      final sweepAngle = (amount / total) * 2 * pi;
      paint.color = colors[colorIndex % colors.length];
      canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
      startAngle += sweepAngle;
      colorIndex++;
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
