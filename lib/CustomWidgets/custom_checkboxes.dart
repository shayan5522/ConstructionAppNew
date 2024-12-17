import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class CustomCheckboxes extends StatelessWidget {
  final String label;
  const CustomCheckboxes({super.key,required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
          activeColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        CustomTextWidget(
          text:  label,
          fontSize: 14,
        ),
      ],
    );
  }
}
