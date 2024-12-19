import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import '../../../CustomWidgets/custom_radio_button.dart';
import '../../../CustomWidgets/custom_form_field.dart';
import '../../../CustomWidgets/custom_text_widget.dart';

class OccupiedForm5 extends StatelessWidget {
  OccupiedForm5({super.key});
  final OpeningSheetFormController _formController = Get.put(OpeningSheetFormController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(text: 'Large Scale',fontSize: 20,fontWeight: FontWeight.bold,),
          Card(
            color: const Color(0xFFF5F8F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                          hint: 'Number of Door',
                          label: 'Front Door',
                          controller:_formController.frontDoorController ,
                          type: TextInputType.number,
                      ),
                      const SizedBox(height: 10,),
                     CustomTextFormField(
                        hint: 'Number of Locks',
                        label: 'Other Locks',
                        controller: _formController.otherLocksController,
                        type: TextInputType.number,
                      ),
                      const SizedBox(height: 10,),
                      CustomTextFormField(
                        hint: ' Enter FOB',
                        label: 'FOB',
                        controller: _formController.fOBController,
                      ),
                      const SizedBox(height: 10,),
                      const CustomTextWidget(
                        text:  "Steel Grills",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                     Obx((){
                       return Row(
                         children: [
                           CustomRadioButton<String>(
                             value: "Yes",
                             groupValue: _formController.grill.value,
                             label: "Yes",
                             onChanged: (value) =>  _formController.grill.value = value!,
                             activeColor: Colors.green,
                           ),
                           const SizedBox(width: 16),
                           CustomRadioButton<String>(
                             value: "No",
                             groupValue:  _formController.grill.value,
                             label: "No",
                             onChanged: (value) =>  _formController.grill.value = value!,
                             activeColor: Colors.red,
                           ),
                           const SizedBox(width: 16),
                           CustomRadioButton<String>(
                             value: "N/A",
                             groupValue:  _formController.grill.value,
                             label: "N/A",
                             onChanged: (value) =>  _formController.grill.value = value!,
                             activeColor: Colors.blue,
                           ),
                         ],
                       );
                     }),
                      const SizedBox(height: 10,),
                    ],
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
