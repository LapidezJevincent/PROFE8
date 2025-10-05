import '../models/expense.dart';

class ExpenseService {
  // Singleton pattern
  static final ExpenseService _instance = ExpenseService._internal();
  factory ExpenseService() => _instance;
  ExpenseService._internal();

  final List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  void addExpense(Expense expense) {
    _expenses.add(expense);
  }

  // ✅ NEW: totalAmount getter
  double get totalAmount {
    if (_expenses.isEmpty) return 0.0;
    return _expenses.fold(0.0, (sum, e) => sum + e.amount);
  }
}
