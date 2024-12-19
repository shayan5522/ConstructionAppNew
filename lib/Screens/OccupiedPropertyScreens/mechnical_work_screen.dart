import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import '../main_screen.dart';
import 'external_work_screen.dart';

class MechanicalElectricalScreen extends StatelessWidget {
  const MechanicalElectricalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> mechanicalElectricalChecklistData = [
      {
        'title': 'CP12,Boiler Commissioning,New Cooker Gas Supply?',
        'selectedQuantity': 'Main',
        'selectedCost': 'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Boiler Only Renewal?',
        'selectedQuantity': 'Main',
        'selectedCost': 'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Boiler Only Relocation To Different Room?',
        'selectedQuantity': 'Main',
        'selectedCost': 'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Upgrade Main Water Supply For Comb Boiler?',
        'selectedQuantity': 'Main',
        'selectedCost': 'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Renew Pipe Work?',
        'selectedQuantity': 'Main',
        'selectedCost': 'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Renew Radiator ?',
        'selectedQuantity': 'Main',
        'selectedCost': 'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Renew Radiator Valve?',
        'selectedQuantity': 'Main',
        'selectedCost': 'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Renew Main Water Supply To Property?',
        'selectedQuantity': 'Main',
        'selectedCost': 'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
    ];

    return CommonScreenLayout(
      appBarTitle: 'Mechanical & Electrical Work',
      sectionTitle: 'Checklist',
      checklistData: mechanicalElectricalChecklistData,
      totalCost: '600000',
      skipButton: (){
        Get.to(ExternalWorkScreen());
      },
      submitButton:(){
        Get.to(ExternalWorkScreen());
      },
      saveExit: (){
        Get.off(MainScreen());
      },
      textFieldHint1: 'Wiring Quantity',
      textFieldHint2: 'Additional Notes',
    );
  }
}
