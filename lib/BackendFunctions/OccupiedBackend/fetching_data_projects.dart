import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OccupiedProjectFetchingController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  var mainDocNames = <String>[].obs;
  var mainDocsData = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  void fetchData() async {
    isLoading.value = true;

    try {
      QuerySnapshot mainDocsSnapshot = await _firestore
          .collection('OccupiedData')
          .where('userid', isEqualTo: user!.uid)
          .get();

      mainDocNames.clear();
      mainDocsData.clear();

      for (var doc in mainDocsSnapshot.docs) {
        String docId = doc.id;
        mainDocNames.add(docId);
        mainDocsData.add(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}