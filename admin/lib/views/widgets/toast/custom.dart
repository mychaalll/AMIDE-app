import 'package:flutter/material.dart';

class CustomToast {
  static void showCustomMessage({
    required context,
    required message,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(message),
          ),
        );
      },
    );
  }
}
