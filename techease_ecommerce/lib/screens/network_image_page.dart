import 'package:flutter/material.dart';

class NetworkImagePage extends StatelessWidget {
  const NetworkImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Network Images')),
      body: ListView(
        children: List.generate(
          5,
          (index) =>
              Image.network('https://picsum.photos/seed/net$index/400/250'),
        ),
      ),
    );
  }
}
