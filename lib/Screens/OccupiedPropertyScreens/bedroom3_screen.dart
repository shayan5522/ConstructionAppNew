import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import 'bedroom4_screen.dart';

class Bedroom3Screen extends StatelessWidget {
  const Bedroom3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> bedroom3ChecklistData = [
      {
        'title': 'Bedroom3 Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost': 'Main',
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
      {
        'title': 'Redecoration',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
    ];

    return CommonScreenLayout(
      appBarTitle: 'Bedroom 3',
      sectionTitle: 'Bedroom 3 Section',
      checklistData: bedroom3ChecklistData,
      totalCost: '380000',
      submitButton:(){
        Get.to(const Bedroom4Screen());
      },
      textFieldHint1: 'Width X Length',
      textFieldHint2: 'Additional Notes',
    );
  }
}
