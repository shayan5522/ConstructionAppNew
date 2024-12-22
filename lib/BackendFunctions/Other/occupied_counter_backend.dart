import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DocumentController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var mainDocs = <Map<String, dynamic>>[].obs;
  var pendingProjectsCount = 0.obs;
  var completedProjectsCount = 0.obs;

  User? user = FirebaseAuth.instance.currentUser;

  Future<void> fetchDocuments() async {
    try {
      List<Map<String, dynamic>> tempDocs = [];
      int pendingCount = 0;
      int completedCount = 0;

      QuerySnapshot mainDocsSnapshot = await _firestore
          .collection('OccupiedData')
          .where('userid', isEqualTo: user!.uid)
          .get();

      for (var mainDoc in mainDocsSnapshot.docs) {
        String mainDocId = mainDoc.id;

        QuerySnapshot subDocsSnapshot = await _firestore
            .collection('OccupiedData')
            .doc(mainDocId)
            .collection('Projects')
            .get();

        int subDocCount = subDocsSnapshot.docs.length;

        tempDocs.add({
          'mainDocId': mainDocId,
          'mainDocData': mainDoc.data(),
          'subDocCount': subDocCount,
        });

        if (subDocCount < 11) {
          pendingCount += 1;
        } else {
          completedCount += 1;
        }
      }

      mainDocs.assignAll(tempDocs);
      pendingProjectsCount.value = pendingCount;
      completedProjectsCount.value = completedCount;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch documents: $e');
    }
  }

}
