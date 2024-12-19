import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/OccupiedPropertyComponents/CommonComponents/common_screen_layout.dart';
import '../main_screen.dart';
import 'major_work_screen.dart';

class ExternalWorkScreen extends StatelessWidget {
  const ExternalWorkScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> externalWorkChecklistData = [
      {
        'title': 'New Front Entrance Room?',
        'selectedQuantity': 'Main',
        'selectedCost': 'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'New Frame to Entrance Room?',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'New Ironmongery to Front Door?',
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
        'title': 'New Rare Entrance Door?',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'New Frame to Rear Entrance Door?',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Balcony Clearance?',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Garden Waste-Vegetation Clearance?',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'Garden Waste-General Stones,Slabs',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
      {
        'title': 'FeatherFencing',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },      {
        'title': 'Close Boarded Fence Panels 1.8M X 1.8M',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },      {
        'title': 'Close Boarded Fence Panels1.8M X 1.2M',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },      {
        'title': 'New 6ft Wood Gate (Excluding Posts)?',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },      {
        'title': 'New 3ft Wood Gate (Excluding Posts)?',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },      {
        'title': 'New 3ft Metal Gate (Excluding Posts)?',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },      {
        'title': 'Renew Metal Post?',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },      {
        'title': 'Break Out Concrete?',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },{
        'title': 'Clean Gutters?',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },{
        'title': 'Renew Downpipes? ',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },{
        'title': 'Renew Gully Surround?',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },{
        'title': 'Renew Wooden Post?',
        'selectedQuantity': 'Main',
        'selectedCost':'Main',
        'quantityOptions': ['Main', 'Sub', 'Extra', 'Additional'],
        'costOptions': ['Main', 'Low', 'Medium', 'High'],
      },
    ];

    return CommonScreenLayout(
      appBarTitle: 'External Work',
      sectionTitle: 'External Checklist',
      checklistData: externalWorkChecklistData,
      totalCost: '700000',
      skipButton: (){
        Get.to(MajorWorkScreen());
      },
      submitButton:(){
        Get.to(MajorWorkScreen());
      },
      saveExit: (){
        Get.off(MainScreen());
      },
      textFieldHint1: 'Work Area',
      textFieldHint2: 'Additional Notes',
    );
  }
}
