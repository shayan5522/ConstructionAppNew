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

class MajorWorkScreen extends StatelessWidget {
  MajorWorkScreen({super.key});
  final CheckboxController checkboxController = Get.put(CheckboxController());
  final TextEditingController projectValueController = TextEditingController();
  final TextEditingController produceByController = TextEditingController();
  FirebaseService _firebaseService = new FirebaseService();
  final LoadingController _loadingController = Get.put(LoadingController());

  final List<Map<String, dynamic>> majorWorkCheckList = [
    {'title': 'Design', 'checked': false},
    {'title': 'Construction', 'checked': false},
    {'title': 'Painting', 'checked': false},
    {'title': 'Electrical', 'checked': false},
    {'title': 'Plumbing', 'checked': false},
    {'title': 'Mechanical', 'checked': false},
    {'title': 'Safety', 'checked': false},
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
                    Get.off(MainScreen());
                  },
                  width: 300,
                  height: 45,
                  backgroundColor: Colors.tealAccent,
                  textColor: Colors.black,
                  borderRadius: 30,
                ),
              ),
              const SizedBox(height: 10),
              const CustomTextWidget(
                text: 'Project : New Office Building',
                fontSize: 24,
                fontWeight: FontWeight.w700,
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
                      ),
                      CustomTextFormField(
                        hint: 'Check Produce By',
                        label: 'Check Produce By',
                        leading: Icon(Icons.help),
                        controller: produceByController,
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
                              field2: produceByController.text,
                              Data: checkedValues,
                            );
                          } catch (e) {
                            customSnackBar(context, 'Error', '$e');
                          } finally {
                            _loadingController.startLoading(false);
                          }
                          Get.off(MainScreen());
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
                              field2: produceByController.text,
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
