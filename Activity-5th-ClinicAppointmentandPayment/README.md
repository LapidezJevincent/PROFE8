Flutter State Management + Media & Assets (Activity 5)

Overview

This Flutter project demonstrates state management patterns and media/assets integration, mapped to the Activity 5 checklist. It uses Provider with ChangeNotifier for reactive UI updates, and showcases images, video, audio, icons, and custom fonts in a cohesive clinic-themed app.

What’s inside

- Provider-based state: Theme, Shopping Cart, and To‑do List
- context.read() vs context.watch() usage in event handlers vs UI
- Theme switcher (dark/light) with persistence-ready structure
- Images: local assets, network images, circular avatar with border
- Gallery: GridView and carousel from assets
- Video: asset and network playback; Chewie for controls
- Audio: short clip with play/pause/stop via audioplayers
- Icons: Material icons with dynamic size/color + custom icon set
- Custom fonts configured in `pubspec.yaml`

Implemented features (aligned to requirements)

1. Shopping cart using Provider (add/remove items, totals)
2. ChangeNotifier with Provider drives UI updates
3. context.read() vs context.watch() demonstrated in cart screen
4. Theme switcher (dark/light) using Provider
5. To‑do list managed by Provider
6. Display a local image with `Image.asset()`
7. Display a network image with `Image.network()`
8. Circular bordered image using `BoxDecoration`
9. GridView gallery of asset images
10. Video playback with `video_player`
11. Chewie-enhanced controls for video
12. Short audio playback with `audioplayers`
13. Material Icons with dynamic color and size
14. Custom icon set (e.g., flutter_vector_icons)
15. Custom font(s) declared in `pubspec.yaml`
16. Two different text styles using two custom fonts
17. Profile card combining image, custom icon, styled text
18. Gallery/carousel loading images from assets
19. Video + audio player with play, pause, and stop

Navigation context (from Activity 4)

The app still uses the Activity 4 navigation shell (Login → Home with Drawer, BottomNavigationBar, and TabBar). Activity 5 features are reachable from the Home tabs and About/Contact pages.

Project structure (high level)

Clinic-Appointment-App/
├── lib/
│   ├── main.dart                 // MultiProvider + routes + theme
│   ├── services/
│   │   ├── app_state.dart        // ThemeProvider, CartProvider, TodoProvider
│   │   └── local_data_service.dart
│   ├── pages/                    // Login, Home shell, simple pages
│   └── widgets/                  // Forms, media UI, and helpers
├── assets/                       // images/, audio/, videos/
└── pubspec.yaml                  // assets + fonts + dependencies

How to run on FlutLab.io

1) Open `https://flutlab.io` and sign in.
2) Create a new project → Import → Upload this repository (or connect Git).
3) In FlutLab, open `pubspec.yaml` → click “Pub get”.
4) Verify assets are detected (images/audio/videos under `assets/`).
5) Run on Web:
   - Prefer CanvasKit renderer for better media support
   - Click Run; if video has no sound initially, click to start (autoplay blocked)
6) Start screen is Login; use the Login button to enter Home.

Notes

- `LocalDataService` is an in-memory store; data resets on reload.
- Some MP4s may not play on web depending on codecs; a web‑safe network video is included.
- If network images fail due to CORS on FlutLab, use the bundled asset images instead.