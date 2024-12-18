import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/occupied_submit_buttons.dart';
import '../../Components/OccupiedPropertyComponents/Page1Components/occupied_form1.dart';
import '../../Components/OccupiedPropertyComponents/Page1Components/occupied_form2.dart';
import '../../Components/OccupiedPropertyComponents/Page1Components/occupied_form3.dart';
import '../../Components/OccupiedPropertyComponents/Page1Components/occupied_form4.dart';
import '../../Components/OccupiedPropertyComponents/Page1Components/occupied_form5.dart';
import '../../Components/OccupiedPropertyComponents/Page1Components/occupied_form6.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import 'kitchen_screen.dart';

class OpeningSheetScreen extends StatelessWidget {
  const OpeningSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white70,
        title: const CustomTextWidget(text: 'Opening Sheet',fontSize: 20,),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.edit),
          ),
          IconButton(
              onPressed: (){},
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
            const OccupiedForm6(),
            const SizedBox(height: 50,),
            OccupiedSubmitButtons(
                nextPage:(){
                  Get.to(const KitchenScreen());
                }),
          ],
        ),
      ),
    );
  }
}
