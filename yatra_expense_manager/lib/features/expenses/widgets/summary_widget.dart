import 'package:flutter/material.dart';
import 'package:yatra_expense_manager/theme/palette.dart';

class SummaryWidget extends StatelessWidget {
  final String title;
  final double amount;
  const SummaryWidget({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: Palette.textColorOnContainer,
            ),
          ),
          Text(
            "\u{20B9} ${amount.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
