import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/occupied_submit_buttons.dart';
import '../../Controllers/checkbox_controller.dart';
import '../../CustomWidgets/custom_checkboxes.dart';
import '../../CustomWidgets/custom_elevated_button.dart';
import '../../CustomWidgets/custom_form_field.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../main_screen.dart';

class MajorWorkScreen extends StatelessWidget {
  MajorWorkScreen({super.key});
  final List<Map<String, dynamic>> majorWorkCheckList = [
    {'title': 'Design', 'checked': false},
    {'title': 'Construction', 'checked': false},
    {'title': 'Painting', 'checked': false},
    {'title': 'Electrical', 'checked': false},
    {'title': 'Plumbing', 'checked': false},
    {'title': 'Mechanical', 'checked': false},
    {'title': 'Safety', 'checked': false},
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
                  onPressed: () {},
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
                child: const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        hint: 'Estimated Project Value',
                        label: 'Estimated Project Value',
                        leading: Icon(Icons.help),
                      ),
                      CustomTextFormField(
                        hint: 'Check Produce By',
                        label: 'Check Produce By',
                        leading: Icon(Icons.help),
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
                                controller: CheckboxController(),
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              OccupiedSubmitButtons(
                  nextPage: (){
                    Get.off(MainScreen());
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
