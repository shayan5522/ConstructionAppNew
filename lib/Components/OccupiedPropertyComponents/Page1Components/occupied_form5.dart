import 'package:constructionapp/CustomWidgets/custom_checkboxes.dart';
import 'package:constructionapp/CustomWidgets/custom_form_field.dart';
import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

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
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                          hint: 'Number of Door',
                          label: 'Front Door',
                      ),
                      SizedBox(height: 10,),
                      CustomTextFormField(
                        hint: 'Number of Locks',
                        label: 'Other Locks',
                      ),
                      SizedBox(height: 10,),
                      CustomTextFormField(
                        hint: ' Enter FOB',
                        label: 'FOB',
                      ),
                      SizedBox(height: 10,),
                      CustomTextWidget(
                        text:  "Steel Grills",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      Row(
                        children: [
                          CustomCheckboxes(label: "Yes",),
                          CustomCheckboxes(label: "No",),
                          CustomCheckboxes(label: "N/A",),
                        ],
                      ),
                      SizedBox(height: 10,),
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
