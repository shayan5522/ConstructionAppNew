import 'package:constructionapp/BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import 'package:constructionapp/CustomWidgets/custom_form_field.dart';
import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../CustomWidgets/custom_radio_button.dart';

class OccupiedForm2 extends StatefulWidget {
  const OccupiedForm2({super.key});

  @override
  State<OccupiedForm2> createState() => _OccupiedForm2State();
}

class _OccupiedForm2State extends State<OccupiedForm2> {
  final _formKey = GlobalKey<FormState>();
  final OpeningSheetFormController _formController = Get.put(OpeningSheetFormController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text:  "Details",
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          Card(
            color: const Color(0xFFF5F8F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    CustomTextFormField(
                        label: "Void / occupied Address",
                        hint:  "Enter Address",
                        controller: _formController.occupiedAddressController ,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                        label: "Date",
                        hint:  "DD/MM/YY",
                        controller: _formController.dateController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                        label: "Target program",
                        hint:  "Enter Target program",
                        controller: _formController.targetProgramController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                        label: "Asbestos survey",
                        hint:  "Enter Asbestos survey",
                        controller: _formController.absoluteSurveyController,
                    ),
                    const SizedBox(height: 16),
                    const CustomTextFormField(label: "EPC Required",hint:  "Enter EPC Required"),
                    const SizedBox(height: 16),
                  Obx(() {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextWidget(
                          text: "PIR",
                          fontSize: 16, fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            CustomRadioButton<String>(
                              value: "Yes",
                              groupValue: _formController.pir.value,
                              label: "Yes",
                              onChanged: (value) => _formController.pir.value = value!,
                              activeColor: Colors.green,
                            ),
                            const SizedBox(width: 16),
                            CustomRadioButton<String>(
                              value: "No",
                              groupValue: _formController.pir.value,
                              label: "No",
                              onChanged: (value) => _formController.pir.value = value!,
                              activeColor: Colors.red,
                            ),
                            const SizedBox(width: 16),
                            CustomRadioButton<String>(
                              value: "N/A",
                              groupValue: _formController.pir.value,
                              label: "N/A",
                              onChanged: (value) => _formController.pir.value = value!,
                              activeColor: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                        label: "Gas test",
                        hint:  "Enter Gas test",
                        controller: _formController.gasTestController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
