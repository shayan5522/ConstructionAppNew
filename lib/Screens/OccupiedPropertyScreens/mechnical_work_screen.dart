import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import '../../Controllers/check_list_controller.dart';
import '../main_screen.dart';
import 'external_work_screen.dart';

class MechanicalElectricalScreen extends StatelessWidget {
  const MechanicalElectricalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> mechanicalElectricalChecklistData = [
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
      appBarTitle: 'Mechanical & Electrical Work',
      sectionTitle: 'Mechanical and Electrical Work Section',
      checklistData: mechanicalElectricalChecklistData,
      totalCost: '600000',
      skipButton: (){
        Get.to(const ExternalWorkScreen());
      },
      submitButton:(){
        Get.to(const ExternalWorkScreen());
      },
      saveExit: (){
        Get.off(MainScreen());
      },
      textFieldHint1: 'Wiring Quantity',
      textFieldHint2: 'Additional Notes',
      field1Controller: field1Controller,
      field2Controller: field2Controller,
    );
  }
}
