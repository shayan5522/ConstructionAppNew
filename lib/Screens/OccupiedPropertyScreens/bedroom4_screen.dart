import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import '../../BackendFunctions/OccupiedBackend/other_screen.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import '../../Controllers/check_list_controller.dart';
import '../../Controllers/currencey_controller.dart';
import '../../Controllers/total_cost_controller.dart';
import '../../CustomDialogs/custom_progress_idicator_page.dart';
import '../../CustomWidgets/custom_snackbar.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../main_screen.dart';
import 'mechnical_work_screen.dart';

class Bedroom4Screen extends StatelessWidget {
  Bedroom4Screen({super.key});
  final FirebaseService _firebaseService = new FirebaseService();
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> bedroom4ChecklistData = [
      {'title': 'Strip Out Floor Covering ?',},
      {'title': 'Mastic / Sealants?',},
      {'title': 'New Vinyl Floor And Threshold? ',},
      {'title': 'Wallpaper Removal?',},
      {'title': 'Plastering to Wall / Ceiling?',},
      {'title': 'New 0.5 HR fire door?',},
      {'title': 'New Ply Flush Door to Cupboard?',},
      {'title': 'New Door Furniture?',},
      {'title': 'Ease And Adjust Door?',},
      {'title': 'Renew Skirting ?',},
      {'title': 'Window Restricts?',},
    ];

    final ChecklistController checklistController = Get.put(ChecklistController());
    final TextEditingController field1Controller = TextEditingController();
    final TextEditingController field2Controller = TextEditingController();
    final TotalCostController totalCostController = Get.put(TotalCostController());
    final CurrencyController currencyController = Get.put(CurrencyController());

    List<TextEditingController> costControllers = List.generate(
      bedroom4ChecklistData.length, (_) => TextEditingController(),
    );
    List<TextEditingController> quantityControllers = List.generate(
      bedroom4ChecklistData.length, (_) => TextEditingController(),
    );

    for (int i = 0; i < bedroom4ChecklistData.length; i++) {
      costControllers[i].addListener(() {
        totalCostController.updateTotalCost(costControllers, quantityControllers);
      });
      quantityControllers[i].addListener(() {
        totalCostController.updateTotalCost(costControllers, quantityControllers);
      });
    }
    return CommonScreenLayout(
      appBarTitle: 'Bedroom 4',
      sectionTitle: 'Bedroom 4 Measurements',
      checklistData: bedroom4ChecklistData.map((item){
        final int index = bedroom4ChecklistData.indexOf(item);
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
        Get.to(MechanicalElectricalScreen());
      },
      submitButton: () async {
        bool isValid = true;
        List<Map<String, dynamic>> finalData = [];

        for (int i = 0; i < bedroom4ChecklistData.length; i++) {
          if (costControllers[i].text.isEmpty || quantityControllers[i].text.isEmpty) {
            isValid = false;
            break;
          }
          final data = {
            'title': bedroom4ChecklistData[i]['title'],
            'selectedRadio': checklistController.checklistState[i]['selectedRadio'] ?? null,
            'cost': costControllers[i].text,
            'quantity': quantityControllers[i].text,
            'Currency':currencyController.selectedCurrency.value,
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
            title: 'Bedroom 4',
            field1: field1Controller.text,
            field2: field2Controller.text,
            totalCost: totalCostController.totalCost.value,
          );
          Get.to(() => const ProgressIndicatorPage(message: 'Data submitted successfully!'));
          await Future.delayed(const Duration(seconds: 2));
          Get.to(MechanicalElectricalScreen());
        } catch (e) {
          Get.back();
          customSnackBar(context, 'Error', 'Failed to submit data. Please try again.');
        }
      },
      saveExit: () async {
        bool isValid = true;
        List<Map<String, dynamic>> finalData = [];

        for (int i = 0; i < bedroom4ChecklistData.length; i++) {
          if (costControllers[i].text.isEmpty || quantityControllers[i].text.isEmpty) {
            isValid = false;
            break;
          }
          final data = {
            'title': bedroom4ChecklistData[i]['title'],
            'selectedRadio': checklistController.checklistState[i]['selectedRadio'] ?? null,
            'cost': costControllers[i].text,
            'quantity': quantityControllers[i].text,
            'Currency':currencyController.selectedCurrency.value,
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
            title: 'Bedroom 4',
            field1: field1Controller.text,
            field2: field2Controller.text,
            totalCost: totalCostController.totalCost.value,
          );
          Get.to(() => const ProgressIndicatorPage(message: 'Data submitted successfully!'));
          await Future.delayed(const Duration(seconds: 2));
          Get.to(MainScreen());
        } catch (e) {
          Get.back();
          customSnackBar(context, 'Error', 'Failed to submit data. Please try again.');
        }
      },
      textFieldHint1: 'Width X Length',
      textFieldHint2: 'Additional Notes',
      field1Controller: field1Controller,
      field2Controller: field2Controller,
    );
  }
}
