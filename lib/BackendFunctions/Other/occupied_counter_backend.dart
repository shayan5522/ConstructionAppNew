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
      mainDocs.clear();
      pendingProjectsCount.value = 0;
      completedProjectsCount.value = 0;

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
        mainDocs.add({
          'mainDocId': mainDocId,
          'mainDocData': mainDoc.data(),
          'subDocCount': subDocCount,
        });

        if (subDocCount < 11) {
          pendingProjectsCount.value += 1;
        } else {
          completedProjectsCount.value += 1;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch documents: $e');
    }
  }
}
