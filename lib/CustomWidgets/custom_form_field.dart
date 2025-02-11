import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final String label;
  final Widget? leading;
  final int? maxLines;
  final TextInputType? type;
  final bool readOnly;
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final bool enabled;
  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.label,
    this.leading,
    this.controller,
    this.maxLines,
    this.type = TextInputType.text,
    this.readOnly = false,
    this.onTap,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: type,
          onTap: onTap,
          readOnly: readOnly,
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: leading,
            enabled: enabled,
            label:CustomTextWidget(text:  label, fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black38),
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
