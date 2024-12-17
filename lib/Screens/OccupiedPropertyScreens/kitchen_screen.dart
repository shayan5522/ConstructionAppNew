import 'package:constructionapp/Components/OccupiedPropertyComponents/CommonComponents/occupied_custom_card.dart';
import 'package:constructionapp/Components/OccupiedPropertyComponents/CommonComponents/occupied_image_selector.dart';
import 'package:constructionapp/Components/OccupiedPropertyComponents/CommonComponents/occupied_submit_buttons.dart';
import 'package:constructionapp/Controllers/checkbox_controller.dart';
import 'package:constructionapp/Controllers/image_box_controller.dart';
import 'package:constructionapp/CustomWidgets/custom_checkboxes.dart';
import 'package:constructionapp/CustomWidgets/custom_form_field.dart';
import 'package:constructionapp/Screens/OccupiedPropertyScreens/lovenge_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import '../../CustomWidgets/custom_text_widget.dart';

class KitchenScreen extends StatelessWidget {
  const KitchenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> kitchenChecklistData = [
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
    ];

    return CommonScreenLayout(
      appBarTitle: 'Kitchen',
      sectionTitle: 'Kitchen Section',
      checklistData: kitchenChecklistData,
      totalCost: '548949',
      submitButton:(){
        Get.to(const LoungeScreen());
      },
      textFieldHint1: 'Width X Length',
      textFieldHint2: 'Additional Notes',
    );
  }
}
