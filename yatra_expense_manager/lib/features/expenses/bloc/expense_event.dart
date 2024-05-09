// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'expense_bloc.dart';

sealed class ExpenseEvent {}

class AddExpense extends ExpenseEvent {
  final String note;
  final double amount;
  final DateTime date;
  AddExpense({
    required this.note,
    required this.amount,
    required this.date,
  });
}

class RemoveExpense extends ExpenseEvent {}
