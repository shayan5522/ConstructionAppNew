import 'package:TotalSurvey/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/custom_buttons.dart';
import 'project_details_controller.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final List<String>? argument;
  const ProjectDetailsScreen({Key? key, required this.argument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> publicUrls = argument ?? Get.arguments ?? [];
    final ProjectDetailsController controller = Get.put(ProjectDetailsController());
    controller.imageUrls.addAll(publicUrls);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: CustomTextWidget(
          text: "Project Details",
            fontWeight: FontWeight.w600,
            fontSize: 24,
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                     text:  "Project Details",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F6F2),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            _buildInputField(
                              "Project Name",
                              "Enter project name",
                                  (value) => controller.projectName.value = value,
                            ),
                            _buildInputField(
                              "UPRN",
                              "Enter unique property number",
                                  (value) => controller.uprn.value = value,
                            ),
                            _buildInputField(
                              "Address",
                              "Enter address",
                                  (value) => controller.address.value = value,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "User Information",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F6F2),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            _buildInputField(
                              "Surveyor's Name",
                              "Enter name",
                                  (value) => controller.surveyorName.value = value,
                            ),
                            _buildInputField(
                              "Contact Details",
                              "Enter email / phone no",
                                  (value) => controller.contactDetails.value = value,
                            ),
                            _buildInputField(
                              "Property/Building Manager",
                              "Enter manager's name",
                                  (value) => controller.propertyManager.value = value,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "Building Orientation",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomTextWidget(
                         text:  "Detect building orientation",
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                           textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: controller.selectedPropertyType.value.isEmpty
                                ? null
                                : controller.selectedPropertyType.value,
                            hint: CustomTextWidget(
                             text:  "Select Property Type", color: Colors.grey.shade500,
                            ),
                            items: ["Residential", "Commercial", "Industrial"]
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: CustomTextWidget(text: value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.setPropertyType(value!);
                            },
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomButton(
                  text: "Complete Survey Inspection",
                  onPressed: controller.completeSurveyInspection,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hintText, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
         text: label,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
        ),
        const SizedBox(height: 5),
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400]),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
