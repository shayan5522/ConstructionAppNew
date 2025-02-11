import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import '../../../CustomWidgets/custom_form_field.dart';
import '../../../CustomWidgets/custom_text_widget.dart';

class OccupiedForm3 extends StatelessWidget {
  OccupiedForm3({super.key});
  final OpeningSheetFormController _formController = Get.put(OpeningSheetFormController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text:  'Services',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          Card(
            color: const Color(0xFFF5F8F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextWidget(
                        text:  'Electrical ',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        hint: 'Enter location e.g service room',
                        label: 'Location',
                        controller:_formController.electricLocationController ,
                        enabled: true,
                      ),
                      const SizedBox(height: 10),
                      const CustomTextWidget(
                        text: 'Readings',
                        fontSize: 12, color: Colors.black54,
                      ),
                      const SizedBox(height: 5),
                      CustomTextFormField(
                        hint: 'Kwh',
                        label: 'Reading',
                        controller:_formController.electricReadingController ,
                        type: TextInputType.number,
                        enabled: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextWidget(
                        text:  'Gas ',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        hint: 'Enter location e.g service room',
                        label: 'Location',
                        controller:_formController.gasLocationController,
                        enabled: true,
                      ),
                      const SizedBox(height: 10),
                      const CustomTextWidget(
                        text: 'Readings',
                        fontSize: 12, color: Colors.black54,
                      ),
                      const SizedBox(height: 5),
                      CustomTextFormField(
                        hint: 'Kwh',
                        label: 'Reading',
                        controller:_formController.gasReadingController ,
                        type: TextInputType.number,
                        enabled: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextWidget(
                        text:  'Water',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        hint: 'Enter location e.g service room',
                        label: 'Location',
                        controller:_formController.waterLocationController,
                        enabled: true,
                      ),
                      const SizedBox(height: 10),
                      const CustomTextWidget(
                        text: 'Readings',
                        fontSize: 12, color: Colors.black54,
                      ),
                      const SizedBox(height: 5),
                      CustomTextFormField(
                        hint: 'Kwh',
                        label: 'Reading',
                        controller:_formController.waterReadingController,
                        type: TextInputType.number,
                        enabled: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
