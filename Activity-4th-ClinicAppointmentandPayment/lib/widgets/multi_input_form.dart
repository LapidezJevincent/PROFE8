import 'package:flutter/material.dart';

class MultiInputForm extends StatefulWidget {
  const MultiInputForm({super.key});

  @override
  State<MultiInputForm> createState() => _MultiInputFormState();
}

class _MultiInputFormState extends State<MultiInputForm> {
  final _formKey = GlobalKey<FormState>();
  final _patientNameController = TextEditingController();
  String _condition = '';
  int _age = 1;
  bool _hasAllergies = false;
  bool _requiresFollowUp = false;

  @override
  void dispose() {
    _patientNameController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Patient saved: ${_patientNameController.text} (Condition: $_condition, Age: $_age)')),
      );
      // You could pass this data to a service or next form
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
              const Text('Patient Intake',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _patientNameController,
                decoration: const InputDecoration(labelText: 'Patient Name'),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Enter patient name' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Chief Complaint / Condition'),
                onSaved: (v) => _condition = v?.trim() ?? '',
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Enter condition' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Age (years)'),
                keyboardType: TextInputType.number,
                initialValue: '1',
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Enter age';
                  final n = int.tryParse(v);
                  if (n == null || n < 0) return 'Enter valid age';
                  return null;
                },
                onSaved: (v) => _age = int.tryParse(v ?? '1') ?? 1,
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Has Allergies'),
                value: _hasAllergies,
                onChanged: (v) => setState(() => _hasAllergies = v ?? false),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Requires Follow-up Visit'),
                value: _requiresFollowUp,
                onChanged: (v) => setState(() => _requiresFollowUp = v),
              ),
              ElevatedButton(
                  onPressed: _saveProfile,
                  child: const Text('Save Patient Intake')),
            ],
          ),
        ),
      ),
    );
  }
}
