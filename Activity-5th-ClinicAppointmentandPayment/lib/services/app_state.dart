import 'package:flutter/material.dart';
import 'dart:collection';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class CartItem {
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItem({required this.id, required this.name, required this.price, this.quantity = 1});
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items.values);

  double get total => _items.values.fold(0.0, (sum, item) => sum + item.price * item.quantity);

  int get count => _items.values.fold(0, (sum, item) => sum + item.quantity);

  void addItem(CartItem item) {
    if (_items.containsKey(item.id)) {
      _items[item.id]!.quantity += item.quantity;
    } else {
      _items[item.id] = item;
    }
    notifyListeners();
  }

  void removeOne(String id) {
    if (!_items.containsKey(id)) return;
    final existing = _items[id]!;
    if (existing.quantity > 1) {
      existing.quantity -= 1;
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

class TodoItem {
  final String id;
  final String title;
  bool completed;

  TodoItem({required this.id, required this.title, this.completed = false});
}

class TodoProvider extends ChangeNotifier {
  final List<TodoItem> _todos = [];

  UnmodifiableListView<TodoItem> get todos => UnmodifiableListView(_todos);

  void add(String title) {
    _todos.add(TodoItem(id: DateTime.now().millisecondsSinceEpoch.toString(), title: title));
    notifyListeners();
  }

  void toggle(String id) {
    final idx = _todos.indexWhere((t) => t.id == id);
    if (idx == -1) return;
    _todos[idx].completed = !_todos[idx].completed;
    notifyListeners();
  }

  void remove(String id) {
    _todos.removeWhere((t) => t.id == id);
    notifyListeners();
  }
}


