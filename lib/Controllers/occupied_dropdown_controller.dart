import 'package:get/get.dart';

class OccupiedCardController extends GetxController {
  var selectedQuantity = ''.obs;
  var selectedCost = ''.obs;

  @override
  void onInit() {
    super.onInit();
    selectedQuantity.value = '1';
    selectedCost.value = '10';
  }
}
