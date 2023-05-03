import 'package:get/get.dart';
import 'package:smartzett/controllers/status/status_controller.dart';

class StatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusController>(() => StatusController());
  }
}
