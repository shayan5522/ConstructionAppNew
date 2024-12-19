import 'package:get/get.dart';

class LoftWorksController extends GetxController {
  var loftWorksItems = <Map<String, String>>[].obs;

  void addItem(String title, String description) {
    loftWorksItems.add({'title': title, 'description': description});
  }
}
