import 'package:flutter/material.dart';

// Function to show a custom SnackBar
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
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                message,
                style: const TextStyle(
                  color: Colors.white70,
                ),
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
