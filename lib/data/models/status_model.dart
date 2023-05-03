class StatusModel {
  String? referenceNo;
  String? referenceName;
  String? visaTypeId;
  String? passportNumber;
  String? passportExpiryDate;
  String? visaStatusName;

  StatusModel(
      {this.referenceNo,
      this.referenceName,
      this.visaTypeId,
      this.passportNumber,
      this.passportExpiryDate,
      this.visaStatusName});

  StatusModel.fromJson(Map<String, dynamic> json) {
    if (json["reference_no"] is String) {
      referenceNo = json["reference_no"];
    }
    if (json["reference_name"] is String) {
      referenceName = json["reference_name"];
    }
    if (json["visa_type_id"] is String) {
      visaTypeId = json["visa_type_id"];
    }
    if (json["passport_number"] is String) {
      passportNumber = json["passport_number"];
    }
    if (json["passport_expiry_date"] is String) {
      passportExpiryDate = json["passport_expiry_date"];
    }
    if (json["visa_status_name"] is String) {
      visaStatusName = json["visa_status_name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["reference_no"] = referenceNo;
    data["reference_name"] = referenceName;
    data["visa_type_id"] = visaTypeId;
    data["passport_number"] = passportNumber;
    data["passport_expiry_date"] = passportExpiryDate;
    data["visa_status_name"] = visaStatusName;

    return data;
  }
}
