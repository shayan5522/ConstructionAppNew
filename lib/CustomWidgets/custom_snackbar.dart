import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

void customSnackBar(BuildContext context, String title, String message) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 2),
    content: Row(
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: title,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
              ),
              CustomTextWidget(
               text:  message,
                color: Colors.white70,
              ),
            ],
          ),
        ),
      ],
    ),
    backgroundColor: Colors.black,
    behavior: SnackBarBehavior.floating,
  );

  // Show the SnackBar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
