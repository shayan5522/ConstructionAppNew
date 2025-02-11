import 'package:TotalSurvey/CustomDialogs/custom_dialogue.dart';
import 'package:TotalSurvey/CustomWidgets/custom_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../CustomWidgets/custom_buttons.dart';
import '../../CustomWidgets/custom_snackbar.dart';
import '../OccupiedPropertyScreens/opening_sheet_screen.dart';
import 'inspection_form.dart';

class InspectionScreen extends StatefulWidget {
  const InspectionScreen({super.key});

  @override
  State<InspectionScreen> createState() => _InspectionScreenState();
}

class _InspectionScreenState extends State<InspectionScreen> {
  String? selectedPropertyType;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CustomTextWidget(
                text: "What type of survey would you like to conduct?",
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              const SizedBox(height: 15),
              Center(
                child: CustomButton(
                  text: "Occupied Property",
                  onPressed: () {
                    if (user == null) {
                      customSnackBar(
                        context,
                        "Access Denied",
                        "You must be logged in to access the Profile screen.",
                      );
                    } else {
                      Get.to(OpeningSheetScreen());
                    }
                  },
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: CustomButton(
                  solidColor: Colors.white,
                  text: "Void Property",
                  onPressed: () {
                    Get.to(() => const InspectionFormScreen());
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Select Property Type",
                style: GoogleFonts.dmSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  for (String key in [
                    'Terraced',
                    'End Terrace',
                    'Free Hold',
                    'Flat',
                    'Maisonette',
                    'Bungalow',
                    'Other',
                  ])
                    RadioListTile<String>(
                      title: Text(key),
                      value: key,
                      groupValue: selectedPropertyType,
                      onChanged: (String? value) {
                        setState(() {
                          selectedPropertyType = value;
                        });
                      },
                      activeColor: Colors.teal,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

