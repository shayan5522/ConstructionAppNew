import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DeleteProjectController extends GetxController {
  var isLoading = false.obs;

  Future<void> deleteOccupiedProject({required String projectId}) async {
    isLoading.value = true;
    try {
      // Reference the document directly by its document ID
      final docRef = FirebaseFirestore.instance
          .collection('OccupiedData')
          .doc(projectId);

      // Check if the document exists
      final docSnapshot = await docRef.get();
      if (!docSnapshot.exists) {
        Get.snackbar("Error", "No matching project found.");
        return;
      }

      // Delete the document
      await docRef.delete();

      Get.snackbar("Success", "Project deleted successfully!");
    } catch (error) {
      Get.snackbar("Error", "Failed to delete project: $error");
      print("Failed to delete project: $error");
    } finally {
      isLoading.value = false;
    }
  }
}
