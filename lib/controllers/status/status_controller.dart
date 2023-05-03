import 'package:get/get.dart';
import '../../config/network/api_provider.dart';
import '../../data/models/status_model.dart';
import '../../services/local_storage.dart';

class StatusController extends GetxController with StateMixin {
  final prefrences = Get.find<LocalStorageService>();
  var statusModel = StatusModel().obs;

  StatusModel get model => statusModel.value;

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void refreshView() {
    change(null, status: RxStatus.success());
  }

  void getVisaStatus(String referenceNo) async {
    try {
      // Set state to loading
      change(null, status: RxStatus.loading());
      var data = {
        "user_id": prefrences.user!.userId,
        "reference_number": referenceNo
      };

      var response = await ApiProvider()
          .postRequest(data, "visa_status", prefrences.user!.token);

      if (response["status"] == true) {
        // Set state to success
        var body = response["data"];
        statusModel.value = StatusModel.fromJson(body);
        change(statusModel.value, status: RxStatus.success());
      } else {
        // Set state to error
        if (response["code"] == 200) {
          change(null, status: RxStatus.empty());
        } else {
          change(null, status: RxStatus.error(("${response["message"]}")));
        }
      }
    } catch (error) {
      // Set state to error
      change(null, status: RxStatus.error("$error"));
      Get.snackbar("Error", "$error");
    }
  }
}
