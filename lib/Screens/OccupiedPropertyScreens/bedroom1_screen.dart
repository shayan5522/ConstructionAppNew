import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import '../../Controllers/check_list_controller.dart';
import '../main_screen.dart';
import 'bedroom2_screen.dart';
class Bedroom1Screen extends StatelessWidget {
  const Bedroom1Screen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> bedroom1ChecklistData = [
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
      appBarTitle: 'Bedroom 1',
      sectionTitle: 'Bedroom 1 Section',
      checklistData: bedroom1ChecklistData,
      totalCost: '420000',
      skipButton: (){
        Get.to(const Bedroom2Screen());
      },
      submitButton:(){
        Get.to(const Bedroom2Screen());
      },
      saveExit: (){
        Get.off(MainScreen());
      },
      textFieldHint1: 'Width X Length',
      textFieldHint2: 'Additional Notes',
      field1Controller: field1Controller,
      field2Controller: field2Controller,
    );
  }
}
