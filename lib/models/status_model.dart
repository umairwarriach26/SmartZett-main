class StatusModel {
  String? id;
  String? referenceNo;
  String? referenceName;
  String? visaTypeId;
  String? fullEnglishName;
  String? dateOfBirth;
  String? email;
  String? passportNumber;
  String? outsideUaeDiallingCode;
  String? outsideUaeResidenceCountryTelephone;
  String? userId;
  String? visaFee;
  String? serviceFee;
  String? serviceFeeVat;
  String? totalFee;
  String? visaStatusId;
  String? passportImage;
  String? profileImage;
  String? visaStatusName;

  StatusModel(
      {this.id,
      this.referenceNo,
      this.referenceName,
      this.visaTypeId,
      this.fullEnglishName,
      this.dateOfBirth,
      this.email,
      this.passportNumber,
      this.outsideUaeDiallingCode,
      this.outsideUaeResidenceCountryTelephone,
      this.userId,
      this.visaFee,
      this.serviceFee,
      this.serviceFeeVat,
      this.totalFee,
      this.visaStatusId,
      this.passportImage,
      this.profileImage,
      this.visaStatusName});

  StatusModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["reference_no"] is String) {
      referenceNo = json["reference_no"];
    }
    if (json["reference_name"] is String) {
      referenceName = json["reference_name"];
    }
    if (json["visa_type_id"] is String) {
      visaTypeId = json["visa_type_id"];
    }
    if (json["full_english_name"] is String) {
      fullEnglishName = json["full_english_name"];
    }
    if (json["date_of_birth"] is String) {
      dateOfBirth = json["date_of_birth"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["passport_number"] is String) {
      passportNumber = json["passport_number"];
    }
    if (json["outside_uae_dialling_code"] is String) {
      outsideUaeDiallingCode = json["outside_uae_dialling_code"];
    }
    if (json["outside_uae_residence_country_telephone"] is String) {
      outsideUaeResidenceCountryTelephone =
          json["outside_uae_residence_country_telephone"];
    }

    if (json["user_id"] is String) {
      userId = json["user_id"];
    }

    if (json["visa_fee"] is String) {
      visaFee = json["visa_fee"];
    }
    if (json["service_fee"] is String) {
      serviceFee = json["service_fee"];
    }
    if (json["service_fee_vat"] is String) {
      serviceFeeVat = json["service_fee_vat"];
    }
    if (json["total_fee"] is String) {
      totalFee = json["total_fee"];
    }
    if (json["visa_status_id"] is String) {
      visaStatusId = json["visa_status_id"];
    }
    if (json["passport_image"] is String) {
      passportImage = json["passport_image"];
    }
    if (json["profile_image"] is String) {
      profileImage = json["profile_image"];
    }
    if (json["visa_status_name"] is String) {
      visaStatusName = json["visa_status_name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["visa_type_id"] = visaTypeId;
    data["full_english_name"] = fullEnglishName;
    data["date_of_birth"] = dateOfBirth;
    data["email"] = email;
    data["outside_uae_dialling_code"] = outsideUaeDiallingCode;
    data["outside_uae_residence_country_telephone"] =
        outsideUaeResidenceCountryTelephone;
    data["user_id"] = userId;
    data["visa_fee"] = visaFee;
    data["service_fee"] = serviceFee;
    data["service_fee_vat"] = serviceFeeVat;
    data["total_fee"] = totalFee;
    data["visa_status_id"] = visaStatusId;
    data["passport_image"] = passportImage;
    data["profile_image"] = profileImage;
    data["visa_status_name"] = visaStatusName;
    return data;
  }
}
