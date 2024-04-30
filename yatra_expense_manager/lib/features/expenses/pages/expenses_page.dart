import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yatra_expense_manager/theme/palette.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              // Containers for displaying total expenses.
              Container(
                width: 180,
                padding: EdgeInsets.symmetric(
                  horizontal: 2,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Palette.containerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      "TOTAL",
                      style: TextStyle(
                        fontSize: 15,
                        color: Palette.textColorOnContainer,
                      ),
                    ),
                    const Text(
                      "\u{20B9} 1235.00",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 180,
                padding: EdgeInsets.symmetric(
                  horizontal: 2,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Palette.containerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      "TODAY",
                      style: TextStyle(
                        fontSize: 15,
                        color: Palette.textColorOnContainer,
                      ),
                    ),
                    const Text(
                      "\u{20B9} 500.00",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
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
          SingleChildScrollView(
            child: Container(
              height: 500,
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("Hello"),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Expenses",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Stats",
            icon: Icon(
              Icons.stacked_bar_chart_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
    );
  }
}
