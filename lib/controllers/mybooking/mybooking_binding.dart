import 'package:get/get.dart';

import 'mybooking_controller.dart';

class StatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyBookingController>(() => MyBookingController());
  }
}
