import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      appBarTitle: 'Bedroom 1',
      sectionTitle: 'Bedroom 1 Measurements',
      checklistData: bedroom1ChecklistData,
      totalCost: '420000',
      skipButton: (){
        Get.to(const Bedroom2Screen());
      },
      submitButton:(){},
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
