import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:yatra_expense_manager/constants/UI_constants.dart';
import 'package:yatra_expense_manager/features/expenses/bloc/expense_bloc.dart';
import 'package:yatra_expense_manager/theme/palette.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  DateTime selectedDate = DateTime.now();
  final dateController = TextEditingController();
  final noteController = TextEditingController();
  final amountController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String formatted = formatter.format(selectedDate);
        dateController.text = formatted;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpenseBloc, ExpenseState>(
      listener: (context, state) {
        if (state is ExpenseError) {
          UIConstants.showAppSnackBar(context, state.errorMsg);
        }
      },
      builder: (context, state) {
        return state is ExpenseLoading
            ? Center(child: const CircularProgressIndicator())
            : Scaffold(
                backgroundColor: Palette.backgroundColor,
                appBar: AppBar(
                  title: Text(
                    "Add Expense",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // save the expense.
                        // inform bloc that event has occured
                        context.read<ExpenseBloc>().add(
                              AddExpense(
                                note: noteController.text,
                                amount: double.parse(amountController.text),
                                date: selectedDate,
                              ),
                            );
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    // Top header with category logo and currency entry.
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            child: Icon(
                              Icons.emoji_transportation_rounded,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                alignment: Alignment.bottomCenter,
                                child: TextField(
                                  controller: amountController,
                                  autofocus: true,
                                  textAlign: TextAlign.right,
                                  //textDirection: TextDirection.RTL,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purpleAccent,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "INR",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Notes and date time selector
                    TextField(
                      controller: noteController,
                      decoration: InputDecoration(
                        hintText: "Enter note",
                        prefixIcon: Icon(
                          Icons.edit,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    TextField(
                      readOnly: true,
                      controller: dateController,
                      onTap: () => _selectDate(context),
                      keyboardType: TextInputType.none,
                      decoration: InputDecoration(
                        hintText: "Select date",
                        prefixIcon: Icon(
                          Icons.calendar_month,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
