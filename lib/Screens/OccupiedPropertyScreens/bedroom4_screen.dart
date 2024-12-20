import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import '../../Controllers/check_list_controller.dart';
import '../main_screen.dart';
import 'mechnical_work_screen.dart';

class Bedroom4Screen extends StatelessWidget {
  const Bedroom4Screen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> bedroom4ChecklistData = [
      {
        'title': 'Strip Out Floor Covering ?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost': 'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Mastic / Sealants?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost':'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'New Vinyl Floor And Threshold? ',
        'selectedQuantity': 'Main'.obs,
        'selectedCost':'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Wallpaper Removal?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost':'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Plastering to Wall / Ceiling?',
        'selectedQuantity': 'Main'.obs,
         'selectedCost':'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'New 0.5 HR fire door?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost':'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'New Ply Flush Door to Cupboard?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost':'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'New Door Furniture?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost':'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Ease And Adjust Door?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost':'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Renew Skirting ?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost':'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },      {
        'title': 'Window Restricts?',
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
      appBarTitle: 'Bedroom 4',
      sectionTitle: 'Bedroom 4 Measurements',
      checklistData: bedroom4ChecklistData,
      totalCost: '350000',
      skipButton: (){
        Get.to(const MechanicalElectricalScreen());
      },
      submitButton:(){
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
