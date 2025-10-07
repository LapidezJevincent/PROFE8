Clinic Appointments & Payments — Forms + Navigation (Activities 3 & 4)

Overview

This Flutter app demonstrates Activity 3 (Forms & Input Handling) and Activity 4 (Navigation) for a small clinic: booking appointments, simple login/registration, structured inputs, and recording payments — all backed by an in-memory `LocalDataService`.

Project Structure


Clinic-Appointment-App/
├── lib/
│   ├── main.dart                     // initialRoute('/login') + named routes
│   ├── pages/
│   │   ├── login_screen.dart         // login → pushReplacement to Home
│   │   ├── home_shell.dart           // Drawer + Bottom Tabs + TabBar in AppBar
│   │   ├── simple_pages.dart         // About, Contact
│   │   ├── appointment_booking_page.dart // uses DateTimeForm
│   │   └── payments_page.dart        // uses ListSavingForm
│   ├── widgets/
│   │   ├── forms_showcase.dart       // aggregates Activity 3 forms
│   │   ├── username_form.dart
│   │   ├── login_form.dart
│   │   ├── multi_input_form.dart
│   │   ├── registration_form.dart
│   │   ├── dropdown_form.dart
│   │   ├── date_time_form.dart
│   │   ├── controller_form.dart
│   │   └── list_saving_form.dart
│   └── services/
│       └── local_data_service.dart
├── pubspec.yaml

1. Record/Document Tracker

`username_form.dart` → allows entry of a tracking ID (e.g., PAT-1234 or VISIT-2025-001).
Saved into `LocalDataService.documents` and displayed in a tracked list.

2. Appointment & Payment Process

`dropdown_form.dart` → select a clinic service with a price.
`list_saving_form.dart` → saves booking details (service, patient name, date/time, notes).
Includes a Pay action to mark the booking as paid → recorded in `LocalDataService.orders`.

3. Appointment Scheduling

`date_time_form.dart` → pick a date and time for clinic appointments.

4. Payment

Bookings begin as “Booked (unpaid)”, then move to “Paid” after the Pay action.

All forms share `LocalDataService` while the app runs.


Forms & Input Handling (Activity 3)

This app demonstrates 10 core Flutter form-handling concepts using the widgets in `lib/widgets`.


Navigation (Activity 4)

1) Two screens with push() and pop(): from Login, the secondary button “Try push() → Home” uses push; back pops to Login.
2) Drawer menu: inside `HomeShell` with three pages (Home, About, Contact).
3) BottomNavigationBar (3 items): Home, About, Contact (icons included).
4) TabBar with TabBarView (inside Scaffold): Home tab switches Chats/Status/Calls.
5) Icons for each BottomNavigationBar item.
6) Drawer + BottomNavigationBar combined in the same app (`HomeShell`).
7) Named routes for Home (`/home`), About (`/about`), Contact (`/contact`) in `main.dart`.
8) push() vs pushReplacement(): Login Submit uses pushReplacement; secondary button uses push.
9) TabBar inside AppBar (strict): TabBar is attached to AppBar when the Home tab is active.
10) Login → Home flow: Home contains Drawer and Bottom Tabs. Logout button and app name row sit under the TabBar on Home.

Home layout (after login)
- AppBar: "Clinic App Navigation" with Drawer; when Home tab is selected, the AppBar shows a TabBar (Chats/Status/Calls).
- Bottom Tabs: Home, About, Contact.
- Chats tab shows the Activity 3 forms via `FormsShowcase`; Status/Calls show simple content.
- Below the TabBar, a row shows the app name and a Logout button (returns to `/login`).

How to Run

1. Ensure Flutter SDK is installed and configured.
2. Web (FlutLab-ready)
   - `flutter pub get`
   - `flutter config --enable-web`
   - `flutter run -d chrome`
3. Start page is the login (`/login`). Click Submit to go to Home (pushReplacement). The secondary button demonstrates push().

Notes

`LocalDataService` is an in-memory store for demo purposes:

  - Data is lost on app restart.
  - Ideal for prototypes and learning projects.
  - Can be extended with `sqflite`, `hive`, or Firebase for persistence.