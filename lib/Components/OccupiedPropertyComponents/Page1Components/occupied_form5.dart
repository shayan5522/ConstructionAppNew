import 'package:constructionapp/CustomWidgets/custom_checkboxes.dart';
import 'package:constructionapp/CustomWidgets/custom_form_field.dart';
import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../Controllers/checkbox_controller.dart';

class OccupiedForm5 extends StatelessWidget {
  const OccupiedForm5({super.key});

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
                      const CustomTextFormField(
                          hint: 'Number of Door',
                          label: 'Front Door',
                      ),
                      const SizedBox(height: 10,),
                      const CustomTextFormField(
                        hint: 'Number of Locks',
                        label: 'Other Locks',
                      ),
                      const SizedBox(height: 10,),
                      const CustomTextFormField(
                        hint: ' Enter FOB',
                        label: 'FOB',
                      ),
                      const SizedBox(height: 10,),
                      const CustomTextWidget(
                        text:  "Steel Grills",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      Row(
                        children: [
                          CustomCheckboxes(label: "Yes",controller: CheckboxController(),),
                          CustomCheckboxes(label: "No",controller: CheckboxController(),),
                          CustomCheckboxes(label: "N/A",controller: CheckboxController(),),
                        ],
                      ),
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
