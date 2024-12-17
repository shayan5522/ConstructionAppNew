import 'package:constructionapp/Components/OccupiedPropertyComponents/Page1Components/occupied_form1.dart';
import 'package:constructionapp/Components/OccupiedPropertyComponents/Page1Components/occupied_form2.dart';
import 'package:constructionapp/Components/OccupiedPropertyComponents/Page1Components/occupied_form3.dart';
import 'package:constructionapp/Components/OccupiedPropertyComponents/Page1Components/occupied_form4.dart';
import 'package:constructionapp/Components/OccupiedPropertyComponents/Page1Components/occupied_form5.dart';
import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class OpeningSheetScreen extends StatelessWidget {
  const OpeningSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            OccupiedForm1(),
            OccupiedForm2(),
            OccupiedForm3(),
            OccupiedForm4(),
            OccupiedForm5(),
          ],
        ),
      ),
    );
  }
}
