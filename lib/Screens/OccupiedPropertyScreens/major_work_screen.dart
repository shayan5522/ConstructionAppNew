import 'package:TotalSurvey/BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import 'package:TotalSurvey/Controllers/loading_controller.dart';
import 'package:TotalSurvey/CustomWidgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../BackendFunctions/OccupiedBackend/other_screen.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/occupied_submit_buttons.dart';
import '../../Controllers/checkbox_controller.dart';
import '../../CustomWidgets/custom_checkboxes.dart';
import '../../CustomWidgets/custom_elevated_button.dart';
import '../../CustomWidgets/custom_form_field.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../main_screen.dart';
import 'final_screen.dart';

class MajorWorkScreen extends StatelessWidget {
  MajorWorkScreen({super.key});
  String? selectedValue;
  final CheckboxController checkboxController = Get.put(CheckboxController());
  final TextEditingController projectValueController = TextEditingController();
  final TextEditingController authorisedByController = TextEditingController();
  FirebaseService _firebaseService = new FirebaseService();
  final LoadingController _loadingController = Get.put(LoadingController());
  final OpeningSheetFormController _openingSheetFormController = Get.put(OpeningSheetFormController());
  final List<Map<String, dynamic>> majorWorkCheckList = [
    {'title': 'Project Scope Defined', 'checked': false},
    {'title': 'Budget Approved', 'checked': false},
    {'title': 'Design Finalized', 'checked': false},
    {'title': 'Permits & Approvals Secured', 'checked': false},
    {'title': 'Construction Timeline Set', 'checked': false},
    {'title': 'Materials & Supplies Ordered', 'checked': false},
    {'title': 'Site Preparation Completed', 'checked': false},
    {'title': 'Safety Plan in Place', 'checked': false},
    {'title': 'Insurance & Liability Checked', 'checked': false},
    {'title': 'Environmental Impact Assessed', 'checked': false},
    {'title': 'Subcontractors Hired', 'checked': false},
    {'title': 'Quality Standards Defined', 'checked': false},
    {'title': 'Painting & Finishing Planned', 'checked': false},
    {'title': 'Electrical Work Assessed', 'checked': false},
    {'title': 'Plumbing Work Assessed', 'checked': false},
    {'title': 'Mechanical Systems Reviewed', 'checked': false},
    {'title': 'Health & Safety Inspections Passed', 'checked': false},
    {'title': 'Final Walkthrough Scheduled', 'checked': false},
    {'title': 'Post-Construction Cleanup Arranged', 'checked': false},
    {'title': 'Client Approval & Handover Planned', 'checked': false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(text: ' Major Work Screen'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomElevatedButton(
                  text: 'Skip This Session',
                  onPressed: () {
                    Get.off(FinalScreen());
                  },
                  width: 300,
                  height: 45,
                  backgroundColor: Colors.tealAccent,
                  textColor: Colors.black,
                  borderRadius: 30,
                ),
              ),
              const SizedBox(height: 10),
               CustomTextWidget(
                text: _openingSheetFormController.projectName.text.isNotEmpty
                    ? _openingSheetFormController.projectName.text
                    : 'Major Work Screen',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
              ),
              Card(
                color: const Color(0xFFF5F8F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        hint: 'Estimated Project Value',
                        label: 'Estimated Project Value',
                        leading: Icon(FontAwesomeIcons.moneyBill),
                        controller: projectValueController,
                        enabled: true,
                      ),
                      Column(
                        children: [
                          CustomTextFormField(
                            hint: 'Authorised By',
                            label: 'Authorised By',
                            leading: Icon(Icons.verified_user),
                            controller: authorisedByController,
                            enabled: selectedValue != 'N/A',
                          ),
                          SizedBox(height: 10),
                          DropdownButton<String>(
                            value: selectedValue,
                            hint: Text('Select an option'),
                            items: ['N/A'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              if (newValue == 'N/A') {
                                authorisedByController.clear();
                              }
                              selectedValue = newValue;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const CustomTextWidget(
                text: 'Check List',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              Card(
                color: const Color(0xFFF5F8F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      for (var checklistItem in majorWorkCheckList)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomCheckboxes(
                                label: checklistItem['title'],
                                controller: checkboxController,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Obx(() {
                return _loadingController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : OccupiedSubmitButtons(

                        nextPage: () {
                          _loadingController.startLoading(true);
                          final checkedValues = checkboxController
                              .selectedLabels.entries
                              .where((entry) => entry.value == true)
                              .map((entry) => entry.key)
                              .toList();
                          try {
                            _firebaseService.saveMajorListData(
                              title: 'Major work',
                              field1: projectValueController.text,
                              field2: authorisedByController.text,
                              Data: checkedValues,
                            );
                          } catch (e) {
                            customSnackBar(context, 'Error', '$e');
                          } finally {
                            _loadingController.startLoading(false);
                          }
                          Get.off(FinalScreen());
                        },

                        saveExist: () {
                          _loadingController.startLoading(true);
                          final checkedValues = checkboxController
                              .selectedLabels.entries
                              .where((entry) => entry.value == true)
                              .map((entry) => entry.key)
                              .toList();
                          try {
                            _firebaseService.saveMajorListData(
                              title: 'Major work',
                              field1: projectValueController.text,
                              field2: authorisedByController.text,
                              Data: checkedValues,
                            );
                            Get.off(MainScreen());
                          } catch (e) {
                            customSnackBar(context, 'Error', '$e');
                          } finally {
                            _loadingController.startLoading(false);
                          }
                        },
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
