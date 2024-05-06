import 'dart:math';

import 'package:yatra_expense_manager/models/expense_category_model.dart';

class ExpenseModel {
  final String expenseId;
  final ExpenseCategoryModel category;
  final double amount;
  final String notes;
  final DateTime dateTime;

  ExpenseModel({
    required this.category,
    required this.amount,
    required this.notes,
  })  : expenseId = DateTime.now().microsecondsSinceEpoch.toString(),
        dateTime = DateTime(2024, 05, getRandomDate());
}

int getRandomDate() {
  int randDate = Random().nextInt(10) + 1;
  return randDate;
}
