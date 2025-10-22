import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/fashion_page.dart';
import 'screens/electronics_page.dart';
import 'screens/grocery_page.dart';
import 'screens/network_image_page.dart';
import 'screens/gallery_page.dart';
import 'screens/contact_card_page.dart';
import 'screens/shopping_list_page.dart';
import 'screens/todo_list_page.dart';
import 'screens/custom_product_page.dart';
import 'screens/flutter_widgets_page.dart';
import 'screens/draggable_sheet_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Scroll Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      routes: {
        '/fashion': (context) => FashionPage(),
        '/electronics': (context) => const ElectronicsPage(),
        '/grocery': (context) => const GroceryPage(),
        '/network': (context) => const NetworkImagePage(),
        '/gallery': (context) => const GalleryPage(),
        '/contacts': (context) => const ContactCardPage(),
        '/shopping': (context) => const ShoppingListPage(),
        '/todo': (context) => const ToDoListPage(),
        '/custom': (context) => const CustomProductPage(),
        '/widgets': (context) => const FlutterWidgetsPage(),
        '/draggable': (context) => const DraggableSheetPage(),
      },
    );
  }
}
