import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final String label;

  CustomTextFormField({super.key, required this.hint, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
         text:  label, fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
