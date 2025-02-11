import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../BackendFunctions/OccupiedBackend/adding_image.dart';
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
import 'hallway_screen.dart';

class LoungeScreen extends StatelessWidget {
  LoungeScreen({super.key});
  final FirebaseService _firebaseService = new FirebaseService();
  final ImageUploadController _imageUploadController = Get.put(ImageUploadController());
  final OpeningSheetFormController _openingSheetFormController = Get.put(OpeningSheetFormController());
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> loungeChecklistData = [
      {'title': 'New bath?'},
      {'title': 'New Basin?'},
      {'title': 'New bath/Basin taps?'},
      {'title': 'Renew plug and chain?'},
      {'title': 'New WC?'},
      {'title': 'New Cistern?'},
      {'title': 'New toilet pan?'},
      {'title': 'New wall tiles?'},
      {'title': 'Mastic/Sealants?'},
      {
        'title': 'New vinyl floor and threshold strip?',
        'quantityIcon':Padding(
          padding: EdgeInsets.only(top: 8),
          child: CustomTextWidget(text: 'LM',fontWeight: FontWeight.bold,fontSize: 16,),
        ),
      },
      {
        'title': 'Wallpaper removal?',
        'quantityIcon':Padding(
          padding: EdgeInsets.only(top: 8),
          child: CustomTextWidget(text: 'M2',fontWeight: FontWeight.bold,fontSize: 16,),
        ),
      },
      {
        'title': 'Redecoration?',
        'quantityIcon':Padding(
          padding: EdgeInsets.only(top: 8),
          child: CustomTextWidget(text: 'Item',fontWeight: FontWeight.bold,fontSize: 16,),
        ),
      },
      {'title': 'Plastering to wall/ceiling?'},
      {'title': 'Remove fixture and fittings?'},
      {'title': 'New 0.5HR fire door?'},
      {'title': 'New ply flush door to cupboard?'},
      {'title': 'New door furniture?'},
      {'title': 'Ease and adjust door?'},
      {'title': 'Renew skirting?'},
      {'title': 'Window restrictions?'},
      {'title': 'Renew double glazed panel?'},
      {'title': 'Ease and adjust window?'},
    ];

    final ChecklistController checklistController = Get.put(ChecklistController());
    final TextEditingController field1Controller = TextEditingController();
    final TextEditingController field2Controller = TextEditingController();
    final TotalCostController totalCostController = Get.put(TotalCostController());
    final CurrencyController currencyController = Get.put(CurrencyController());

    List<TextEditingController> costControllers = List.generate(
      loungeChecklistData.length,
          (_) => TextEditingController(),
    );

    List<TextEditingController> quantityControllers = List.generate(
      loungeChecklistData.length,
          (_) => TextEditingController(),
    );

    for (int i = 0; i < loungeChecklistData.length; i++) {
      costControllers[i].addListener(() {
        totalCostController.updateTotalCost(costControllers, quantityControllers);
      });
      quantityControllers[i].addListener(() {
        totalCostController.updateTotalCost(costControllers, quantityControllers);
      });
    }

    return CommonScreenLayout(
      appBarTitle: 'Lounge',
      sectionTitle: 'Lounge Section',
      checklistData: loungeChecklistData.map((item) {
        final index = loungeChecklistData.indexOf(item);
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
      skipButton: () {
        Get.to(const HallwayScreen());
      },
      submitButton: () async {
        bool isValid = true;
        List<Map<String, dynamic>> finalData = [];

        for (int i = 0; i < loungeChecklistData.length; i++) {
          if (costControllers[i].text.isEmpty || quantityControllers[i].text.isEmpty) {
            isValid = false;
            break;
          }
          final data = {
            'title': loungeChecklistData[i]['title'],
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
            title: 'Lounge Screen',
            field1: field1Controller.text,
            field2: field2Controller.text,
            totalCost: totalCostController.totalCost.value,
            imageUrls: _imageUploadController.publicUrls,
          );
          _imageUploadController.uploadImages(_openingSheetFormController.projectName.text);
          Get.to(() => const ProgressIndicatorPage(message: 'Data submitted successfully!'));
          await Future.delayed(const Duration(seconds: 2));
          Get.to(HallwayScreen());
        } catch (e) {
          Get.back();
          customSnackBar(context, 'Error', 'Failed to submit data. Please try again.');
        }
      },
      saveExit: () async {
        bool isValid = true;
        List<Map<String, dynamic>> finalData = [];

        for (int i = 0; i < loungeChecklistData.length; i++) {
          if (costControllers[i].text.isEmpty || quantityControllers[i].text.isEmpty) {
            isValid = false;
            break;
          }
          final data = {
            'title': loungeChecklistData[i]['title'],
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
            title: 'Lounge Screen',
            field1: field1Controller.text,
            field2: field2Controller.text,
            totalCost: totalCostController.totalCost.value,
            imageUrls: _imageUploadController.publicUrls,
          );
          _imageUploadController.uploadImages(_openingSheetFormController.projectName.text);
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
