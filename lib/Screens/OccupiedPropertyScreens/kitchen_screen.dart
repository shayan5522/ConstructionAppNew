import 'package:TotalSurvey/BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import 'package:TotalSurvey/BackendFunctions/OccupiedBackend/other_screen.dart';
import 'package:TotalSurvey/Controllers/total_cost_controller.dart';
import 'package:TotalSurvey/CustomWidgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../BackendFunctions/OccupiedBackend/adding_image.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import '../../Controllers/check_list_controller.dart';
import '../../Controllers/currencey_controller.dart';
import '../../CustomDialogs/custom_progress_idicator_page.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../main_screen.dart';
import 'lovenge_screen.dart';

class KitchenScreen extends StatelessWidget {
  KitchenScreen({super.key});
  final FirebaseService _firebaseService = new FirebaseService();
  final ImageUploadController _imageUploadController = Get.put(ImageUploadController());
  final OpeningSheetFormController _openingSheetFormController = Get.put(OpeningSheetFormController());
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> kitchenChecklistData = [
      {'title': 'Redecoration?',},
      {'title': 'Plastering To Wall/Ceiling',},
      {'title': 'Remove Fixtures And Fittings?',},
      {'title': 'New 0.5HR Fire Door ?',},
      {'title': 'New Ply Flush Door To Cupboard?',},
      {'title': 'New Perko Closer ?',},
      {'title': 'New Fire Strips ?',},
      {'title': 'New Door Furniture?',},
      {'title': 'Ease And Adjust Door?',},
      {'title': 'Renew Skirting ?',},
      {'title': 'Window Restrictors ?',},
      {'title': 'Renew Double Glazed Panel ?',},
      {'title': 'Ease And Adjust Window ?',},

    ];
    final ChecklistController checklistController = Get.put(ChecklistController());
    final TotalCostController totalCostController = Get.put(TotalCostController());
    final TextEditingController field1Controller = TextEditingController();
    final TextEditingController field2Controller = TextEditingController();
    final CurrencyController currencyController = Get.put(CurrencyController());

    List<TextEditingController> costControllers = List.generate(
      kitchenChecklistData.length, (_) => TextEditingController(),
    );
    List<TextEditingController> quantityControllers = List.generate(
      kitchenChecklistData.length, (_) => TextEditingController(),
    );

    for (int i = 0; i < kitchenChecklistData.length; i++) {
      costControllers[i].addListener(() {
        totalCostController.updateTotalCost(costControllers, quantityControllers);
      });
      quantityControllers[i].addListener(() {
        totalCostController.updateTotalCost(costControllers, quantityControllers);
      });
    }
    return  CommonScreenLayout(
      appBarTitle: 'Kitchen',
      sectionTitle: 'Kitchen Section',
      checklistData: kitchenChecklistData.map((item) {
        final int index = kitchenChecklistData.indexOf(item);
        return {
          ...item,
          'costController': costControllers[index],
          'quantityController': quantityControllers[index],
        };
      }).toList(),
      totalCost: Obx((){
        return CustomTextWidget(
            text: 'Total Cost : ${totalCostController.totalCost.value.toStringAsFixed(2)}',
            fontSize: 18,
            fontWeight: FontWeight.w600
        );
      }),
      submitButton: () async {
        bool isValid = true;
        List<Map<String, dynamic>> finalData = [];

        for (int i = 0; i < kitchenChecklistData.length; i++) {
          if (costControllers[i].text.isEmpty || quantityControllers[i].text.isEmpty) {
            isValid = false;
            break;
          }
          final data = {
            'title': kitchenChecklistData[i]['title'],
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
            title: 'Kitchen Screen',
            field1: field1Controller.text,
            field2: field2Controller.text,
            totalCost: totalCostController.totalCost.value,
            imageUrls: _imageUploadController.publicUrls,
          );
          await _imageUploadController.uploadImages(_openingSheetFormController.projectName.text);
          Get.to(() => const ProgressIndicatorPage(message: 'Data submitted successfully!'));
          await Future.delayed(const Duration(seconds: 2));
          Get.to(LoungeScreen());
        } catch (e) {
          Get.back();
          customSnackBar(context, 'Error', 'Failed to submit data. Please try again.');
        }
      },
      skipButton: () {
        Get.to(LoungeScreen());
      },
      saveExit: () async {
        bool isValid = true;
        List<Map<String, dynamic>> finalData = [];

        for (int i = 0; i < kitchenChecklistData.length; i++) {
          if (costControllers[i].text.isEmpty || quantityControllers[i].text.isEmpty) {
            isValid = false;
            break;
          }
          final data = {
            'title': kitchenChecklistData[i]['title'],
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
            title: 'Kitchen Screen',
            field1: field1Controller.text,
            field2: field2Controller.text,
            totalCost: totalCostController.totalCost.value,
            imageUrls: _imageUploadController.publicUrls,
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
