import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/checkbox_controller.dart';
import 'custom_text_widget.dart';

class CustomCheckboxes extends StatelessWidget {
  final String label;
  final CheckboxController controller;

  const CustomCheckboxes({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.toggleCheckbox();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => Checkbox(
            value: controller.isChecked.value,
            onChanged: (value) {
              controller.toggleCheckbox();
            },
            activeColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          )),
          CustomTextWidget(
            text: label,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
