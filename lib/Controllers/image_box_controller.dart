import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var images = <File>[].obs;
  Future<void> pickImage(int index) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (index < images.length) {
        images[index] = File(pickedFile.path);
      } else {
        images.add(File(pickedFile.path));
      }
    }
  }
  void removeImage(int index) {
    if (index < images.length) {
      images.removeAt(index);
    }
  }
}
