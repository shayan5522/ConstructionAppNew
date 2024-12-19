import 'package:get/get.dart';

class LoadingController extends GetxController{
  RxBool isLoading = false.obs;

  void startLoading(value) {
    isLoading.value = value ;
  }
}