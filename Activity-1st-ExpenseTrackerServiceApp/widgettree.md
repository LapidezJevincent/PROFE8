# Widget Tree Diagram - Expense Tracker App

## File Structure
```
lib/
├── main.dart
├── models/expense.dart
├── services/expense_service.dart
├── views/
│   ├── home_page.dart
│   ├── add_expense_page.dart
│   └── stats_page.dart
└── widgets/custom_button.dart
```

## Main App
```
MyApp
└── MaterialApp
    └── MainPage
        ├── Scaffold
        │   ├── HomePage (Home tab)
        │   └── StatsPage (Stats tab)
        └── BottomNavigationBar (2 tabs)
```

## Pages

### HomePage
```
HomePage
└── Scaffold
    ├── AppBar
    └── Column
        ├── TextField (Name)
        ├── TextField (Amount)
        ├── CupertinoSegmentedControl (Category)
        ├── CupertinoDatePicker
        ├── CustomButton (Add)
        ├── StaggeredGridView (Expenses)
        │   └── Card (Gradient Cards)
        └── Text (Total)
```

### StatsPage
```
StatsPage
└── Scaffold
    ├── AppBar
    └── Column
        ├── Text (Title)
        ├── CustomPaint (Pie Chart)
        └── Legend (Categories)
```

### AddExpensePage
```
AddExpensePage
└── Scaffold
    ├── AppBar
    └── Column
        ├── TextField (Title)
        ├── TextField (Amount)
        ├── CupertinoDatePicker
        ├── CupertinoSegmentedControl
        └── ElevatedButton (Save)
```

## Components

### CustomButton
```
CustomButton
└── ElevatedButton (blue, rounded)
```

### PieChartPainter
```
PieChartPainter
└── CustomPainter (draws pie chart)
```

## Data
- **Expense**: name, amount, category, date
- **ExpenseService**: manages expense list and totals

## Features
- Material Design + Cupertino widgets
- Bottom navigation (2 tabs)
- Custom pie chart
- Reusable components
- Staggered grid view (third-party package)
- Beautiful gradient expense cards
