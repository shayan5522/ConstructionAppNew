import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DocumentController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var mainDocs = <Map<String, dynamic>>[].obs;
  User? user = FirebaseAuth.instance.currentUser;
  Future<void> fetchDocuments() async {
    try {
      mainDocs.clear();
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

        mainDocs.add({
          'mainDocId': mainDocId,
          'mainDocData': mainDoc.data(),
          'subDocCount': subDocsSnapshot.docs.length,
        });
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch documents: $e');
    }
  }

  int getSubDocCount(String mainDocId) {
    var doc = mainDocs.firstWhere(
          (doc) => doc['mainDocId'] == mainDocId,
      orElse: () => {},
    );
    return doc.isNotEmpty ? doc['subDocCount'] : 0;
  }
}
