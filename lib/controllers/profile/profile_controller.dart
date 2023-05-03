import 'package:get/get.dart';
import 'package:smartzett/ui/widgets/loading_dialog.dart';

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

  void updateUserProfile(
      String firstName, String lastName, String email, String phone) async {
    try {
      // Set state to loading
      Get.dialog(const LoadingDialog(message: "Updating..."));
      var data = {
        "first_name": firstName.trim(),
        "last_name": lastName.trim(),
        "email": email.trim(),
        "phone": phone.trim(),
        "user_id": prefrences.user!.userId,
      };

      var response = await ApiProvider()
          .postRequest(data, "user_profile_update", prefrences.user!.token);

      if (response["status"] == true) {
        // Set state to success
        var body = response["data"];
        userModel.update((val) {
          val = User.fromJson(body);
        });
        Get.back();
        Get.snackbar("Success", "${response["message"]}");
      } else {
        // Set state to error
        Get.back();
        Get.snackbar("Error", "${response["message"]}");
      }
    } catch (error) {
      // Set state to error
      Get.back();
      Get.snackbar("Error", "$error");
    }
  }
}
