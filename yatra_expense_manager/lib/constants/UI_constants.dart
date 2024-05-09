import 'package:flutter/material.dart';

class UIConstants {
  static showAppSnackBar(BuildContext context, String info) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(info),
      ),
    );
  }
}
