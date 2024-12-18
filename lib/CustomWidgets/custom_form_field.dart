import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final String label;
  final Widget? leading;
  final int? maxLines;
  final TextEditingController? controller;
  const CustomTextFormField({super.key, required this.hint, required this.label,this.leading,this.controller,this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text:  label, fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            label:leading ,
            filled: true,
            hintStyle: const TextStyle(
              color: Colors.black38,
              fontSize: 14,
            ),
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
