import 'package:TotalSurvey/Screens/OccupiedPropertyScreens/external_work_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../BackendFunctions/OccupiedBackend/other_screen.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import '../../Controllers/check_list_controller.dart';
import '../../Controllers/total_cost_controller.dart';
import '../../CustomDialogs/custom_progress_idicator_page.dart';
import '../../CustomWidgets/custom_snackbar.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../main_screen.dart';
import 'bedroom1_screen.dart';

class HallwayScreen extends StatelessWidget {
  const HallwayScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final FirebaseService _firebaseService = new FirebaseService();

    List<Map<String, dynamic>> hallwayChecklistData = [
      {'title': 'Strip out floor covering?',},
      {'title': 'Mastic/Sealants?',},
      {'title': 'New vinyl floor and threshold strip?',},
      {'title': 'Wallpaper removal?'},
      {'title': 'Redecoration?',},
      {'title': 'Plastering to walls/Ceilings?',},
      {'title': 'Remove fixature and fittings?',},
      {'title': 'New 0.5HR fire door?',},
      {'title': 'New ply flush door to cupboard?',},
      {'title': 'New door furniture?',},
      {'title': 'Ease and adjust door?',},
      {'title': 'Renew skirting?',},
      {'title': 'Window Repairs?',},
      {'title': 'Renew double glazed panel?',},
      {'title': 'Ease and adjust window?',},
    ];

    final ChecklistController checklistController = Get.put(ChecklistController());
    final TextEditingController field1Controller = TextEditingController();
    final TextEditingController field2Controller = TextEditingController();
    final TotalCostController totalCostController = Get.put(TotalCostController());

    List<TextEditingController> costControllers = List.generate(
      hallwayChecklistData.length, (_) => TextEditingController(),
    );
    List<TextEditingController> quantityControllers = List.generate(
      hallwayChecklistData.length, (_) => TextEditingController(),
    );

    for (int i = 0; i < hallwayChecklistData.length; i++) {
      costControllers[i].addListener(() {
        totalCostController.updateTotalCost(costControllers, quantityControllers);
      });
      quantityControllers[i].addListener(() {
        totalCostController.updateTotalCost(costControllers, quantityControllers);
      });
    }
    return CommonScreenLayout(
      appBarTitle: 'Hallway',
      sectionTitle: 'HALL STAIRS & LANDING Measurements',
      checklistData: hallwayChecklistData.map((item){
        final int index = hallwayChecklistData.indexOf(item);
        return {
          ...item,
          'costController': costControllers[index],
          'quantityController': quantityControllers[index],
        };
      }).toList(),
      totalCost:Obx((){
        return CustomTextWidget(
            text: 'Total Cost : ${totalCostController.totalCost.value.toStringAsFixed(2)}',
            fontSize: 18,
            fontWeight: FontWeight.w600
        );
      }),
      skipButton: (){
        Get.to(Bedroom1Screen());
      },
      submitButton: () async {
        bool isValid = true;
        List<Map<String, dynamic>> finalData = [];

        for (int i = 0; i < hallwayChecklistData.length; i++) {
          if (costControllers[i].text.isEmpty || quantityControllers[i].text.isEmpty) {
            isValid = false;
            break;
          }
          final data = {
            'title': hallwayChecklistData[i]['title'],
            'selectedRadio': checklistController.checklistState[i]['selectedRadio'] ?? null,
            'cost': costControllers[i].text,
            'quantity': quantityControllers[i].text,
          };
          finalData.add(data);
        }
        if (!isValid) {
          customSnackBar(context, 'Missing Data', 'Please fill in all the fields before submitting.');
          return;
        }
        if (field1Controller.text.isEmpty || field2Controller.text.isEmpty) {
          customSnackBar(context, 'Missing Notes', 'Please enter additional notes and dimensions.');
          return;
        }
        Get.to(() => const ProgressIndicatorPage(message: 'Submitting your data...'));
        try {
          await _firebaseService.saveChecklistData(
            checklistData: finalData,
            title: 'Hallway Screen',
            field1: field1Controller.text,
            field2: field2Controller.text,
            totalCost: totalCostController.totalCost.value,
          );
          Get.to(() => const ProgressIndicatorPage(message: 'Data submitted successfully!'));
          await Future.delayed(const Duration(seconds: 2));
          Get.to(Bedroom1Screen());
        } catch (e) {
          Get.back();
          customSnackBar(context, 'Error', 'Failed to submit data. Please try again.');
        }
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
