import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseService {
  Future<void> saveChecklistData({
    required List<Map<String, dynamic>> checklistData,
    required String title,
    required String field1,
    required String field2,
    required double totalCost,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;

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
          .doc('gggdsgsvghsvghvcdghvcgdh')
          .set({});

      await FirebaseFirestore.instance
          .collection('OccupiedData')
          .doc('gggdsgsvghsvghvcdghvcgdh')
          .collection('Projects')
          .doc(title)
          .set({
            'checklistData': sanitizedData,
             "field1": field1,
             "field2": field2,
             "totalCost": totalCost,
          });
    } catch (e) {
      rethrow;
    }
  }
}
