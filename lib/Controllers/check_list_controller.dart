import 'package:get/get.dart';

class ChecklistController extends GetxController {
  final checklistState = [].obs;

  void initializeChecklist(List<Map<String, dynamic>> checklistData) {
    checklistState.assignAll(
      checklistData.map((data) {
        return {
          'title': data['title'],
          'selectedQuantity': data['selectedQuantity'],
          'selectedCost': data['selectedCost'],
          'selectedRadio': 'Yes'.obs,
        };
      }).toList(),
    );
  }
}
