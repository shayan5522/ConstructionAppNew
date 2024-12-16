import 'package:constructionapp/Components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'inspection_form.dart';

class InspectionScreen extends StatelessWidget {
  const InspectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("What type of survey would you like to conduct?",
              style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            ),
            const SizedBox(height: 15,),
            CustomButton(
                text: "Occupied Property",
                onPressed: (){
                  const Text('tyyab bi');
                }
            ),
            const SizedBox(height: 10,),
            CustomButton(
                text: "Void Property",
                onPressed: (){
                  Get.to(()=>const InspectionFormScreen());
                }
            ),
          ],
        ),
      ),
    );
  }
}
