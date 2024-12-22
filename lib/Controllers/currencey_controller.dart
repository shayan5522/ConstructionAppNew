import 'package:get/get.dart';

class CurrencyController extends GetxController {
  var selectedCurrency = 'Dollar'.obs;

  void updateCurrency(String currency) {
    selectedCurrency.value = currency;
  }
}
