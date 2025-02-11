import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpeningSheetFormController extends GetxController {
  // Form 1: Client Information
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController principalContractorController = TextEditingController();
  final TextEditingController contractController = TextEditingController();
  final TextEditingController projectName = TextEditingController();

  // Form 2: Occupied Details
  final TextEditingController occupiedAddressController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController targetProgramController = TextEditingController();
  final TextEditingController epcRequiredController = TextEditingController();
  var pir = ''.obs;
  var absoluteSurvey = ''.obs;
  final TextEditingController gasTestController = TextEditingController();

  // Form 3: Utility Readings
  final TextEditingController electricLocationController = TextEditingController();
  final TextEditingController electricReadingController = TextEditingController();
  final TextEditingController gasLocationController = TextEditingController();
  final TextEditingController gasReadingController = TextEditingController();
  final TextEditingController waterLocationController = TextEditingController();
  final TextEditingController waterReadingController = TextEditingController();

  // Form 4: Description & Photo
  final TextEditingController descriptionController = TextEditingController();
  var photoPath = ''.obs;

  // Form 5: Security Features
  final TextEditingController frontDoorController = TextEditingController();
  final TextEditingController BackDoorController = TextEditingController();
  final TextEditingController otherDoorsOrGatesController = TextEditingController();
  final TextEditingController fOBController = TextEditingController();
  var grill = ''.obs;

  // Form 6: Additional Checkboxes
  var  loftWorksCheckboxes = <String>[].obs;
  var ProjectName = ''.obs;

  Future<void> saveFormDataToDatabase() async {
    ProjectName.value = projectName.text;
    try {
      final formData = {
        "clientName": clientNameController.text,
        "projectName": projectName.text,
        "principalContractor": principalContractorController.text,
        "contract": contractController.text,
        "occupiedAddress": occupiedAddressController.text,
        "date": dateController.text,
        "targetProgram": targetProgramController.text,
        "asbestosSurvey": absoluteSurvey.value,
        "epcRequired": epcRequiredController.text,
        "pir": pir.value,
        "gasTest": gasTestController.text,
        "electricLocation": electricLocationController.text,
        "electricReading": electricReadingController.text,
        "gasLocation": gasLocationController.text,
        "gasReading": gasReadingController.text,
        "waterLocation": waterLocationController.text,
        "waterReading": waterReadingController.text,
        "description": descriptionController.text,
        "photoPath": photoPath.value,
        "frontDoor": frontDoorController.text,
        "BackDoor": BackDoorController.text,
        "otherDoorsOrGates": otherDoorsOrGatesController.text,
        "FOB": fOBController.text,
        "steelGrills": grill.value,
        "additionalChecks": loftWorksCheckboxes,
      };
      User? user = FirebaseAuth.instance.currentUser;
      if(projectName.value == ''){
         Get.snackbar('Error', "Project Name cannot be null",backgroundColor: Colors.red,snackPosition: SnackPosition.TOP);
      } else {
        await FirebaseFirestore.instance.
        collection('OccupiedData')
            .doc(projectName.text)
            .set({
          'userid':user!.uid,
          'projectName':projectName.text,
        });

        await FirebaseFirestore.instance.
        collection('OccupiedData')
            .doc(projectName.text)
            .collection('Projects')
            .doc('OpeningSheet')
            .set(formData);
      }
    } catch (e) {
      print("Error saving form data: $e");
    }
  }
}
