import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var selectedLabels = <String, bool>{}.obs;

  void toggleCheckbox(String label) {
    if (selectedLabels.containsKey(label)) {
      selectedLabels[label] = !(selectedLabels[label] ?? false);
    } else {
      selectedLabels[label] = true;
    }
  }

  bool isChecked(String label) {
    return selectedLabels[label] ?? false;
  }
}
