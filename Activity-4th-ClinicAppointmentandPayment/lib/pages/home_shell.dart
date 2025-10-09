import 'package:flutter/material.dart';
import '../widgets/forms_showcase.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  void _onBottomTap(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clinic App Navigation'),
          // Activity 4 - Item 9 (strict): put TabBar inside AppBar when on Home
          bottom: _currentIndex == 0
              ? const TabBar(
                  labelColor: Colors.white,
                  tabs: [
                    Tab(icon: Icon(Icons.chat_bubble_outline), text: 'Chats'),
                    Tab(icon: Icon(Icons.star_outline), text: 'Status'),
                    Tab(icon: Icon(Icons.call_outlined), text: 'Calls'),
                  ],
                )
              : null,
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail_outlined),
              title: const Text('Contact'),
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
          ],
        ),
      ),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Clinic Appointment & Payment',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                    icon: const Icon(Icons.logout, size: 18),
                    label: const Text('Logout'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _currentIndex == 0
                  // Activity 4 - Item 4: TabBarView switching between tabs
                  ? TabBarView(
                      children: [
                        SafeArea(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(16),
                            child: const FormsShowcase(),
                          ),
                        ),
                        const Center(child: Text('Status Tab Content')),
                        const Center(child: Text('Calls Tab Content')),
                      ],
                    )
                  : _currentIndex == 1
                      ? const _AboutContent()
                      : const _ContactContent(),
            ),
          ],
        ),
        // Activity 4 - Items 3 & 5 & 6: BottomNavigationBar with icons + Drawer in same Scaffold
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onBottomTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'About'),
            BottomNavigationBarItem(icon: Icon(Icons.contact_mail_outlined), label: 'Contact'),
          ],
        ),
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  const _AboutContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text('About Page', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        SizedBox(height: 16),
        Text('About Clinic App — Activity 4 Demo'),
      ],
    );
  }
}

class _ContactContent extends StatelessWidget {
  const _ContactContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text('Contact Page', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        SizedBox(height: 24),
        Center(child: Text('Contact Us at the following:')),
        SizedBox(height: 8),
        Center(child: Text('Phone: 09705093270')),
        SizedBox(height: 8),
        Center(child: Text('Address: Talisay City, Negros Occidental')),
      ],
    );
  }
}


