import 'package:TotalSurvey/BackendFunctions/notification_backend.dart';
import 'package:TotalSurvey/CustomWidgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/occupied_submit_buttons.dart';
import '../../Components/OccupiedPropertyComponents/Page1Components/occupied_form1.dart';
import '../../Components/OccupiedPropertyComponents/Page1Components/occupied_form2.dart';
import '../../Components/OccupiedPropertyComponents/Page1Components/occupied_form3.dart';
import '../../Components/OccupiedPropertyComponents/Page1Components/occupied_form4.dart';
import '../../Components/OccupiedPropertyComponents/Page1Components/occupied_form5.dart';
import '../../Components/OccupiedPropertyComponents/Page1Components/occupied_form6.dart';
import '../../Controllers/loading_controller.dart';
import '../../CustomWidgets/custom_snackbar.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import 'kitchen_screen.dart';

class OpeningSheetScreen extends StatelessWidget {
  OpeningSheetScreen({super.key});
  final OpeningSheetFormController _formController = Get.put(OpeningSheetFormController());
  final LoadingController _loadingController = Get.put(LoadingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white70,
        title: const CustomTextWidget(
          text: 'Opening Sheet',
          fontSize: 20,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OccupiedForm1(),
            const OccupiedForm2(),
            OccupiedForm3(),
            const OccupiedForm4(),
            OccupiedForm5(),
            OccupiedForm6(),
            const SizedBox(
              height: 50,
            ),
            Obx(() {
              return _loadingController.isLoading.value
                  ? const CircularProgressIndicator()
                  :
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                        text: "Next",
                        onPressed: ()async{
                          _loadingController.startLoading(true);
                          try {
                            await _formController.saveFormDataToDatabase();
                            await addNotification(
                                title: 'Project Created',
                                message: '${_formController.projectName} Project Created Successfully',
                            );
                            Get.to(KitchenScreen());
                          } catch (e) {
                            customSnackBar(context, 'Error', '$e');
                          } finally {
                            _loadingController.startLoading(false);
                          }
                        }
                    ),
                  );

              OccupiedSubmitButtons(

                  nextPage: () async {
                      _loadingController.startLoading(true);
                      try {
                        await _formController.saveFormDataToDatabase();
                        Get.to(KitchenScreen());
                      } catch (e) {
                        customSnackBar(context, 'Error', '$e');
                      } finally {
                        _loadingController.startLoading(false);
                      }
                    },
                  saveExist: () async {
                      _loadingController.startLoading(true);
                      try {
                        await _formController.saveFormDataToDatabase();
                        Get.to(KitchenScreen());
                      } catch (e) {
                        customSnackBar(context, 'Error', '$e');
                      } finally {
                        _loadingController.startLoading(false);
                      }
                    });
            }),
          ],
        ),
      ),
    );
  }
}
