import 'package:flutter/material.dart';

class ContactCardPage extends StatelessWidget {
  const ContactCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> contacts = [
      {
        'name': 'Juan Dela Cruz',
        'email': 'juan@gmail.com',
        'phone': '09123456789'
      },
      {
        'name': 'Maria Santos',
        'email': 'maria@yahoo.com',
        'phone': '09987654321'
      },
      {
        'name': 'Pedro Reyes',
        'email': 'pedro@gmail.com',
        'phone': '09051234567'
      },
      {'name': 'Ana Dizon', 'email': 'ana@outlook.com', 'phone': '09184561234'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Contact Cards')),
      body: Center(
        child: ListWheelScrollView.useDelegate(
          itemExtent: 120,
          perspective: 0.003,
          diameterRatio: 2,
          physics: const FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) {
              if (index < 0 || index >= contacts.length) return null;
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                elevation: 4,
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(contacts[index]['name']!),
                  subtitle: Text(
                      '${contacts[index]['email']}\n${contacts[index]['phone']}'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
