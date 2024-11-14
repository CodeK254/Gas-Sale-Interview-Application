import 'dart:async';

import 'package:get/get.dart';

class LoadingViewModel extends GetxController{
  void countdown() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed('/home');
  }

  @override
  void onInit() {
    countdown();
    super.onInit();
  }
}