import 'package:get/get.dart';
import '../../config/network/api_provider.dart';
import '../../models/mybooking_model.dart';
import '../../services/local_storage.dart';

class MyBookingController extends GetxController
    with StateMixin<List<MyBookingModel>> {
  final prefrences = Get.find<LocalStorageService>();

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    getVisasList();
    super.onInit();
  }

  void refreshView() {
    change(null, status: RxStatus.loading());
    getVisasList();
  }

  void getVisasList() async {
    try {
      // Set state to loading
      change(null, status: RxStatus.loading());
      var data = {
        "user_id": prefrences.user!.userId,
      };

      var response = await ApiProvider()
          .postRequest(data, "visa_request_list", prefrences.user!.token);

      if (response["status"] == true) {
        // Set state to success
        var body = response["data"] as List;
        List<MyBookingModel> list =
            body.map((tagJson) => MyBookingModel.fromJson(tagJson)).toList();

        change(list, status: RxStatus.success());
        // Get.snackbar("Success", "${response["message"]}");
      } else {
        // Set state to error
        change(null, status: RxStatus.error(("${response["message"]}")));
        Get.snackbar("Error", "${response["message"]}");
      }
    } catch (error) {
      // Set state to error
      change(null, status: RxStatus.error("$error"));
      Get.snackbar("Error", "$error");
    }
  }
}
