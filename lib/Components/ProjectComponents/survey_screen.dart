import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

import '../../CustomWidgets/custom_form_field.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const CustomTextWidget(
         text:  'Survey Page',
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: "Project Details"),
              CustomTextFormField(hint: "Enter project name", label: "Project Name"),
              const SizedBox(height: 15),
              CustomTextFormField(
                  hint: "Enter unique property number", label: "UPRN"),
              const SizedBox(height: 15),
              CustomTextFormField(hint: "Enter address", label: "Address"),
              const SizedBox(height: 25),
              SectionTitle(title: "User Information"),
              CustomTextFormField(
                  hint: "Enter name", label: "Surveyor's Name"),
              const SizedBox(height: 15),
              CustomTextFormField(
                  hint: "Enter email / phone no", label: "Contact Details"),
              const SizedBox(height: 15),
              CustomTextFormField(
                  hint: "Property/Building Manager",
                  label: "Property/Building Manager"),
              const SizedBox(height: 25),
              SectionTitle(title: "Building Orientation"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent[100],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {},
                child: const CustomTextWidget(
                 text:  'Detect building orientation',
                      color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                hint: const CustomTextWidget(text: "Select Property Type"),
                items: ['Residential', 'Commercial', 'Industrial']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 25),
              SectionTitle(title: "Legislation and Regulations"),
              const CustomTextWidget(
                text: "Key Laws Related to Inspection",
                fontWeight: FontWeight.bold, fontSize: 14,
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.circle_outlined, color: Colors.grey),
                  SizedBox(width: 10),
                  CustomTextWidget(
                   text:  "Housing Act Guidelines for Social Housing",
                   fontSize: 12, color: Colors.black54,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.circle_outlined, color: Colors.grey),
                  SizedBox(width: 10),
                  CustomTextWidget(
                    text: "Brief Description with Clickable Links",
                    fontSize: 12, color: Colors.black54,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {},
                child: const CustomTextWidget(
                 text:  'Complete Survey Inspection',
                      color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: CustomTextWidget(
       text:  title, fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
    );
  }
}
