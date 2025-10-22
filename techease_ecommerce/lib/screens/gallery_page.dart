import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Electronics-related images
    final List<String> images = [
      'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9', // smartphone
      'https://images.unsplash.com/photo-1517336714731-489689fd1ca8', // laptop
      'https://images.unsplash.com/photo-1505740420928-5e560c06d30e', // headphones
      'https://images.unsplash.com/photo-1518770660439-4636190af475', // smartwatch
      'https://images.unsplash.com/photo-1504215680853-026ed2a45def', // DSLR camera
      'https://images.unsplash.com/photo-1580894894519-356cbefc7439', // drone
      'https://images.unsplash.com/photo-1593642532973-d31b6557fa68', // computer setup
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Electronics Gallery'),
        backgroundColor: Colors.blueAccent,
      ),
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(2, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    images[i],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(
                      'Product ${i + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
