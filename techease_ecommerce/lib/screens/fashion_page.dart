import 'package:flutter/material.dart';

class FashionPage extends StatelessWidget {
  const FashionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Move list here to avoid const errors
    final List<Map<String, String>> gadgets = [
      {
        'name': 'Flagship Smartphone',
        'price': '₱84,990',
        'image': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9'
      },
      {
        'name': 'High-end Laptop',
        'price': '₱82,990',
        'image': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'
      },
      {
        'name': 'Wireless Headphones',
        'price': '₱20,999',
        'image': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e'
      },
      {
        'name': 'Smartwatch Series',
        'price': '₱54,990',
        'image': 'https://images.unsplash.com/photo-1518770660439-4636190af475'
      },
      {
        'name': 'DSLR Camera',
        'price': '₱76,990',
        'image': 'https://images.unsplash.com/photo-1504215680853-026ed2a45def'
      },
      {
        'name': 'Desktop Setup',
        'price': '₱99,990',
        'image': 'https://images.unsplash.com/photo-1593642532973-d31b6557fa68'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flagship Gadgets"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: gadgets.map((item) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image area
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                    child: SizedBox(
                      height: 220,
                      width: double.infinity,
                      child: Image.network(
                        '${item['image']}?auto=format&fit=crop&w=1200&q=80',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.broken_image,
                                    size: 48, color: Colors.grey),
                                SizedBox(height: 8),
                                Text('Image not available',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Details area
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item['price']!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
