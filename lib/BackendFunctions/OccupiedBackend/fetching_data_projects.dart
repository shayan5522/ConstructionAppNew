import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OccupiedProjectFetchingController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  Stream<List<DocumentSnapshot>> fetchUserDocs() {
    return _firestore
        .collection('OccupiedData')
        .where('userid', isEqualTo: 'gggdsgsvghsvghvcdghvcgdh')
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }

  /// Fetches sub-documents from the `Projects` sub-collection.
  Stream<List<Map<String, dynamic>>> fetchSubDocs(String docId) {
    return _firestore
        .collection('OccupiedData')
        .doc(docId)
        .collection('Projects')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => {'id': doc.id, ...doc.data()})
        .toList());
  }
}
