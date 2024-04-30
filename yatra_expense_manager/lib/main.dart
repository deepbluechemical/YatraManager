import 'package:flutter/material.dart';
import 'package:yatra_expense_manager/features/expenses/pages/expenses_page.dart';
import 'package:yatra_expense_manager/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yatra Manager Application',
      theme: AppTheme.theme,
      home: const ExpensesPage(),
    );
  }
}
