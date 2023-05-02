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
}
