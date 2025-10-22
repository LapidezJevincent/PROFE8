import 'package:flutter/material.dart';

class FlutterWidgetsPage extends StatelessWidget {
  const FlutterWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electronics Showcase'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Explore Our Electronics Collection',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Experience innovation with Flutter widgets — styled for modern tech lovers.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // 📱 Smartphone
            Image.network(
              'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9', // smartphone
              height: 220,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Text(
              'Flagship Smartphone',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Text(
              'Powered by cutting-edge performance and AI cameras.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),

            // 💻 Laptop
            Image.network(
              'https://images.unsplash.com/photo-1517336714731-489689fd1ca8', // laptop
              height: 220,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Text(
              'Ultrabook Laptop',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Text(
              'Perfect for work, study, and creative projects.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),

            // 🎧 Accessories Section
            const Text(
              'Popular Accessories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildAccessoryButton(Icons.headphones, 'Headphones', context),
                _buildAccessoryButton(Icons.watch, 'Smartwatch', context),
                _buildAccessoryButton(Icons.keyboard, 'Keyboard', context),
                _buildAccessoryButton(Icons.mouse, 'Wireless Mouse', context),
                _buildAccessoryButton(Icons.tv, 'Smart TV', context),
              ],
            ),
            const SizedBox(height: 25),

            // ⚙️ Product Highlights
            const Text(
              'Product Highlights',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            _buildFeatureCard(
              Icons.battery_charging_full,
              'Long Battery Life',
              'Stay powered for up to 48 hours of continuous use.',
            ),
            _buildFeatureCard(
              Icons.speed,
              'High Performance',
              'Powered by next-gen chipsets for lightning-fast speeds.',
            ),
            _buildFeatureCard(
              Icons.security,
              'Secure Technology',
              'Enhanced data protection and privacy controls.',
            ),
            _buildFeatureCard(
              Icons.memory,
              'Ample Storage',
              'Store all your media with up to 1TB internal storage.',
            ),

            const SizedBox(height: 30),
            const Text(
              'This page demonstrates various Flutter widgets styled for an Electronics theme.',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // 🧩 Accessory Button Helper
  static Widget _buildAccessoryButton(
      IconData icon, String label, BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$label added to wishlist!')),
        );
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // 💡 Feature Card Helper
  static Widget _buildFeatureCard(
      IconData icon, String title, String subtitle) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
