import 'package:get/get.dart';
import '../../config/network/api_provider.dart';
import '../../data/models/mybooking_model.dart';
import '../../services/local_storage.dart';

class MyBookingController extends GetxController with StateMixin {
  final prefrences = Get.find<LocalStorageService>();
  List<MyBookingModel> list = [];

  List<MyBookingModel> get bookingList => list;

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
      change(false, status: RxStatus.loading());
      var data = {
        "user_id": prefrences.user!.userId,
      };

      var response = await ApiProvider()
          .postRequest(data, "visa_request_list", prefrences.user!.token);

      if (response["status"] == true) {
        // Set state to success
        var body = response["data"] as List;
        list = body.map((tagJson) => MyBookingModel.fromJson(tagJson)).toList();
        change(true, status: RxStatus.success());

        // Get.snackbar("Success", "${response["message"]}");
      } else {
        // Set state to error
        if (response["code"] == 200) {
          change(false, status: RxStatus.empty());
        } else {
          change(false, status: RxStatus.error(("${response["message"]}")));
        }

        Get.snackbar("Error", "${response["message"]}");
      }
    } catch (error) {
      // Set state to error
      change(false, status: RxStatus.error("$error"));
      Get.snackbar("Error", "$error");
    }
  }
}
