import 'package:get/get.dart';
import 'package:smartzett/data/dtos/booking_dto.dart';
import 'package:smartzett/data/dtos/documents_dto.dart';
import 'package:smartzett/data/dtos/price_dto.dart';
import 'package:smartzett/data/models/document_filter_model.dart';
import '../../config/network/api_provider.dart';
import '../../services/local_storage.dart';

class BookingController extends GetxController with StateMixin {
  //**************************  finding the local stoarge service **************************
  final prefrences = Get.find<LocalStorageService>();

  //************************** Observeable Booking DTO class variable **************************
  var booking = BookingDTO(
          package: "single",
          packageDuration: "1",
          processDuration: "regular",
          ageGroup: "adult",
          visaRequestId: "0")
      .obs;

//************************** Observeable Price DTO Class variable **************************
  var price = PriceDTO(
          visaFee: "0", processingFee: "0", processingFeeVat: 0, totalFee: 0)
      .obs;

  //************************** Observeable Documnets DTO Class variable **************************
  var docs = DocumentsDTO().obs;

  //************************** Observeable Documnets DTO Class variable **************************
  var docFilter = DocumentFilter(passportImage: true, profileImage: true).obs;

//************************** Observeable Stepper INT variable **************************
  var currentStep = 0.obs;

//************************ On Init Method of controller class* ****************************
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

// ************************** refresh view method from error to normal **************************
  void refreshView() {
    change(null, status: RxStatus.success());
  }

//************************** SETTERS for Bookind DTO **************************
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
  void setPassportExpiry(String value) =>
      booking.update((val) => val!.passportExpiry = value);
  void setEmail(String value) => booking.update((val) => val!.email = value);
  void setPhoneNo(String value) =>
      booking.update((val) => val!.phoneNo = value);
  void setVisaRequestID(String value) =>
      booking.update((val) => val!.visaRequestId = value);

  //************************** GETTERS for Booking DTO **************************
  get countryCode => booking.value.countryCode ?? "";
  get nationality => booking.value.nationality ?? "";
  get package => booking.value.package ?? "";
  get packageCapital => booking.value.package!.toUpperCase();
  get packageDuration => booking.value.packageDuration ?? "";
  get packageDurationCoverted =>
      booking.value.packageDuration == "1" ? "30 Days" : "60 Days";
  get processDuration => booking.value.processDuration ?? "";
  get processDurationCapital => booking.value.processDuration!.toUpperCase();
  get ageGroup => booking.value.ageGroup ?? "";
  get ageGroupCapial => booking.value.ageGroup!.toUpperCase();
  get fullName => booking.value.fullName ?? "";
  get dob => booking.value.dob ?? "";
  get passportNo => booking.value.passportNo ?? "";
  get passportExpiry => booking.value.passportExpiry ?? "";
  get phoneNo => booking.value.phoneNo ?? "";
  get email => booking.value.email ?? "";
  get visaRequetId => booking.value.visaRequestId ?? "";

//************************** GETTERS for PRICE DTO **************************
  get visaFee => price.value.visaFee ?? "0";
  get processingFee => price.value.processingFee ?? "0";
  get processingFeeVat => price.value.processingFeeVat ?? 0;
  get totalFee => price.value.totalFee ?? 0;

//************************** SETTERS for Documnets DTO **************************

  void setPassportImage(SingleFile value) =>
      docs.update((val) => val!.passportImage = value);
  void setPassportProfile(SingleFile value) =>
      docs.update((val) => val!.passportProfileImage = value);
  void setNationalID(SingleFile value) =>
      docs.update((val) => val!.nationalID = value);
  void setRelativePassport(SingleFile value) =>
      docs.update((val) => val!.relativePassportDoc = value);
  void setRelativeVisa(SingleFile value) =>
      docs.update((val) => val!.realtiveVisaDoc = value);
  void setAllPassportPages(List<SingleFile> value) =>
      docs.update((val) => val!.allPassportPages = value);
  void setAllStatementPages(List<SingleFile> value) =>
      docs.update((val) => val!.allStatementPages = value);
  void setAllSuppliments(List<SingleFile> value) =>
      docs.update((val) => val!.supplimentDocuments = value);
//************************** Remove from Documnets DTO **************************
  void removePassportPages(SingleFile value) =>
      docs.update((val) => val!.allPassportPages!.remove(value));
  void removeStatementPages(SingleFile value) =>
      docs.update((val) => val!.allStatementPages!.remove(value));
  void removeSuppliments(SingleFile value) =>
      docs.update((val) => val!.supplimentDocuments!.remove(value));
  void removePassportImage() => docs.update((val) => val!.passportImage =
      SingleFile(prefix: "", base64File: "", fileName: "", type: "", path: ""));
  void removeProfileImage() => docs.update((val) => val!.passportProfileImage =
      SingleFile(prefix: "", base64File: "", fileName: "", type: "", path: ""));
  void removeNationalId() => docs.update((val) => val!.nationalID =
      SingleFile(prefix: "", base64File: "", fileName: "", type: "", path: ""));
  void removeRelativePassport() => docs.update((val) => val!
          .relativePassportDoc =
      SingleFile(prefix: "", base64File: "", fileName: "", type: "", path: ""));
  void removeRelativeVisa() => docs.update((val) => val!.realtiveVisaDoc =
      SingleFile(prefix: "", base64File: "", fileName: "", type: "", path: ""));

//************************** GETTERS for Documnets DTO **************************

  SingleFile get passportImage =>
      docs.value.passportImage ??
      SingleFile(prefix: "", base64File: "", fileName: "", type: "", path: "");
  SingleFile get profileImage =>
      docs.value.passportProfileImage ??
      SingleFile(prefix: "", base64File: "", fileName: "", type: "", path: "");
  SingleFile get nationalID =>
      docs.value.nationalID ??
      SingleFile(prefix: "", base64File: "", fileName: "", type: "", path: "");
  SingleFile get relativePassport =>
      docs.value.relativePassportDoc ??
      SingleFile(prefix: "", base64File: "", fileName: "", type: "", path: "");
  SingleFile get relativeVisa =>
      docs.value.realtiveVisaDoc ??
      SingleFile(prefix: "", base64File: "", fileName: "", type: "", path: "");
  List<SingleFile> get allPassportPages => docs.value.allPassportPages ?? [];
  List<SingleFile> get allStatementPages => docs.value.allStatementPages ?? [];
  List<SingleFile> get allSupplimnets => docs.value.supplimentDocuments ?? [];

  //************************** GETTERS for Documnets DTO **************************

  bool get showPassport => docFilter.value.passportImage ?? false;
  bool get showProfile => docFilter.value.profileImage ?? false;
  bool get showNationalId => docFilter.value.nationalId ?? false;
  bool get showRelativePassport => docFilter.value.relativePassport ?? false;
  bool get showRelativeVisa => docFilter.value.relativeVisa ?? false;
  bool get showAllPassport => docFilter.value.allPassportPages ?? false;
  bool get showAllBankStatement =>
      docFilter.value.allBankStatementPages ?? false;
  bool get showAdditionalDocs => docFilter.value.additionalDocuments ?? false;

//************************** Method to change current form Stepper **************************
  void goToForm(int index) => currentStep.value = index;

//************************** Method to get updated price based on selection filter **************************
  void getUpdatedPrice() async {
    try {
      // Set state to loading
      change(null, status: RxStatus.loading());
      var data = {
        "entry_type": package,
        "visa_type_id": packageDuration,
        "visa_processing_duration": processDuration,
        "age_group": ageGroup,
        "user_id": prefrences.user!.userId
      };

      var response = await ApiProvider().postRequest(
          data, "visa_fee_calculation_api", prefrences.user!.token);

      if (response["status"] == true) {
        // Set state to success

        price.value = PriceDTO.fromJson(response["data"]);

        change(null, status: RxStatus.success());
        // Get.snackbar("Success", "${response["message"]}");
        goToForm(2);
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

//************************** Method to create or update visa details **************************
  void bookVisa() async {
    try {
      // Set state to loading
      change(null, status: RxStatus.loading());
      List<String> allPassPages = [];
      List<String> allStatPages = [];
      List<String> allAdditPages = [];
      if (allPassportPages.isNotEmpty) {
        for (var item in allPassportPages) {
          allPassPages.add("${item.prefix},${item.base64File}");
        }
      }
      if (allStatementPages.isNotEmpty) {
        for (var item in allStatementPages) {
          allStatPages.add("${item.prefix},${item.base64File}");
        }
      }
      if (allSupplimnets.isNotEmpty) {
        for (var item in allSupplimnets) {
          allAdditPages.add("${item.prefix},${item.base64File}");
        }
      }
      var data = {
        "entry_type": package,
        "visa_type_id": packageDuration,
        "visa_processing_duration": processDuration,
        "age_group": ageGroup,
        "visa_fee": visaFee,
        "processing_fee": processingFee,
        "processing_fee_vat": processingFeeVat,
        "full_english_name": fullName,
        "date_of_birth": dob,
        "passport_number": passportNo,
        "outside_uae_phone": phoneNo,
        "outside_uae_country_code": countryCode,
        "email": email,
        "user_id": prefrences.user!.userId,
        "passport_expiry_date": passportExpiry,
        "visa_request_id": visaRequetId,
        "profile_image": "${profileImage.prefix},${profileImage.base64File}",
        "passport_image": "${passportImage.prefix},${passportImage.base64File}",
        "national_id": "${nationalID.prefix},${nationalID.base64File}",
        "all_passportPages": allPassPages,
        "all_bankStatementPages": allStatPages,
        "additional_documents": allAdditPages
      };

      var response = await ApiProvider()
          .postRequest(data, "visa_apply_api", prefrences.user!.token);

      if (response["status"] == true) {
        // Set state to success

        change(null, status: RxStatus.success());
        Get.snackbar("Success", "${response["message"]}");
        // Get.offAndToNamed("/mybookings");
        setVisaRequestID((response["insert_id"]).toString());
        goToForm(6);
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
