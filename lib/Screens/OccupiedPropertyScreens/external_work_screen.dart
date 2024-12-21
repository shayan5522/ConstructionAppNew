import 'package:TotalSurvey/Screens/OccupiedPropertyScreens/bedroom1_screen.dart';
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
import 'major_work_screen.dart';

class ExternalWorkScreen extends StatelessWidget {
  ExternalWorkScreen({super.key});
  final FirebaseService _firebaseService = new FirebaseService();

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> externalWorkChecklistData =  [
      {'title': 'New Front Entrance Room?'},
      {'title': 'New Frame to Entrance Room?'},
      {'title': 'New Ironmongery to Front Door?'},
      {'title': 'Redecoration'},
      {'title': 'New Rare Entrance Door?'},
      {'title': 'New Frame to Rear Entrance Door?'},
      {'title': 'Balcony Clearance?'},
      {'title': 'Garden Waste-Vegetation Clearance?'},
      {'title': 'Garden Waste-General Stones,Slabs'},
      {'title': 'FeatherFencing'},
      {'title': 'Close Boarded Fence Panels 1.8M X 1.8M'},
      {'title': 'Close Boarded Fence Panels1.8M X 1.2M'},
      {'title': 'New 6ft Wood Gate (Excluding Posts)?'},
      {'title': 'New 3ft Wood Gate (Excluding Posts)?'},
      {'title': 'New 3ft Metal Gate (Excluding Posts)?'},
      {'title': 'Renew Metal Post?'},
      {'title': 'Break Out Concrete?'},
      {'title': 'Clean Gutters?'},
      {'title': 'Renew Downpipes? '},
      {'title': 'Renew Gully Surround?'},
      {'title': 'Renew Wooden Post?'},
    ];

    final ChecklistController checklistController = Get.put(ChecklistController());
    final TextEditingController field1Controller = TextEditingController();
    final TextEditingController field2Controller = TextEditingController();
    final TotalCostController totalCostController = Get.put(TotalCostController());

    List<TextEditingController> costControllers = List.generate(
      externalWorkChecklistData.length, (_) => TextEditingController(),
    );
    List<TextEditingController> quantityControllers = List.generate(
      externalWorkChecklistData.length, (_) => TextEditingController(),
    );

    for (int i = 0; i < externalWorkChecklistData.length; i++) {
      costControllers[i].addListener(() {
        totalCostController.updateTotalCost(costControllers, quantityControllers);
      });
      quantityControllers[i].addListener(() {
        totalCostController.updateTotalCost(costControllers, quantityControllers);
      });
    }

    return CommonScreenLayout(
      appBarTitle: 'External Work',
      sectionTitle: 'External Checklist',
      checklistData: externalWorkChecklistData.map((item){
      final int index = externalWorkChecklistData.indexOf(item);
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
        Get.to(MajorWorkScreen());
      },
      submitButton: () async {
        bool isValid = true;
        List<Map<String, dynamic>> finalData = [];

        for (int i = 0; i < externalWorkChecklistData.length; i++) {
          if (costControllers[i].text.isEmpty || quantityControllers[i].text.isEmpty) {
            isValid = false;
            break;
          }
          final data = {
            'title': externalWorkChecklistData[i]['title'],
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
            title: 'External Screen',
            field1: field1Controller.text,
            field2: field2Controller.text,
            totalCost: totalCostController.totalCost.value,
          );
          Get.to(() => const ProgressIndicatorPage(message: 'Data submitted successfully!'));
          await Future.delayed(const Duration(seconds: 2));
          Get.to(MajorWorkScreen());
        } catch (e) {
          Get.back();
          customSnackBar(context, 'Error', 'Failed to submit data. Please try again.');
        }
      },
      saveExit: (){
        Get.off(MainScreen());
      },
      textFieldHint1: 'Work Area',
      textFieldHint2: 'Additional Notes',
      field1Controller: field1Controller,
      field2Controller: field2Controller,
    );
  }
}
