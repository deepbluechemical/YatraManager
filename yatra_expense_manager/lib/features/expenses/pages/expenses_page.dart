import 'package:flutter/material.dart';
import 'package:yatra_expense_manager/constants/navigation_constants.dart';
import 'package:yatra_expense_manager/features/expenses/widgets/summary_widget.dart';
import 'package:yatra_expense_manager/models/expense_category_model.dart';
import 'package:yatra_expense_manager/models/expense_model.dart';
import 'package:yatra_expense_manager/theme/palette.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final expenses = <ExpenseModel>[
      ExpenseModel(
        category: ExpenseCategoryModel(
          title: "Transportation",
        ),
        amount: 5000,
        notes: 'From delti to bir',
      ),
      ExpenseModel(
          category: ExpenseCategoryModel(
            title: "Entertainment",
          ),
          amount: 4500,
          notes: 'Club fees'),
      ExpenseModel(
          category: ExpenseCategoryModel(
            title: "Drinks",
          ),
          amount: 600,
          notes: 'Beer and Wiskey'),
      ExpenseModel(
          category: ExpenseCategoryModel(
            title: "Restaurants",
          ),
          amount: 6000,
          notes: 'Food in delhi darbar'),
      ExpenseModel(
          category: ExpenseCategoryModel(
            title: "Drinks",
          ),
          amount: 800,
          notes: 'Drinks in bar'),
      ExpenseModel(
          category: ExpenseCategoryModel(
            title: "Activities",
          ),
          amount: 9000,
          notes: 'Paraglyding and other'),
      ExpenseModel(
          category: ExpenseCategoryModel(
            title: "Transportation",
          ),
          amount: 7900,
          notes: 'Bir to Delhi'),
    ];
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          "Jammu and Kashmir",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // displaying summary.
              SummaryWidget(
                title: 'Today',
                amount: 500.56,
              ),
              SummaryWidget(
                title: 'Overall',
                amount: 15000.63,
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          // Expenses text
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 3,
            ),
            alignment: Alignment.center,
            width: double.infinity,
            color: Palette.containerColor,
            child: Text(
              "Expenses",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // scroll view all expenses here.
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                // date sort
                expenses.sort((a, b) {
                  //sorting in ascending order
                  return DateTime.parse(a.dateTime.toString())
                      .compareTo(DateTime.parse(b.dateTime.toString()));
                });

                return Card(
                  color: Palette.containerColor,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.restaurant_menu,
                        color: Colors.white,
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          expenses[index].notes,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          expenses[index].category.title,
                          style: TextStyle(
                            color: Palette.textColorOnContainer,
                          ),
                        ),
                      ],
                    ),
                    trailing: Text(
                      expenses[index].amount.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: addFloatingButton(context),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          bottomNavBar(label: "Expenses", icon: Icons.home),
          bottomNavBar(label: "Stats", icon: Icons.stacked_bar_chart_rounded),
          bottomNavBar(label: "Settings", icon: Icons.settings),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomNavBar({
    required label,
    IconData? icon,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(icon),
    );
  }

  FloatingActionButton addFloatingButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.redAccent,
      mini: true,
      shape: CircleBorder(),
      onPressed: () => Navigator.of(context)
          .pushNamed(NavigationConstants.selectCategoryPage),
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
