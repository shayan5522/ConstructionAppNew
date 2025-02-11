import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../CustomWidgets/custom_text_widget.dart';
import '../Controllers/loft_work_controller.dart';
import '../CustomWidgets/custom_form_field.dart';

class AddItemDialog extends StatelessWidget {
  AddItemDialog({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final LoftWorksController loftWorksController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: "Add New Item",
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              hint: 'Add Title',
              label: 'Title',
              controller: titleController,
              enabled: true,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
                hint: 'Add Description',
                label: 'Description',
                controller: descriptionController,
                maxLines: 3,
              enabled: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final description = descriptionController.text.trim();
                if (title.isNotEmpty && description.isNotEmpty) {
                  loftWorksController.addItem(title, description);
                  Get.back();
                } else {
                  Get.snackbar('Error', 'Please fill in both fields.');
                }
              },
              child: const CustomTextWidget(text: 'Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
