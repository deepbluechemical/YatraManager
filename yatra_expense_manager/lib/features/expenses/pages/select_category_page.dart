import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yatra_expense_manager/constants/navigation_constants.dart';
import 'package:yatra_expense_manager/theme/palette.dart';

class SelectCategoryPage extends StatelessWidget {
  const SelectCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.backgroundColor,
        appBar: AppBar(
          title: Text(
            "Select Category",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: GridView.count(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children: List.generate(15, (index) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                NavigationConstants.addExpensePage,
              ),
              child: Category(),
            );
          }),
        ));
  }
}

class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      width: 140,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white10,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.emoji_transportation_sharp,
            size: 30.0,
          ),
          Text(
            "Transportation",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
