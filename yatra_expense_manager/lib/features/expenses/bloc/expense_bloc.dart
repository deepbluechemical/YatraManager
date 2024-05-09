import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yatra_expense_manager/apis/cloud_api.dart';

part "expense_event.dart";
part "expense_state.dart";

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseInitial()) {
    on<AddExpense>(_onExpenseAdd);
    on<RemoveExpense>(_onExpenseRemove);
  }

  _onExpenseAdd(AddExpense event, Emitter<ExpenseState> emit) async {
    // validation
    if (event.note.length > 20) {
      // show error to user
      emit(
        ExpenseError(
          errorMsg: "Note length cannot be more than 20 characters.",
        ),
      );
      return;
    }

    // show loading indicator
    emit(ExpenseLoading());

    // call to api
    final api = CloudAPI();
    await api.addExpense(
      cat: "Transportation",
      amount: event.amount,
      note: event.note,
      date: event.date,
    );

    // turnoff loading indicator
    emit(ExpenseSuccess());
  }

  _onExpenseRemove(RemoveExpense event, Emitter<ExpenseState> emit) {}
}
