import 'package:constructionapp/Screens/OccupiedPropertyScreens/external_work_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import '../main_screen.dart';

class MechanicalElectricalScreen extends StatelessWidget {
  MechanicalElectricalScreen({super.key});
  final OpeningSheetFormController _formController = Get.put(OpeningSheetFormController());
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
    ];

    return CommonScreenLayout(
      appBarTitle: 'Mechanical & Electrical Work',
      sectionTitle: 'Mechanical and Electrical Work Section',
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
      selectedRadio: 'yes'.obs,
      textFieldHint1: 'Wiring Quantity',
      textFieldHint2: 'Additional Notes',
    );
  }
}
