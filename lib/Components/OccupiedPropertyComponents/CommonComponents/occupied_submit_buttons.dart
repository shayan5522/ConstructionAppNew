import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../CustomWidgets/custom_elevated_button.dart';
import '../../../Screens/main_screen.dart';

class OccupiedSubmitButtons extends StatelessWidget {
  final VoidCallback nextPage;
  final VoidCallback saveExist;
  const OccupiedSubmitButtons({super.key,required this.nextPage, required this.saveExist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomElevatedButton(
            text: 'Next',
            textColor: Colors.black,
            borderRadius: 40,
            icon: Icons.navigate_next,
            onPressed: nextPage,
            width: Get.width,
            height: 60,
            fontSize: 20,
            backgroundColor: const Color(0xFF3EE2D3),
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: CustomElevatedButton(
            text: 'Save & Exit',
            textColor: Colors.black,
            borderRadius: 40,
            onPressed: saveExist,
            width: Get.width,
            height: 60,
            fontSize: 20,
            backgroundColor: Colors.white,
          ),
        ),
        const SizedBox(height: 30,),
      ],
    );
  }
}
