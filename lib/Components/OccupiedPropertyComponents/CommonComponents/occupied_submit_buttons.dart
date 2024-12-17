import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../CustomWidgets/custom_elevated_button.dart';
import '../../../Screens/main_screen.dart';

class OccupiedSubmitButtons extends StatelessWidget {
  final VoidCallback nextPage ;
  const OccupiedSubmitButtons({super.key,required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: CustomElevatedButton(
            text: 'Next',
            textColor: Colors.black,
            borderRadius: 40,
            icon: Icons.navigate_next,
            onPressed: nextPage,
            width: Get.width*1/2,
            height: 60,
            fontSize: 20,
            backgroundColor: Colors.tealAccent,
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: CustomElevatedButton(
            text: 'Save & Exits',
            textColor: Colors.black,
            borderRadius: 40,
            onPressed: (){
              Get.off(MainScreen());
            },
            width: Get.width*1/2,
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
