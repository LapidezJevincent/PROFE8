import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Activity 4 - Item 10: Login screen navigates to Home using pushReplacement
      Navigator.pushReplacementNamed(context, '/home');
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
              const Text('Clinic Login (Patient / Staff)',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  // Activity 3 - Validation: email must contain "@"
                  if (val == null || val.trim().isEmpty) return 'Please enter email';
                  if (!val.contains('@')) return 'Email must contain "@"';
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
                obscureText: _obscure,
                validator: (val) {
                  // Activity 3 - Validation: password not empty
                  if (val == null || val.isEmpty) return 'Please enter password';
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: _submit, child: const Text('Submit')),
              const SizedBox(height: 8),
              // Activity 4 - Item 1: Demonstrate push() from Login to Home (pop brings back to Login)
              OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/home'),
                child: const Text('push() Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
