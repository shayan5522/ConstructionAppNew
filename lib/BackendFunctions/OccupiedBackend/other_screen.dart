import 'package:TotalSurvey/BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseService {
  User? user = FirebaseAuth.instance.currentUser;
  final OpeningSheetFormController _formController =  Get.put(OpeningSheetFormController());
  Future<void> saveChecklistData({
    required List<Map<String, dynamic>> checklistData,
    required String title,
    required String field1,
    required String field2,
    required double totalCost,
    required List<String> imageUrls,
  }) async {
    // if (user == null) {
    //   throw Exception("No user is logged in");
    // }

    try {
      List<Map<String, dynamic>> sanitizedData = checklistData.map((item) {
        return item.map((key, value) {
          if (value is RxString) {
            return MapEntry(key, value.value);
          }
          return MapEntry(key, value);
        });
      }).toList();

      await FirebaseFirestore.instance
          .collection('OccupiedData')
          .doc(_formController.projectName.text)
          .set({
             'userid':user!.uid,
            'projectName':_formController.projectName.text,
            });

      await FirebaseFirestore.instance
          .collection('OccupiedData')
          .doc(_formController.projectName.text)
          .collection('Projects')
          .doc(title)
          .set({
            'checklistData': sanitizedData,
             "field1": field1,
             "field2": field2,
             "totalCost": totalCost,
             "ImageUrls":imageUrls,
          });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveMajorListData({
    required String title,
    required String field1,
    required String field2,
    required List<String> Data,
}) async{

    // if (user == null) {
    //   throw Exception("No user is logged in");
    // }

    try {
      await FirebaseFirestore.instance
          .collection('OccupiedData')
          .doc(_formController.projectName.text)
          .set({
           'userid':user!.uid,
            'projectName':_formController.projectName.text,
           });

      await FirebaseFirestore.instance
          .collection('OccupiedData')
          .doc(_formController.projectName.text)
          .collection('Projects')
          .doc(title)
          .set({
           'checkedPoints': Data,
           "Estimated Project Value": field1,
           "Checked Produce By": field2,
      });
    } catch (e) {
      rethrow;
    }
  }
}
