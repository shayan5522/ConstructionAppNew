import 'package:flutter/material.dart';

Future<void> showCustomConfirmationDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onConfirm,
  VoidCallback? onCancel,
  String confirmText = "Confirm",
  String cancelText = "Cancel",
  Color confirmColor = Colors.blue,
  Color cancelColor = Colors.red,
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: onCancel ?? () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              foregroundColor: cancelColor,
            ),
            child: Text(cancelText),
          ),
          ElevatedButton(
            onPressed: () {
              onConfirm();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: confirmColor,
            ),
            child: Text(confirmText),
          ),
        ],
      );
    },
  );
}
