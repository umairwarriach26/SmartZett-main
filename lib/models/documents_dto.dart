class DocumentsDTO {
  List<SingleFile>? passportImage;
  List<SingleFile>? passportProfileImage;
  List<SingleFile>? nationalID;
  List<SingleFile>? relativePassportDoc;
  List<SingleFile>? realtiveVisaDoc;
  List<SingleFile>? allPassportPages;
  List<SingleFile>? allStatementPages;
  List<SingleFile>? supplimentDocuments;

  DocumentsDTO(
      {this.passportImage,
      this.passportProfileImage,
      this.nationalID,
      this.relativePassportDoc,
      this.realtiveVisaDoc,
      this.allPassportPages,
      this.allStatementPages,
      this.supplimentDocuments});
}

class SingleFile {
  String? prefix;
  String? base64File;
  String? type;
  String? fileName;
  String? path;

  SingleFile(
      {this.prefix, this.base64File, this.fileName, this.type, this.path});
}
