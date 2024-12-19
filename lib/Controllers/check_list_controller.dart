import 'package:get/get.dart';

class ChecklistController extends GetxController {
  var checklistItems = <Map<String, dynamic>>[].obs;

  void addChecklistItem(Map<String, dynamic> item) {
    checklistItems.add(item);
  }

  void updateRadioSelection(int index, String value) {
    checklistItems[index]['selectedRadio'] = value;
    update();
  }

  void updateQuantityAndCost(int index, String quantity, String cost) {
    checklistItems[index]['selectedQuantity'] = quantity;
    checklistItems[index]['selectedCost'] = cost;
    update();
  }
}
