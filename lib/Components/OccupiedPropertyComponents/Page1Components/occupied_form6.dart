import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/checkbox_controller.dart';
import '../../../Controllers/loft_work_controller.dart';
import '../../../CustomDialogs/loft_work_dialog.dart';
import '../../../CustomWidgets/custom_checkboxes.dart';
import '../../../CustomWidgets/custom_elevated_button.dart';
import '../../../CustomWidgets/custom_text_widget.dart';

class OccupiedForm6 extends StatelessWidget {
  OccupiedForm6({super.key});
  final LoftWorksController loftWorksController = Get.put(LoftWorksController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text: "Loft Works",
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          Card(
            color: const Color(0xFFF5F8F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomElevatedButton(
                        text: 'Add Other',
                        onPressed: () {
                          Get.to(() => AddItemDialog());
                        },
                        width: 100,
                        height: 40,
                        fontSize: 12,
                        backgroundColor: const Color(0xFF009688),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CustomCheckboxes(
                        label: '',
                        controller: CheckboxController(),
                      ),
                      title: const CustomTextWidget(
                        text: 'Insulation Check',
                        fontWeight: FontWeight.bold,
                      ),
                      subtitle: const CustomTextWidget(
                        text: 'Check for any gaps or damages in the insulation.',
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CustomCheckboxes(
                        label: '',
                        controller: CheckboxController(),
                      ),
                      title: const CustomTextWidget(
                        text: 'Ventilation Inspection',
                        fontWeight: FontWeight.bold,
                      ),
                      subtitle: const CustomTextWidget(
                        text: 'Ensure all vents are clear and functioning properly.',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    return Column(
                      children: loftWorksController.loftWorksItems.map((item) {
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: CustomCheckboxes(
                              label: '',
                              controller: CheckboxController(),
                            ),
                            title: CustomTextWidget(
                              text: item['title']!,
                              fontWeight: FontWeight.bold,
                            ),
                            subtitle: CustomTextWidget(
                              text: item['description']!,
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
