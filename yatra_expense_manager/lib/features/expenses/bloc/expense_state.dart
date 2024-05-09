// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "expense_bloc.dart";

sealed class ExpenseState {}

class ExpenseInitial extends ExpenseState {}

class ExpenseSuccess extends ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseError extends ExpenseState {
  final String errorMsg;
  ExpenseError({required this.errorMsg});
}
