import 'package:flutter/material.dart';

class CustomProductPage extends StatelessWidget {
  const CustomProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = List.generate(
      10,
      (i) => {
        'name': 'Product $i',
        'price': (i + 1) * 150,
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Custom Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(products[i]['name'].toString()),
              subtitle: Text('₱${products[i]['price']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${products[i]['name']} added to cart 🛒'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Buy'),
              ),
            ),
          );
        },
      ),
    );
  }
}
