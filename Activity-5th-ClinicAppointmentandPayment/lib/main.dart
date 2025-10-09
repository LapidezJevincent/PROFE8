import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/app_state.dart';
import 'pages/home_page.dart';
import 'pages/login_screen.dart';
import 'pages/home_shell.dart';
import 'pages/simple_pages.dart';
import 'pages/appointment_booking_page.dart';
import 'pages/payments_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: const ClinicApp(),
    ),
  );
}

class ClinicApp extends StatelessWidget {
  const ClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Clinic — Appointments & Payments',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(primary: Colors.teal),
      ),
      themeMode: themeProvider.themeMode,
      // Activity 5: Provider-wired app (MultiProvider) with theme switcher
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(), // Login screen
        // Activity 5: Home shell (tabs + drawer) demonstrating state & media
        '/home': (context) => const HomeShell(), // Home shell
        // Activity 5: Simple static named routes
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
