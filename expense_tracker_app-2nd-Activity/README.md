# Expense Tracker App

A Flutter application for tracking personal expenses with a clean, organized architecture and modern UI components.

## Project Structure

This project follows a well-organized folder structure that separates concerns and promotes maintainability:

```
lib/
├── main.dart                 # App entry point and main navigation
├── models/
│   └── expense.dart         # Data model for expense objects
├── services/
│   └── expense_service.dart # Business logic and data management
├── views/
│   ├── home_page.dart       # Main expense list and input screen
│   ├── add_expense_page.dart # Dedicated expense creation screen
│   ├── stats_page.dart      # Statistics and charts screen
│   └── widgets/             # View-specific widgets (currently empty)
└── widgets/
    └── custom_button.dart   # Reusable custom button component
```

## Architecture Rationale

### Models Folder
- **Purpose**: Contains data models and business entities
- **Rationale**: Centralizes data structure definitions, making it easy to maintain and modify data models
- **Contents**: `Expense` class with properties for name, amount, category, and date

### Services Folder
- **Purpose**: Handles business logic and data operations
- **Rationale**: Separates data management from UI logic, following the service layer pattern
- **Contents**: `ExpenseService` singleton for managing expense data

### Views Folder
- **Purpose**: Contains screen-level widgets and page components
- **Rationale**: Organizes UI screens separately from reusable widgets, making navigation and screen management clearer
- **Contents**: Home page, add expense page, stats page, and view-specific widgets

### Widgets Folder
- **Purpose**: Houses reusable UI components
- **Rationale**: Promotes code reusability and maintains consistent UI patterns across the app
- **Contents**: Custom button widget used in multiple screens

## Features Implemented

### 1. StatelessWidget Implementation
- `MyApp` class demonstrates a basic StatelessWidget for the app root

### 2. StatefulWidget with Counter
- `MainPage` uses StatefulWidget to manage navigation state
- Bottom navigation bar with state management for page switching

### 3. Custom Reusable Widget
- `CustomButton` widget used in multiple screens
- Consistent styling and behavior across the app

### 4. Material Design and Cupertino Widgets
- **Material Design**: TextField, ElevatedButton, AppBar, Card, ListTile
- **Cupertino Widgets**: CupertinoSegmentedControl, CupertinoDatePicker
- Mixed usage demonstrates platform-specific UI components

### 5. Multi-Page Navigation
- Two main pages: Home and Stats
- BottomNavigationBar for seamless navigation
- State management for active page tracking

### 6. Widget Tree Structure
The app follows a hierarchical widget structure with clear parent-child relationships (see Widget Tree section below)

### 7. Refactored Widget Tree
- Custom widgets like `CustomButton` break down complex UI into manageable components
- `PieChartPainter` custom painter for statistics visualization

### 8. Third-Party Package Integration
- **flutter_staggered_grid_view**: Used for beautiful grid layout of expense cards
- Creates visually appealing staggered grid with gradient cards
- Demonstrates proper third-party package integration

## Key Components

### Expense Model
Simple data class representing an expense with:
- Name (String)
- Amount (double)
- Category (String)
- Date (DateTime)

### Expense Service
Singleton service managing expense data:
- Add new expenses
- Retrieve expense list
- Calculate total amount
- Maintains data persistence during app session

### Custom Button
Reusable button component with:
- Custom styling (blue background, rounded corners)
- Consistent padding and typography
- Callback function support

### Statistics Page
Features a custom pie chart implementation:
- Visual representation of expenses by category
- Color-coded legend
- Custom painter for chart rendering

## Getting Started

1. Ensure Flutter SDK is installed
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Dependencies

- Flutter SDK (^3.0.0)
- flutter_staggered_grid_view (^0.7.0) - For beautiful grid layouts
- Material Design and Cupertino widgets from Flutter framework

## Widget Tree Diagram

The following diagram shows the hierarchical structure of widgets in the Expense Tracker app:

```
MyApp (StatelessWidget)
└── MaterialApp
    └── MainPage (StatefulWidget)
        ├── Scaffold
        │   ├── body: _pages[_selectedIndex]
        │   │   ├── HomePage (StatefulWidget) [when selectedIndex = 0]
        │   │   │   ├── Scaffold
        │   │   │   │   ├── AppBar
        │   │   │   │   │   └── Text('Expenses')
        │   │   │   │   └── body: Padding
        │   │   │   │       └── Column
        │   │   │   │           ├── TextField (Expense Name)
        │   │   │   │           ├── TextField (Amount)
        │   │   │   │           ├── SizedBox
        │   │   │   │           ├── CupertinoSegmentedControl
        │   │   │   │           │   ├── Padding → Text('Food')
        │   │   │   │           │   ├── Padding → Text('Transport')
        │   │   │   │           │   └── Padding → Text('Shopping')
        │   │   │   │           ├── SizedBox
        │   │   │   │           ├── Text('Pick Date (optional):')
        │   │   │   │           ├── SizedBox (CupertinoDatePicker)
        │   │   │   │           │   └── CupertinoDatePicker
        │   │   │   │           ├── SizedBox
        │   │   │   │           ├── CustomButton
        │   │   │   │           │   └── ElevatedButton
        │   │   │   │           │       └── Text('Add Expense')
        │   │   │   │           ├── SizedBox
        │   │   │   │           ├── Expanded
        │   │   │   │           │   └── ListView.builder
        │   │   │   │           │       └── Card (for each expense)
        │   │   │   │           │           └── ListTile
        │   │   │   │           │               ├── Text (expense name)
        │   │   │   │           │               ├── Text (category & date)
        │   │   │   │           │               └── Text (amount)
        │   │   │   │           └── Text (Total amount)
        │   │   │   └── floatingActionButton: null
        │   │   └── StatsPage (StatefulWidget) [when selectedIndex = 1]
        │   │       ├── Scaffold
        │   │       │   ├── AppBar
        │   │       │   │   └── Text('Stats')
        │   │       │   └── body: Padding
        │   │       │       └── Column
        │   │       │           ├── Text('Expenses by Category')
        │   │       │           ├── SizedBox
        │   │       │           ├── SizedBox (Custom Paint)
        │   │       │           │   └── CustomPaint
        │   │       │           │       └── PieChartPainter
        │   │       │           ├── SizedBox
        │   │       │           └── ... (Legend items)
        │   │       │               └── Row (for each category)
        │   │       │                   ├── Container (color dot)
        │   │       │                   ├── SizedBox
        │   │       │                   └── Text (category & amount)
        │   │       └── floatingActionButton: null
        │   └── bottomNavigationBar: BottomNavigationBar
        │       ├── BottomNavigationBarItem
        │       │   ├── Icon(Icons.home)
        │       │   └── Text('Home')
        │       └── BottomNavigationBarItem
        │           ├── Icon(Icons.pie_chart)
        │           └── Text('Stats')
        └── AddExpensePage (StatefulWidget) [when navigated to]
            ├── Scaffold
            │   ├── AppBar
            │   │   └── Text('Add Expense')
            │   └── body: Padding
            │       └── Column
            │           ├── TextField (Title)
            │           ├── SizedBox
            │           ├── TextField (Amount)
            │           ├── SizedBox
            │           ├── Text('Pick Date (Cupertino Style):')
            │           ├── SizedBox (CupertinoDatePicker)
            │           │   └── CupertinoDatePicker
            │           ├── SizedBox
            │           ├── CupertinoSegmentedControl
            │           │   ├── Text('Food')
            │           │   ├── Text('Transport')
            │           │   └── Text('Other')
            │           ├── Spacer
            │           └── ElevatedButton
            │               └── Text('Save Expense')
            └── floatingActionButton: null
```

### Widget Hierarchy Explanation

**Root Level:**
- `MyApp`: StatelessWidget that serves as the app entry point
- `MaterialApp`: Provides Material Design theming and navigation context

**Main Navigation:**
- `MainPage`: StatefulWidget managing navigation state between Home and Stats
- `Scaffold`: Provides basic Material Design layout structure
- `BottomNavigationBar`: Handles page switching with two tabs

**Home Page Widgets:**
- `HomePage`: StatefulWidget containing expense input and list
- `Column`: Organizes input fields vertically
- `TextField`: Material Design input fields for expense data
- `CupertinoSegmentedControl`: iOS-style category selector
- `CupertinoDatePicker`: iOS-style date picker
- `CustomButton`: Reusable button component
- `ListView.builder`: Efficiently renders expense list
- `Card` & `ListTile`: Material Design list items

**Stats Page Widgets:**
- `StatsPage`: StatefulWidget displaying expense statistics
- `CustomPaint`: Custom painter for pie chart visualization
- `PieChartPainter`: Custom painter class for drawing pie chart
- Dynamic legend generation with color-coded categories

**Add Expense Page Widgets:**
- `AddExpensePage`: StatefulWidget for dedicated expense creation
- Mix of Material and Cupertino widgets demonstrating platform-specific UI

**Custom Components:**
- `CustomButton`: Reusable ElevatedButton with consistent styling
- `PieChartPainter`: Custom painter for chart visualization

This widget tree demonstrates proper separation of concerns, reusable components, and a clear parent-child hierarchy that makes the app maintainable and scalable.

## Future Enhancements

- Add data persistence with local storage
- Implement expense editing and deletion
- Add more chart types and statistics
- Integrate third-party packages for enhanced UI components
- Add form validation and error handling
