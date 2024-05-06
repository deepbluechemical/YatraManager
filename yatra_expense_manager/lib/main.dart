import 'package:flutter/material.dart';
import 'package:yatra_expense_manager/constants/navigation_constants.dart';
import 'package:yatra_expense_manager/features/expenses/pages/add_expense_page.dart';
import 'package:yatra_expense_manager/features/expenses/pages/select_category_page.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Yatra Manager Application',
      theme: AppTheme.theme,
      initialRoute: NavigationConstants.expensePage,
      routes: {
        NavigationConstants.expensePage: (context) => const ExpensesPage(),
        NavigationConstants.addExpensePage: (context) => const AddExpensePage(),
        NavigationConstants.selectCategoryPage: (context) =>
            const SelectCategoryPage(),
      },
    );
  }
}
