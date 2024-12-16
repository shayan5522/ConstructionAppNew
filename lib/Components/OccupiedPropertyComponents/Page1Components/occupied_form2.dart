import 'package:constructionapp/CustomWidgets/custom_form_field.dart';
import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import '../../../CustomWidgets/custom_checkboxes.dart';

class OccupiedForm2 extends StatefulWidget {
  const OccupiedForm2({super.key});

  @override
  State<OccupiedForm2> createState() => _OccupiedForm2State();
}

class _OccupiedForm2State extends State<OccupiedForm2> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text:  "Details",
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          Card(
            color: const Color(0xFFF5F8F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    CustomTextFormField(label: "Void / occupied Address",hint:  "Enter Address"),
                    SizedBox(height: 16),
                    CustomTextFormField(label: "Date",hint:  "DD/MM/YY"),
                    SizedBox(height: 16),
                    CustomTextFormField(label: "Target program",hint:  "Enter Target program"),
                    SizedBox(height: 16),
                    CustomTextFormField(label: "Asbestos survey",hint:  "Enter Asbestos survey"),
                    SizedBox(height: 16),
                    CustomTextFormField(label: "EPC Required",hint:  "Enter EPC Required"),
                    SizedBox(height: 16),
                    CustomTextWidget(
                     text:  "PIR",
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
                    SizedBox(height: 16),
                    CustomTextFormField(label: "Gas test",hint:  "Enter Gas test"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
