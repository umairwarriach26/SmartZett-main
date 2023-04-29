import 'package:get/get.dart';
import '../../config/network/api_provider.dart';
import '../../models/user_model.dart';
import '../../services/local_storage.dart';

class AuthController extends GetxController with StateMixin {
  final prefrences = Get.find<LocalStorageService>();
  var obscured = true.obs;

  get showPassword => obscured.value;

  @override
  void onInit() {
    super.onInit();
    change(true, status: RxStatus.loading());
    checkUserSession();
  }

  void checkUserSession() {
    if (prefrences.user != null) {
      Future.delayed(const Duration(seconds: 5), () {
        Get.offAllNamed("/home");
      });
    } else {
      change(null, status: RxStatus.success());
    }
  }

  void refreshView() {
    // Set state to view
    change(null, status: RxStatus.success());
  }

  void login(String email, String password) async {
    try {
      // Set state to loading
      change(true, status: RxStatus.loading());

      var data = {"email": email, "password": password};

      var response = await ApiProvider().postRequest(data, "visa_login", "");

      if (response["status"] == true) {
        // Set state to success

        prefrences.user = User.fromJson(response["data"]);

        change(null, status: RxStatus.success());
        Get.snackbar("Success", "${response["message"]}");
        Get.offAllNamed("/home");
      } else {
        // Set state to error
        change(false, status: RxStatus.error(("${response["message"]}")));
        Get.snackbar("Error", "${response["message"]}");
      }
    } catch (error) {
      // Set state to error
      change(false, status: RxStatus.error("$error"));
      Get.snackbar("Error", "$error");
    }
  }

  void signup(String firstName, String lastName, String email, String phoneNo,
      String password) async {
    try {
      // Set state to loading
      change(true, status: RxStatus.loading());
      var data = {
        "first_name": firstName.trim(),
        "last_name": lastName.trim(),
        "email": email.trim(),
        "password": password.trim(),
        "phone": phoneNo.trim()
      };

      var response =
          await ApiProvider().postRequest(data, "visa_registration", "");

      if (response["status"] == true) {
        // Set state to success

        change(null, status: RxStatus.success());
        Get.snackbar("Success", "${response["message"]}");
        Get.offAllNamed("/login");
      } else {
        // Set state to error
        change(false, status: RxStatus.error(("${response["message"]}")));
        Get.snackbar("Error", "${response["message"]}");
      }
    } catch (error) {
      // Set state to error
      change(false, status: RxStatus.error("$error"));
      Get.snackbar("Error", "$error");
    }
  }
}
