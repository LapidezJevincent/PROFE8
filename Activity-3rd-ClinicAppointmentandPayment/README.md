Clinic Appointments & Payments – Flutter Forms Demo

Overview

This Flutter app demonstrates forms and input handling for a small clinic: booking appointments, basic login/registration flows, capturing structured inputs, and recording simple payments — all backed by an in-memory `LocalDataService`.

Project Structure


Clinic-Appointment-App/
├── lib/
│   ├── main.dart
│   ├── pages/
│   │   └── home_page.dart
│   ├── services/
│   │   └── local_data_service.dart
│   └── widgets/
│       ├── username_form.dart
│       ├── login_form.dart
│       ├── multi_input_form.dart
│       ├── registration_form.dart
│       ├── dropdown_form.dart
│       ├── date_time_form.dart
│       ├── controller_form.dart
│       └── list_saving_form.dart
├── pubspec.yaml

1. Record/Document Tracker

`username_form.dart` → allows entry of a tracking ID (e.g., PAT-1234 or VISIT-2025-001).
Saved into `LocalDataService.documents` and displayed in a tracked list.

2. Appointment & Payment Process

`dropdown_form.dart` → select a doctor/specialty or clinic service with a price.
`list_saving_form.dart` → saves booking details (service, patient name, date/time, notes).
Includes a Pay action to mark the booking as paid → recorded in `LocalDataService.orders`/payments.

3. Appointment Scheduling

`date_time_form.dart` → pick a date and time for clinic appointments.
Integrated with booking so reservations are tracked alongside patient/service data.

4. Payment

Bookings begin as “Booked (unpaid)”.
Tapping Pay updates status to Paid and records a simple payments history.

All forms share `LocalDataService`, ensuring documents, bookings, and payments stay consistent while the app runs.


Forms & Input Handling (Activity Breakdown)

This app demonstrates 10 core Flutter form-handling concepts using the widgets in `lib/widgets`:

1. Username Form (`username_form.dart`)

   `TextFormField` labeled “Username/Record ID”. Submit validates input and shows the value or an error.

2. Login Form (`login_form.dart`)

   Fields: Email + Password. Submit validates credentials (demo-only validation).

3. Validation

   Email must contain `@`. Password cannot be empty. Uses `validator` per field.

4. GlobalKey<FormState>

   Each form uses a `GlobalKey<FormState>` to call `validate()` and `save()`.

5. Multi-Input Form (`multi_input_form.dart`)

   Combines `TextField`, `Checkbox`, and `Switch`. Tracks boolean values in state.

6. Registration Form (`registration_form.dart`)

   Fields: Name, Email, Password, Confirm Password. Validates non-empty, email format, and matching passwords.

7. Dropdown Form (`dropdown_form.dart`)

   Uses `DropdownButtonFormField` to select user role or clinic service/doctor.

8. Date & Time Picker (`date_time_form.dart`)

   Integrates `showDatePicker` and `showTimePicker`. Stores selected values for appointments.

9. Controller Form (`controller_form.dart`)

   Uses `TextEditingController` to capture and display user input dynamically.

10. List-Saving Form (`list_saving_form.dart`)

    Captures form input and saves into a local `List`.
    Displays submitted entries with `ListView` for quick review.


How to Run

1. Ensure Flutter SDK is installed and configured.
2. From the project root, run:
   - `flutter pub get`
   - `flutter run`
3. The `HomePage` aggregates the demo forms for quick testing.

Notes

`LocalDataService` is an in-memory store for demo purposes:

  - Data is lost on app restart.
  - Ideal for prototypes and learning projects.
  - Can be extended with `sqflite`, `hive`, or Firebase for persistence.