import 'package:flutter/material.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Gadget-related product data
    final List<Map<String, String>> gadgets = [
      {
        'name': 'Smartphone Pro X',
        'image':
            'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=800&q=80'
      },
      {
        'name': 'Laptop UltraBook',
        'image':
            'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=80'
      },
      {
        'name': 'Wireless Earbuds',
        'image':
            'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?auto=format&fit=crop&w=800&q=80'
      },
      {
        'name': 'Smartwatch Series',
        'image':
            'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=800&q=80'
      },
      {
        'name': '4K Action Camera',
        'image':
            'https://images.unsplash.com/photo-1504215680853-026ed2a45def?auto=format&fit=crop&w=800&q=80'
      },
      {
        'name': 'Mechanical Keyboard',
        'image':
            'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=80'
      },
      {
        'name': 'Gaming Mouse',
        'image':
            'https://images.unsplash.com/photo-1587202372775-98907bfc08a6?auto=format&fit=crop&w=800&q=80'
      },
      {
        'name': 'Bluetooth Speaker',
        'image':
            'https://images.unsplash.com/photo-1585386959984-a41552231693?auto=format&fit=crop&w=800&q=80'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gadget Store'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: gadgets.length,
        itemBuilder: (context, index) {
          final item = gadgets[index];
          return Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      item['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(
                            child: CircularProgressIndicator(strokeWidth: 2));
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(Icons.broken_image,
                                color: Colors.grey, size: 40),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item['name']!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
