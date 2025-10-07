import 'package:flutter/material.dart';
import '../services/local_data_service.dart';

class UsernameForm extends StatefulWidget {
  const UsernameForm({super.key});

  @override
  State<UsernameForm> createState() => _UsernameFormState();
}

class _UsernameFormState extends State<UsernameForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _trackingController = TextEditingController();
  final LocalDataService _service = LocalDataService();

  @override
  void dispose() {
    _trackingController.dispose();
    super.dispose();
  }

  void _submitTracking() {
    if (_formKey.currentState!.validate()) {
      final id = _trackingController.text.trim();
      // Store as a simple patient record identifier
      _service.addDocument({
        'trackingId': id,
        'status': 'Patient ID Created',
        'notes': 'Created via patient ID form'
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Patient ID saved: $id')),
      );
      _trackingController.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Patient — Enter Username / Patient ID',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _trackingController,
                decoration: const InputDecoration(
                    labelText: 'Username or Patient ID (e.g., PT-1234)'),
                validator: (val) {
                  if (val == null || val.trim().isEmpty)
                    return 'Please enter a username or patient ID';
                  if (val.trim().length < 3) return 'Too short';
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: _submitTracking,
                  child: const Text('Save / Track')),
              const SizedBox(height: 8),
              const Text('Recent Patient IDs:',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              ..._service.getDocuments().reversed.take(3).map((d) {
                return ListTile(
                  dense: true,
                  title: Text(d['trackingId'] ?? ''),
                  subtitle: Text('Status: ${d['status'] ?? ''}'),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
