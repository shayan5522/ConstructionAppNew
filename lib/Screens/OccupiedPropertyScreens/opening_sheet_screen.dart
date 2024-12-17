import 'package:constructionapp/Components/OccupiedPropertyComponents/Page1Components/occupied_form1.dart';
import 'package:constructionapp/Components/OccupiedPropertyComponents/Page1Components/occupied_form2.dart';
import 'package:constructionapp/Components/OccupiedPropertyComponents/Page1Components/occupied_form3.dart';
import 'package:constructionapp/Components/OccupiedPropertyComponents/Page1Components/occupied_form4.dart';
import 'package:constructionapp/Components/OccupiedPropertyComponents/Page1Components/occupied_form5.dart';
import 'package:constructionapp/Components/OccupiedPropertyComponents/Page1Components/occupied_form6.dart';
import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:constructionapp/Screens/OccupiedPropertyScreens/kitchen_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/occupied_submit_buttons.dart';

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
            const OccupiedForm3(),
            const OccupiedForm4(),
            const OccupiedForm5(),
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
