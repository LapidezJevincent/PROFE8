import 'package:flutter/material.dart';
import '../widgets/date_time_form.dart';

class AppointmentBookingPage extends StatelessWidget {
  const AppointmentBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Appointment')),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: DateTimeForm(),
        ),
      ),
    );
  }
}


