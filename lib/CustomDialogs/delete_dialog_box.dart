import 'package:flutter/material.dart';
import 'package:TotalSurvey/CustomWidgets/custom_text_widget.dart';

void showDeleteConfirmationDialog({
  required BuildContext context,
  required Widget onConfirm,
  required VoidCallback onCancel,
  required String projectName,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.white,
        title: CustomTextWidget(
          text: 'Delete Project?',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
              size: 50,
            ),
            SizedBox(height: 20),
            CustomTextWidget(
              text: 'Are you sure you want to delete this project? This action cannot be undone.',
              fontSize: 16,
              color: Colors.black87,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CustomTextWidget(
              text: 'Project Name: ${projectName}',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onCancel,
            child: CustomTextWidget(
              text: 'Cancel',
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          // Delete button
          onConfirm,
        ],
      );
    },
  );
}
