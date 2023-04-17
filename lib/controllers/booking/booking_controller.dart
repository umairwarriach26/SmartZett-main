import 'package:get/get.dart';
import 'package:smartzett/models/booking_model.dart';
import 'package:smartzett/models/price_model.dart';
import '../../config/network/api_provider.dart';
import '../../services/local_storage.dart';

class BookingController extends GetxController with StateMixin<PriceModel> {
  final prefrences = Get.find<LocalStorageService>();

  var booking = BookingModel(
          package: "1",
          ageGroup: "1",
          packageDuration: "30 Days",
          processDuration: "1")
      .obs;

  var currentStep = 0.obs;
  var subStep = 0.obs;

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void refreshView() {
    change(null, status: RxStatus.success());
  }

  void setCountryCode(String value) =>
      booking.update((val) => val!.countryCode = value);

  void setNationality(String value) =>
      booking.update((val) => val!.nationality = value);

  void setPackage(String value) =>
      booking.update((val) => val!.package = value);

  void setPackageDuration(String value) =>
      booking.update((val) => val!.packageDuration = value);

  void setProcessDuration(String value) =>
      booking.update((val) => val!.processDuration = value);

  void setAgeGroup(String value) =>
      booking.update((val) => val!.ageGroup = value);

  void setFullName(String value) =>
      booking.update((val) => val!.fullName = value);

  void setDOB(String value) => booking.update((val) => val!.dob = value);

  void setPassportNo(String value) =>
      booking.update((val) => val!.passportNo = value);

  void setEmail(String value) => booking.update((val) => val!.email = value);

  void setPhoneNo(String value) =>
      booking.update((val) => val!.phoneNo = value);

  void setProfile(String value) =>
      booking.update((val) => val!.profiePhoto = value);

  void setPassport(String value) =>
      booking.update((val) => val!.passportPhoto = value);

  get countryCode => booking.value.countryCode ?? "";

  get nationality => booking.value.nationality ?? "";

  get package => booking.value.package ?? "";

  get packageDuration => booking.value.packageDuration ?? "";

  get processDuration => booking.value.processDuration ?? "";

  get ageGroup => booking.value.ageGroup ?? "";

  get profileImage => booking.value.profiePhoto ?? "";

  get passportImage => booking.value.passportPhoto ?? "";

  get fullName => booking.value.fullName ?? "";

  get dob => booking.value.dob ?? "";

  get passportNO => booking.value.passportNo ?? "";

  get phoneNo => booking.value.phoneNo ?? "";
  get email => booking.value.email ?? "";

  void goToForm(int index) => currentStep.value = index;

  void getUpdatedPrice() async {
    try {
      // Set state to loading
      change(null, status: RxStatus.loading());
      var data = {
        "visa_type_id": package,
        "visa_package_duration": packageDuration,
        //"visa_processing_duration": processDuration
        "age_group": ageGroup
      };

      var response = await ApiProvider().postRequest(
          data, "visa_fee_calculation_api", prefrences.user!.token);

      //  if (response) {
      // Set state to success
      change(PriceModel.fromJson(response), status: RxStatus.success());
      // Get.snackbar("Success", "${response["message"]}");
      goToForm(2);
      // } else {
      //   // Set state to error
      //   change(null, status: RxStatus.error(("${response["message"]}")));
      //   Get.snackbar("Error", "${response["message"]}");
      // }
    } catch (error) {
      // Set state to error
      change(null, status: RxStatus.error("$error"));
      Get.snackbar("Error", "$error");
    }
  }

  void bookVisa() async {
    try {
      // Set state to loading
      change(null, status: RxStatus.loading());
      var data = {
        "visa_type_id": package,
        "visa_package_duration": packageDuration,
        "visa_processing_duration": processDuration,
        "age_group": ageGroup,
        "visa_fee": "100",
        "processing_fee": "50",
        "processing_fee_vat": "5",
        "full_english_name": fullName,
        "date_of_birth": dob,
        "passport_number": passportNO,
        "outside_uae_phone": phoneNo,
        "outside_uae_country_code": countryCode,
        "email": email,
        "user_id": prefrences.user!.userId,
        "profile_image": "data:image/png;base64,$profileImage",
        "passport_image": "data:image/png;base64,$passportImage"
      };

      var response = await ApiProvider()
          .postRequest(data, "visa_apply_api", prefrences.user!.token);

      if (response["status"] == true) {
        // Set state to success

        change(null, status: RxStatus.success());
        Get.snackbar("Success", "${response["message"]}");
        Get.offAndToNamed("/mybookings");
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
