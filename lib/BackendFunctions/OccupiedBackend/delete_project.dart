import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DeleteProjectController extends GetxController {
  var isLoading = false.obs;

  Future<void> deleteOccupiedProject({required String projectId, required String userId}) async {
    isLoading.value = true;
    try {
      final mainCollection = FirebaseFirestore.instance.collection('OccupiedData');
      final querySnapshot = await mainCollection
          .where('userid', isEqualTo: userId)
          .where(FieldPath.documentId, isEqualTo: projectId)
          .get();

      if (querySnapshot.docs.isEmpty) {
        Get.snackbar("Error", "No matching project found.");
        return;
      }

      final projectRef = querySnapshot.docs.first.reference;

      final subDocsSnapshot = await projectRef.collection('Projects').get();

      for (var subDoc in subDocsSnapshot.docs) {
        await projectRef.collection('Projects').doc(subDoc.id).delete();
      }

      await projectRef.delete();

      Get.snackbar("Success", "Project deleted successfully!");
    } catch (error) {
      Get.snackbar("Error", "Failed to delete project: $error");
      print("Failed to delete project: $error");
    } finally {
      isLoading.value = false;
    }
  }
}
