import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../widgets/forms_showcase.dart';
import '../services/app_state.dart';

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
    final isDark = context.watch<ThemeProvider>().isDarkMode; // watch for UI updates
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clinic App Navigation'),
          actions: [
            Row(
              children: [
                const Text('Light'),
                Switch(
                  value: isDark,
                  onChanged: (_) => context.read<ThemeProvider>().toggleTheme(), // read for action
                ),
                const Text('Dark'),
                const SizedBox(width: 8),
              ],
            ),
          ],
          // Activity 5: Theme toggle + multi-tab layout integration
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
              onTap: () { setState(() => _currentIndex = 0); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () { setState(() => _currentIndex = 1); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail_outlined),
              title: const Text('Contact'),
              onTap: () { setState(() => _currentIndex = 2); Navigator.pop(context); },
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
                  // Activity 5: Home tabs (Chats/Status/Calls)
                  ? TabBarView(
                      children: [
                        SafeArea(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(16),
                            child: const FormsShowcase(),
                          ),
                        ),
                        const _StatusTab(),
                        const _CallsTab(),
                      ],
                    )
                  : _currentIndex == 1
                      ? const _AboutContent()
                      : const _ContactContent(),
            ),
          ],
        ),
        // Activity 5: BottomNavigationBar + Drawer (layout navigation)
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
      children: [
        const SizedBox(height: 8),
        // 18. Simple Carousel from assets
        SizedBox(
          height: 160,
          child: PageView(
      children: const [
              _CarouselImage('assets/images/1.jpg'),
              _CarouselImage('assets/images/2.jpg'),
              _CarouselImage('assets/images/3.jpeg'),
            ],
          ),
        ),
        const SizedBox(height: 6),
        const Text('Clinic Tour Carousel (18)'),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/1.jpg', height: 160, fit: BoxFit.cover),
        ),
        const SizedBox(height: 6),
        const Text('Doctor Portrait (6)'),
        const SizedBox(height: 12),
        Image.network(
          'https://images.unsplash.com/photo-1584982751601-97dcc096659c?q=80&w=1080&auto=format&fit=crop',
          height: 140,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 6),
        const Text('Hospital Interior (7)'),
        const SizedBox(height: 12),
        Container(
          width: 120,
          height: 120,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/2.jpg'),
              fit: BoxFit.cover,
            ),
            border: Border.fromBorderSide(BorderSide(color: Colors.teal, width: 4)),
          ),
        ),
        const SizedBox(height: 6),
        const Text('Staff Badge Avatar (8)'),
        const SizedBox(height: 12),
        _AssetsGrid(),
        const SizedBox(height: 6),
        const Text('Clinic Gallery Grid (9)'),
        const SizedBox(height: 16),
        const _NetworkVideoSection(),
        const SizedBox(height: 6),
        const Text('Clinic Info Video — Network (10–11, web-safe)'),
        const SizedBox(height: 16),
        const _AudioPlayerSection(),
        const SizedBox(height: 6),
        const Text('Notification Chime (12)'),
        const SizedBox(height: 16),
        const _VideoPlayerSection(),
        const SizedBox(height: 6),
        const Text('Clinic Promo — Asset (10–11)'),
        const _ProfileCard(),
        const SizedBox(height: 6),
        const Text('Patient Profile Card (17)'),
      ],
    );
  }
}

class _ContactContent extends StatefulWidget {
  const _ContactContent();

  @override
  State<_ContactContent> createState() => _ContactContentState();
}

class _ContactContentState extends State<_ContactContent> {
  double _iconSize = 28;
  late Color _iconColor;

  @override
  void initState() {
    super.initState();
    _iconColor = Colors.deepPurple; // initial accent for visibility
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 8),
        // Dynamic controls: size slider and color choices
        Row(
          children: [
            const Text('Icon Size'),
            Expanded(
              child: Slider(
                value: _iconSize,
                min: 16,
                max: 64,
                onChanged: (v) => setState(() => _iconSize = v),
              ),
            ),
          ],
        ),
        Wrap(
          spacing: 8,
          children: [
            _ColorDot(color: Colors.teal, selected: _iconColor == Colors.teal, onTap: () => setState(() => _iconColor = Colors.teal)),
            _ColorDot(color: Colors.deepPurple, selected: _iconColor == Colors.deepPurple, onTap: () => setState(() => _iconColor = Colors.deepPurple)),
            _ColorDot(color: Colors.indigo, selected: _iconColor == Colors.indigo, onTap: () => setState(() => _iconColor = Colors.indigo)),
            _ColorDot(color: Colors.redAccent, selected: _iconColor == Colors.redAccent, onTap: () => setState(() => _iconColor = Colors.redAccent)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.phone, size: _iconSize, color: _iconColor),
            const SizedBox(width: 8),
            const Expanded(child: Text('09705093270')),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.location_on, size: _iconSize, color: _iconColor),
            const SizedBox(width: 8),
            const Expanded(child: Text('Talisay City, Negros Occidental')),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            Icon(Icons.healing, size: _iconSize, color: _iconColor),
            Icon(Icons.local_hospital, size: _iconSize + 6, color: _iconColor.withOpacity(0.8)),
            Icon(MaterialCommunityIcons.stethoscope, size: _iconSize + 10, color: Colors.teal),
            Icon(FontAwesome.heartbeat, size: _iconSize + 4, color: Colors.redAccent),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _ColorDot extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback onTap;
  const _ColorDot({required this.color, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: selected ? Colors.black : Colors.transparent, width: 2),
        ),
      ),
    );
  }
}

class _CarouselImage extends StatelessWidget {
  final String assetPath;
  const _CarouselImage(this.assetPath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(assetPath, fit: BoxFit.cover),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const CircleAvatar(radius: 30, backgroundImage: AssetImage('assets/images/4.jpeg')),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
                  Text('Clinic Patient', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  SizedBox(height: 4),
                  Text('Premium Member', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const Icon(FontAwesome.user_md, color: Colors.teal),
          ],
        ),
      ),
    );
  }
}


class _StatusTab extends StatelessWidget {
  const _StatusTab();

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoProvider>().todos; // watch updates
    final controller = TextEditingController();
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(labelText: 'Add clinic task'),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  final text = controller.text.trim();
                  if (text.isEmpty) return;
                  context.read<TodoProvider>().add(text); // read for event
                  controller.clear();
                },
                child: const Text('Add'),
              )
            ],
          ),
          const SizedBox(height: 10),
          ...todos.map((t) => ListTile(
                leading: Checkbox(
                  value: t.completed,
                  onChanged: (_) => context.read<TodoProvider>().toggle(t.id),
                ),
                title: Text(
                  t.title,
                  style: TextStyle(decoration: t.completed ? TextDecoration.lineThrough : null),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => context.read<TodoProvider>().remove(t.id),
                ),
              )),
        const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _CallsTab extends StatelessWidget {
  const _CallsTab();

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartProvider>().count; // watch re-renders badge
    final total = context.watch<CartProvider>().total;
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Calls (Shopping Cart Demo)', style: TextStyle(fontWeight: FontWeight.w600)),
              Chip(label: Text('Items: $cartCount')),
            ],
          ),
          const SizedBox(height: 8),
          const SizedBox(height: 12),
          _CartCatalog(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: ₱${total.toStringAsFixed(2)}'),
              ElevatedButton.icon(
                onPressed: () => context.read<CartProvider>().clear(),
                icon: const Icon(Icons.remove_shopping_cart_outlined),
                label: const Text('Clear Cart'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CartCatalog extends StatelessWidget {
  final List<CartItem> services = [
    CartItem(id: 'consult', name: 'Doctor Consult', price: 500.0),
    CartItem(id: 'lab', name: 'Lab Test', price: 750.0),
    CartItem(id: 'xray', name: 'X-Ray', price: 1200.0),
  ];

  _CartCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: services
          .map((s) => Card(
                child: ListTile(
                  leading: const Icon(Icons.medical_services_outlined),
                  title: Text(s.name),
                  subtitle: Text('₱${s.price.toStringAsFixed(2)}'),
                  trailing: Wrap(
                    spacing: 8,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () => context.read<CartProvider>().removeOne(s.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () => context.read<CartProvider>().addItem(CartItem(id: s.id, name: s.name, price: s.price)),
                      ),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class _AssetsGrid extends StatelessWidget {
  const _AssetsGrid();

  @override
  Widget build(BuildContext context) {
    final assetPaths = const [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpeg',
      'assets/images/4.jpeg',
      'assets/images/5.jpg',
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 6, mainAxisSpacing: 6),
      itemCount: assetPaths.length,
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(assetPaths[index], fit: BoxFit.cover),
      ),
    );
  }
}

class _VideoPlayerSection extends StatefulWidget {
  const _VideoPlayerSection();

  @override
  State<_VideoPlayerSection> createState() => _VideoPlayerSectionState();
}

class _VideoPlayerSectionState extends State<_VideoPlayerSection> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videos/clinic_promo.mp4');
    _videoController!.initialize().then((_) {
      _chewieController = ChewieController(
        videoPlayerController: _videoController!,
        autoPlay: false,
        looping: false,
        aspectRatio: _videoController!.value.aspectRatio == 0 ? 16 / 9 : _videoController!.value.aspectRatio,
      );
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController == null || !_videoController!.value.isInitialized) {
      return const AspectRatio(aspectRatio: 16/9, child: Center(child: CircularProgressIndicator()));
    }
    return AspectRatio(
      aspectRatio: _videoController!.value.aspectRatio,
      child: Chewie(controller: _chewieController!),
    );
  }
}

class _AudioPlayerSection extends StatefulWidget {
  const _AudioPlayerSection();

  @override
  State<_AudioPlayerSection> createState() => _AudioPlayerSectionState();
}

class _NetworkVideoSection extends StatefulWidget {
  const _NetworkVideoSection();

  @override
  State<_NetworkVideoSection> createState() => _NetworkVideoSectionState();
}

class _NetworkVideoSectionState extends State<_NetworkVideoSection> {
  VideoPlayerController? _controller;
  ChewieController? _chewie;

  @override
  void initState() {
    super.initState();
    // Web-safe MP4 (H.264/AAC) sample
    _controller = VideoPlayerController.networkUrl(Uri.parse('https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'));
    _controller!.initialize().then((_) {
      _chewie = ChewieController(
        videoPlayerController: _controller!,
        autoPlay: false,
        looping: false,
        allowMuting: true,
        allowPlaybackSpeedChanging: true,
      );
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _chewie?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewie == null || !_controller!.value.isInitialized) {
      return const AspectRatio(aspectRatio: 16/9, child: Center(child: CircularProgressIndicator()));
    }
    return AspectRatio(
      aspectRatio: _controller!.value.aspectRatio == 0 ? 16/9 : _controller!.value.aspectRatio,
      child: Chewie(controller: _chewie!),
    );
  }
}

class _AudioPlayerSectionState extends State<_AudioPlayerSection> {
  final AudioPlayer _player = AudioPlayer();
  PlayerState _state = PlayerState.stopped;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: () async {
            await _player.play(AssetSource('audio/sample.mp3'));
            setState(() => _state = PlayerState.playing);
          },
          icon: const Icon(Icons.play_arrow),
          label: const Text('Play'),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: () async {
            await _player.pause();
            setState(() => _state = PlayerState.paused);
          },
          icon: const Icon(Icons.pause),
          label: const Text('Pause'),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: () async {
            await _player.stop();
            setState(() => _state = PlayerState.stopped);
          },
          icon: const Icon(Icons.stop),
          label: const Text('Stop'),
        ),
        const SizedBox(width: 8),
        Text(_state.name.toUpperCase()),
      ],
    );
  }
}

class _ActivityInstructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const items = [
      '1. Create a shopping cart app using Provider',
      '2. Use ChangeNotifier with Provider to update the UI',
      '3. Demonstrate context.read() vs context.watch()',
      '4. Implement a theme switcher (dark/light mode)',
      '5. Create a simple to-do list app using Provider',
      '6. Display a local image using Image.asset()',
      '7. Display an image from the internet using Image.network()',
      '8. Add a circular border to an image using BoxDecoration',
      '9. Display a list of images from assets in a GridView',
      '10. Implement a video player using video_player',
      '11. Enhance the video player with chewie controls',
      '12. Play a short audio clip using audioplayers',
      '13. Display Material Icons and change color/size dynamically',
      '14. Add a custom icon set using flutter_icons',
      '15. Add a custom font via pubspec.yaml',
      '16. Display two different text styles using two custom fonts',
      '17. Create a profile card with image, custom icon, styled text',
      '18. Build a gallery/carousel that loads images from assets',
      '19. Build a video + audio player app with play, pause, stop',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('5th Activity Instructions (Integrated)'),
        const SizedBox(height: 6),
        ...items.map((e) => Row(children: [const Text('• '), Expanded(child: Text(e))])),
      ],
    );
  }
}


