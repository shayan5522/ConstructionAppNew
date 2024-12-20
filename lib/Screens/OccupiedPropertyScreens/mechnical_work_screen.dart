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
        'title': 'CP12,Boiler Commissioning,New Cooker Gas Supply?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost': 'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Boiler Only Renewal?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost': 'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Boiler Only Relocation To Different Room?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost': 'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Upgrade Main Water Supply For Comb Boiler?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost': 'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Renew Pipe Work?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost': 'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Renew Radiator ?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost': 'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Renew Radiator Valve?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost': 'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Renew Main Water Supply To Property?',
        'selectedQuantity': 'Main'.obs,
        'selectedCost': 'Main'.obs,
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
    ];

    final ChecklistController checklistController = Get.put(ChecklistController());
    final TextEditingController field1Controller = TextEditingController();
    final TextEditingController field2Controller = TextEditingController();

    return CommonScreenLayout(
      appBarTitle: 'Mechanical & Electrical Work',
      sectionTitle: 'Checklist',
      checklistData: mechanicalElectricalChecklistData,
      totalCost: '600000',
      skipButton: (){
        Get.to(const ExternalWorkScreen());
      },
      submitButton:(){},
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
