## Flutter Navigation Activity (Activity 4)

### Overview

This Flutter project demonstrates multiple navigation paradigms essential for modern app development. It builds upon Activity 3 (forms and input handling for appointments and payments) by integrating:

- Stack navigation
- Drawer menus
- BottomNavigationBar with icons
- TabBar with TabBarView
- Named routes

All combined into a seamless user experience for a simple clinic workflow. The project emphasizes proper navigation flow, back stack management, and intuitive UI/UX.

### Features Implemented

1. Stack Navigation (Navigator.push and Navigator.pop)
   - From the Login screen (`/login`), successful login navigates to Home (`/home`) using `pushReplacement`.
   - A secondary button on the Login screen demonstrates `push()` to Home; the back button then `pop`s back to Login.
   - Demonstrates the difference:
     - `push()` → keeps previous screen in the stack
     - `pushReplacement()` → removes previous screen from the stack

2. Drawer Menu Navigation
   - The Home screen (`HomeShell`) contains a Drawer with navigation to: Home, About, Contact.
   - Tapping Home updates content without pushing a new route, keeping the BottomNavigationBar visible.

3. BottomNavigationBar
   - Three tabs: Home, About, Contact (with icons).
   - Dynamically switches content without reloading the page.

4. TabBar and TabBarView
   - TabBar integrated inside the AppBar when the Home tab is active, with tabs: Chats, Status, Calls.
   - TabBarView allows swiping or tapping to switch content inside the Home tab.
   - The Chats tab showcases Activity 3 forms via `FormsShowcase`.

5. Combination of Drawer and BottomNavigationBar
   - Both exist simultaneously on the Home screen for flexible navigation options.
   - Drawer navigation updates the currently selected bottom tab, keeping the UI synchronized.

6. Named Routes
   - Defined in `lib/main.dart` for:
     - `/login` (Login)
     - `/home` (Home)
     - `/about` (About)
     - `/contact` (Contact)
   - Navigation uses named routes for cleaner, maintainable code.

7. Integrated Navigation Flow
   - App launches at the Login screen (`/login`).
   - Successful login navigates to Home using `pushReplacement` (prevents stacking multiple Home screens).
   - Home screen includes Drawer, BottomNavigationBar, and TabBar (on the Home tab).
   - Logout returns to the Login screen, clearing the stack using `pushNamedAndRemoveUntil`.

8. UI/UX Highlights
   - Material Design layout with safe areas for clarity.
   - Consistent icons in Drawer, BottomNavigationBar, and TabBar.
   - Responsive design suitable for mobile and web.
   - Uses `const` constructors where possible for efficient rebuilds.

### How to Demo Physically

Login Flow
- Launch app → Login screen (`/login`).
- Enter credentials → Tap Login.
- Demonstrates `pushReplacement`: back exits instead of returning to Login.

Drawer Navigation
- Open Drawer → Home, About, Contact.
- Tap Home → stays on Home (BottomNavigationBar remains visible).
- Tap About/Contact → navigates to the page; back returns to Home.

BottomNavigationBar Tabs
- Switch between Home, About, and Contact.
- Observe icons and dynamic content updates.

TabBar
- Inside AppBar (when Home tab selected), swipe or tap between Chats, Status, Calls.
- Chats shows Activity 3 forms; others show simple content.

Logout Flow
- Tap Logout → returns to Login using `pushNamedAndRemoveUntil`.
- Demonstrates clearing the navigation stack.

### Project Structure and Key Files

```
lib/
  main.dart                      // initialRoute('/login') + named routes
  pages/
    login_screen.dart            // login → pushReplacement to Home
    home_shell.dart              // Drawer + Bottom Tabs + TabBar in AppBar
    simple_pages.dart            // About, Contact
    appointment_booking_page.dart// uses DateTimeForm
    payments_page.dart           // uses ListSavingForm
  widgets/
    forms_showcase.dart          // aggregates Activity 3 forms
    username_form.dart
    login_form.dart
    multi_input_form.dart
    registration_form.dart
    dropdown_form.dart
    date_time_form.dart
    controller_form.dart
    list_saving_form.dart
  services/
    local_data_service.dart
```

### How to Run (FlutLab.io)

1. Open `https://flutlab.io` and sign in.
2. Create a new project → Import this project (Git URL) or Upload as ZIP.
3. After the project opens, go to `pubspec.yaml` and click “Pub get”.
4. Confirm the entry point is `lib/main.dart` (default in FlutLab).
5. Click the Run ▶ button. FlutLab will launch the web preview automatically.
6. Start page is the Login screen (`/login`). Tap Login to go to Home (`/home`). Use the secondary button to demonstrate `push()`.
7. Use Hot Restart in FlutLab when you change code to refresh the preview.

### Notes

`LocalDataService` is an in-memory store for demo purposes:
- Data is lost on app restart.
- Ideal for prototypes and learning projects.
- Can be extended with `sqflite`, `hive`, or Firebase for persistence.