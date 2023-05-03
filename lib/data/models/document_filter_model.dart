class DocumentFilter {
  bool? passportImage;
  bool? profileImage;
  bool? nationalId;
  bool? relativePassport;
  bool? relativeVisa;
  bool? allPassportPages;
  bool? allBankStatementPages;
  bool? additionalDocuments;

  DocumentFilter(
      {this.passportImage,
      this.profileImage,
      this.nationalId,
      this.relativePassport,
      this.relativeVisa,
      this.allPassportPages,
      this.allBankStatementPages,
      this.additionalDocuments});

  DocumentFilter.fromJson(Map<String, dynamic> json) {
    if (json["passport_image"] is bool) {
      passportImage = json["passport_image"];
    }
    if (json["profile_image"] is bool) {
      profileImage = json["profile_image"];
    }
    if (json["national_id"] is bool) {
      nationalId = json["national_id"];
    }
    if (json["relative_passport"] is bool) {
      relativePassport = json["relative_passport"];
    }
    if (json["relative_visa"] is bool) {
      relativeVisa = json["relative_visa"];
    }
    if (json["all_passportPages"] is bool) {
      allPassportPages = json["all_passportPages"];
    }
    if (json["all_bankStatementPages"] is bool) {
      allBankStatementPages = json["all_bankStatementPages"];
    }
    if (json["additional_documents"] is bool) {
      additionalDocuments = json["additional_documents"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["passport_image"] = passportImage;
    data["profile_image"] = profileImage;
    data["national_id"] = nationalId;
    data["relative_passport"] = relativePassport;
    data["relative_visa"] = relativeVisa;
    data["all_passportPages"] = allPassportPages;
    data["all_bankStatementPages"] = allBankStatementPages;
    data["additional_documents"] = additionalDocuments;
    return data;
  }
}
