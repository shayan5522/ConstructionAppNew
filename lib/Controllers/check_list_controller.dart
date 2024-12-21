import 'package:get/get.dart';

class ChecklistController extends GetxController {
  final checklistState = [].obs;

  void initializeChecklist(List<Map<String, dynamic>> checklistData) {
    checklistState.assignAll(
      checklistData.map((data) {
        return {
          'title': data['title'],
          'costController': data['costController'],
          'quantityController': data['quantityController'],
          'selectedRadio': 'Yes'.obs,
        };
      }).toList(),
    );
  }
}
