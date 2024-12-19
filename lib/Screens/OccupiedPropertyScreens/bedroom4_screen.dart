import 'package:constructionapp/Screens/OccupiedPropertyScreens/mechnical_work_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import '../main_screen.dart';

class Bedroom4Screen extends StatelessWidget {
  Bedroom4Screen({super.key});
  final OpeningSheetFormController _formController = Get.put(OpeningSheetFormController());
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> bedroom4ChecklistData = [
      {
        'title': 'Bedroom4 Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost': 'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
    ];

    return CommonScreenLayout(
      appBarTitle: 'Bedroom 4',
      sectionTitle: 'Bedroom 4 Section',
      checklistData: bedroom4ChecklistData,
      totalCost: '350000',
      skipButton: (){
        Get.to(MechanicalElectricalScreen());
      },
      submitButton:(){
        Get.to(MechanicalElectricalScreen());
      },
      saveExit: (){
        Get.off(MainScreen());
      },
      selectedRadio: 'yes'.obs,
      textFieldHint1: 'Width X Length',
      textFieldHint2: 'Additional Notes',
    );
  }
}
