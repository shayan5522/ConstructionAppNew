import 'package:TotalSurvey/Screens/BottomBarScreens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProjectDetailsController extends GetxController {
  var projectName = ''.obs;
  var uprn = ''.obs;
  var address = ''.obs;

  var surveyorName = ''.obs;
  var contactDetails = ''.obs;
  var propertyManager = ''.obs;

  var selectedPropertyType = ''.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void setPropertyType(String value) {
    selectedPropertyType.value = value;
  }

  Future<void> saveProjectDetails() async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        Get.snackbar("Error", "User not logged in.");
        return;
      }

      final userDoc = await _firestore.collection('users').doc(user.uid).get();

      if (!userDoc.exists) {
        Get.snackbar("Error", "User information not found.");
        return;
      }

      final String firstName = userDoc.data()?['firstName'] ?? 'Unknown';

      final Map<String, dynamic> projectDetails = {
        'userId': user.uid,
        'projectName': projectName.value,
        'uprn': uprn.value,
        'address': address.value,
        'surveyorName': surveyorName.value,
        'contactDetails': contactDetails.value,
        'propertyManager': propertyManager.value,
        'propertyType': selectedPropertyType.value,
      };

      await _firestore.collection('VoidProperty').doc(user.uid).collection('Projects').add(projectDetails);

      Get.snackbar("Success", "Project details saved successfully!");
      Get.to(()=>const HomeScreen());
      resetForm();
    } catch (e) {
      Get.snackbar("Error", "Failed to save project details: $e");
    }
  }
  void resetForm() {
    projectName.value = '';
    uprn.value = '';
    address.value = '';
    surveyorName.value = '';
    contactDetails.value = '';
    propertyManager.value = '';
    selectedPropertyType.value = '';
  }

  void completeSurveyInspection() async {
    if (projectName.value.isEmpty || uprn.value.isEmpty || address.value.isEmpty) {
      Get.snackbar("Error", "Please fill all required fields!");
      return;
    }

    await saveProjectDetails();
  }
}
