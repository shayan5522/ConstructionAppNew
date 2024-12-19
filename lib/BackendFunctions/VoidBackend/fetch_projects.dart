import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<List<Map<String, dynamic>>> fetchUserProjects() async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    print('user is: $user');

    if (user == null) {
      throw Exception("User not logged in.");
    }

    final querySnapshot = await FirebaseFirestore.instance
        .collection('VoidProperty')
        .doc(user.uid)
        .collection('Projects')
        .get();

    print('Number of projects fetched: ${querySnapshot.docs.length}');

    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      data['projectId'] = doc.id;
      return data;
    }).toList();
  } catch (e) {
    Get.snackbar("Error", "Failed to fetch projects: $e");
    return [];
  }
}



