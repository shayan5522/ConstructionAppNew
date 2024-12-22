import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../Controllers/image_box_controller.dart';

class ImageUploadController extends GetxController {
  var isLoading = false.obs;
  File? selectedImage1;
  File? selectedImage2;
  File? selectedImage3;
  var publicUrls = <String>[].obs;

  final ImageController imageController = Get.find<ImageController>();

  void assignImagesFromController() {
    if (imageController.images.isNotEmpty) {
      selectedImage1 = imageController.images.length > 0 ? imageController.images[0] : null;
      selectedImage2 = imageController.images.length > 1 ? imageController.images[1] : null;
      selectedImage3 = imageController.images.length > 2 ? imageController.images[2] : null;
      update();
    } else {
      Get.snackbar('Error', 'No images selected in ImageController');
    }
  }

  Future<void> uploadImages(String projectId) async {
    try {
      isLoading.value = true;

      final supabase = Supabase.instance.client;
      final images = {
        'image1': selectedImage1,
        'image2': selectedImage2,
        'image3': selectedImage3,
      };

      publicUrls.clear();
      for (var entry in images.entries) {
        final image = entry.value;
        if (image == null) continue;
        final fileName = '${entry.key}_${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}';

        final filePath = '${projectId}/$fileName';
        await supabase.storage.from('images').upload(filePath, image);

        final publicUrl = supabase.storage.from('images').getPublicUrl(filePath);
        publicUrls.add(publicUrl);
        print('Uploaded ${entry.key}: $publicUrl');
      }

      Get.snackbar('Success', 'All images uploaded successfully!');
    } catch (e) {
      Get.snackbar('Error', 'An error occurred during upload.');
    } finally {
      isLoading.value = false;
    }
  }
}
