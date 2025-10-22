import 'package:flutter/material.dart';

class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ['Phones', 'Laptops', 'PC', 'Gaming Chair', 'Smart TV'];

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping List')),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) => ListTile(title: Text(items[index])),
      ),
    );
  }
}
