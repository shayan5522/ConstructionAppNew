import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TotalCostController extends GetxController {
  var totalCost = 0.0.obs;

  void updateTotalCost(List<TextEditingController> costControllers, List<TextEditingController> quantityControllers) {
    double total = 0.0;
    for (int i = 0; i < costControllers.length; i++) {
      double cost = double.tryParse(costControllers[i].text) ?? 0.0;
      double quantity = double.tryParse(quantityControllers[i].text) ?? 0.0;
      total += cost * quantity;
    }
    totalCost.value = total;
  }
}
// class TotalCostController extends GetxController {
//   var totalCost = 0.0.obs;
//
//   void updateTotalCost(List<TextEditingController> costControllers, List<TextEditingController> quantityControllers) {
//     double total = 0.0;
//     for (int i = 0; i < costControllers.length; i++) {
//       double cost = double.tryParse(costControllers[i].text) ?? 0.0;
//       double quantity = double.tryParse(quantityControllers[i].text) ?? 0.0;
//       total += cost * quantity;
//     }
//     totalCost.value = total;
//   }
// }
