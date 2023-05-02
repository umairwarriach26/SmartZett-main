import 'package:get/get.dart';

import '../../config/network/api_provider.dart';
import '../../data/user_model.dart';
import '../../services/local_storage.dart';

class ProfileController extends GetxController with StateMixin<User> {
  final prefrences = Get.find<LocalStorageService>();
  var userModel = User().obs;

  get firstName => userModel.value.firstName;
  get lastName => userModel.value.lastName;
  get email => userModel.value.email;
  get phone => userModel.value.phone;

  @override
  void onInit() {
    // change(null, status: RxStatus.loading());
    super.onInit();
  }

  void refreshView() {
    change(null, status: RxStatus.loading());
    getUserProfile();
  }

  void getUserProfile() async {
    try {
      // Set state to loading
      change(null, status: RxStatus.loading());
      var data = {
        "user_id": prefrences.user!.userId,
      };

      var response = await ApiProvider()
          .postRequest(data, "user_details_api", prefrences.user!.token);

      if (response["status"] == true) {
        var body = response["data"];
        userModel.value = User.fromJson(body);
        // Set state to success
        change(userModel.value, status: RxStatus.success());
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
