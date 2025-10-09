import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_screen.dart';
import 'pages/home_shell.dart';
import 'pages/simple_pages.dart';
import 'pages/appointment_booking_page.dart';
import 'pages/payments_page.dart';

void main() {
  runApp(const ClinicApp());
}

class ClinicApp extends StatelessWidget {
  const ClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clinic — Appointments & Payments',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      // Activity 4 - Item 10: Start at Login for the navigation flow
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(), // Login screen
        // Activity 4 - Items 2,3,5,6,9: Home shell with Drawer + Bottom Tabs + TabBar
        '/home': (context) => const HomeShell(), // Home shell
        // Activity 4 - Item 7: Named routes
        '/about': (context) => const AboutPage(), // About
        '/contact': (context) => const ContactPage(), // Contact
        // Keep original form showcase accessible
        '/forms': (context) => const HomePage(),
        // Clinic-focused
        '/bookAppointment': (context) => const AppointmentBookingPage(),
        '/payments': (context) => const PaymentsPage(),
      },
    );
  }
}
