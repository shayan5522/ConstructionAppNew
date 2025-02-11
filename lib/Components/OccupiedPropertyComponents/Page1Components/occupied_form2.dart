import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import '../../../CustomWidgets/custom_form_field.dart';
import '../../../CustomWidgets/custom_radio_button.dart';
import '../../../CustomWidgets/custom_text_widget.dart';

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
                      enabled: true,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      label: "Date",
                      hint: "Select Date",
                      controller: _formController.dateController,
                      enabled: true,
                      readOnly: true,
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          _formController.dateController.text =
                          "${selectedDate.day.toString().padLeft(2, '0')}/"
                              "${selectedDate.month.toString().padLeft(2, '0')}/"
                              "${selectedDate.year}";
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                        label: "Target program",
                        hint:  "Enter Target program",
                        controller: _formController.targetProgramController,
                      enabled: true,
                    ),
                    const SizedBox(height: 16),
                    const CustomTextFormField(label: "EPC Required",hint:  "Enter EPC Required",enabled: true,),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      label: "Gas test",
                      hint:  "Enter Gas test",
                      controller: _formController.gasTestController,
                      enabled: true,
                    ),
                    const SizedBox(height: 16),
                    Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextWidget(
                            text: "Asbestos Survey",
                            fontSize: 16, fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              CustomRadioButton<String>(
                                value: "Yes",
                                groupValue: _formController.absoluteSurvey.value,
                                label: "Yes",
                                onChanged: (value){
                                  _formController.absoluteSurvey.value = value!;
                                },
                                activeColor: Colors.green,
                              ),
                              const SizedBox(width: 16),
                              CustomRadioButton<String>(
                                value: "No",
                                groupValue:  _formController.absoluteSurvey.value,
                                label: "No",
                                onChanged: (value){
                                  _formController.absoluteSurvey.value = value!;
                                },
                                activeColor: Colors.red,
                              ),
                              const SizedBox(width: 16),
                              CustomRadioButton<String>(
                                value: "N/A",
                                groupValue:  _formController.absoluteSurvey.value,
                                label: "N/A",
                                onChanged: (value){
                                  _formController.absoluteSurvey.value = value!;
                                },
                                activeColor: Colors.blue,
                              ),
                              const SizedBox(width: 16),
                              CustomRadioButton<String>(
                                value: "N/K",
                                groupValue:  _formController.absoluteSurvey.value,
                                label: "N/K",
                                onChanged: (value){
                                  _formController.absoluteSurvey.value = value!;
                                },
                                activeColor: Colors.yellow,
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
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
                              onChanged: (value){
                                _formController.pir.value = value!;
                              },
                              activeColor: Colors.green,
                            ),
                            const SizedBox(width: 16),
                            CustomRadioButton<String>(
                              value: "No",
                              groupValue: _formController.pir.value,
                              label: "No",
                              onChanged: (value){
                                _formController.pir.value = value!;
                              },
                              activeColor: Colors.red,
                            ),
                            const SizedBox(width: 16),
                            CustomRadioButton<String>(
                              value: "N/A",
                              groupValue: _formController.pir.value,
                              label: "N/A",
                              onChanged: (value){
                                _formController.pir.value = value!;
                                },
                              activeColor: Colors.blue,
                            ),
                            const SizedBox(width: 16),
                            CustomRadioButton<String>(
                              value: "N/K",
                              groupValue: _formController.pir.value,
                              label: "N/K",
                              onChanged: (value){
                                _formController.pir.value = value!;
                              },
                              activeColor: Colors.yellow,
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
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
