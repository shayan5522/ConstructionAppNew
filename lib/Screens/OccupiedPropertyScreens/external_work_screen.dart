import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import '../../Controllers/check_list_controller.dart';
import '../main_screen.dart';
import 'major_work_screen.dart';

class ExternalWorkScreen extends StatelessWidget {
  const ExternalWorkScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> externalWorkChecklistData = [
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main'.obs,
        'selectedCost':'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main'.obs,
        'selectedCost':'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main'.obs,
        'selectedCost':'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
    ];

    final ChecklistController checklistController = Get.put(ChecklistController());
    final TextEditingController field1Controller = TextEditingController();
    final TextEditingController field2Controller = TextEditingController();

    return CommonScreenLayout(
      appBarTitle: 'External Work',
      sectionTitle: 'External Work Section',
      checklistData: externalWorkChecklistData,
      totalCost: '700000',
      skipButton: (){
        Get.to(MajorWorkScreen());
      },
      submitButton:(){
        Get.to(MajorWorkScreen());
      },
      saveExit: (){
        Get.off(MainScreen());
      },
      textFieldHint1: 'Work Area',
      textFieldHint2: 'Additional Notes',
      field1Controller: field1Controller,
      field2Controller: field2Controller,
    );
  }
}
