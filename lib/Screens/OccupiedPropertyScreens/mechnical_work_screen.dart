import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import 'external_work_screen.dart';

class MechanicalElectricalScreen extends StatelessWidget {
  const MechanicalElectricalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> mechanicalElectricalChecklistData = [
      {
        'title': 'Electrical Wiring',
        'selectedQuantity': 'Main',
        'selectedCost': 'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      // Add more items as needed
    ];

    return CommonScreenLayout(
      appBarTitle: 'Mechanical & Electrical Work',
      sectionTitle: 'Mechanical and Electrical Work Section',
      checklistData: mechanicalElectricalChecklistData,
      totalCost: '600000',
      submitButton:(){
        Get.to(const ExternalWorkScreen());
      },
      textFieldHint1: 'Wiring Quantity',
      textFieldHint2: 'Additional Notes',
    );
  }
}
