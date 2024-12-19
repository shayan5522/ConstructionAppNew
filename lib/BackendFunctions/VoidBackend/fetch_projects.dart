import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<List<Map<String, dynamic>>> fetchUserProjects() async {
  try {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("User not logged in.");
    }

    // Retrieve the user's firstName from Firestore
    final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    if (!userDoc.exists) {
      throw Exception("User document not found.");
    }

    final String firstName = userDoc['firstName'];

    // Fetch all projects from the subcollection
    final querySnapshot = await FirebaseFirestore.instance
        .collection('VoidProperty')
        .doc(firstName)
        .collection('Projects')
        .orderBy('createdAt', descending: true) // Sort by newest first
        .get();

    // Convert the query results into a list of project maps
    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      data['projectId'] = doc.id; // Include the document ID
      return data;
    }).toList();
  } catch (e) {
    Get.snackbar("Error", "Failed to fetch projects: $e");
    return [];
  }
}
