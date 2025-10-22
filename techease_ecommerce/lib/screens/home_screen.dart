import 'package:flutter/material.dart';
import 'fashion_page.dart';
import 'electronics_page.dart';
import 'grocery_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedBottomIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  void _onBottomTapped(int index) {
    setState(() {
      _selectedBottomIndex = index;
    });

    // Navigate to route based on bottom nav index
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/network');
        break;
      case 1:
        Navigator.pushNamed(context, '/gallery');
        break;
      case 2:
        Navigator.pushNamed(context, '/contacts');
        break;
      case 3:
        Navigator.pushNamed(context, '/shopping');
        break;
      case 4:
        Navigator.pushNamed(context, '/todo');
        break;
      case 5:
        Navigator.pushNamed(context, '/widgets');
        break;
      case 6:
        Navigator.pushNamed(context, '/draggable');
        break;
      case 7:
        Navigator.pushNamed(context, '/custom');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TechEase Gadgets'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(icon: Icon(Icons.local_mall), text: 'Fashion'),
              Tab(icon: Icon(Icons.devices), text: 'Electronics'),
              Tab(icon: Icon(Icons.local_grocery_store), text: 'Grocery'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            FashionPage(),
            ElectronicsPage(),
            GroceryPage(),
            Center(child: Text('Accessories Page Coming Soon')),
            Center(child: Text('Computers Page Coming Soon')),
          ],
        ),

        // 🔹 Bottom Navigation Bar (8 items from your Drawer)
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedBottomIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onBottomTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Network'),
            BottomNavigationBarItem(
                icon: Icon(Icons.photo_library), label: 'Gallery'),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_page), label: 'Contacts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Shopping'),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline), label: 'To-Do'),
            BottomNavigationBarItem(
                icon: Icon(Icons.widgets), label: 'Widgets'),
            BottomNavigationBarItem(
                icon: Icon(Icons.drag_handle), label: 'Draggable'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt), label: 'Products'),
          ],
        ),
      ),
    );
  }
}
