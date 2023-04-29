class BookingDTO {
  String? countryCode;
  String? nationality;
  String? package;
  String? packageDuration;
  String? processDuration;
  String? ageGroup;
  String? fullName;
  String? dob;
  String? passportNo;
  String? passportExpiry;
  String? email;
  String? phoneNo;
  String? visaRequestId;

  BookingDTO(
      {this.countryCode,
      this.nationality,
      this.package,
      this.packageDuration,
      this.processDuration,
      this.ageGroup,
      this.fullName,
      this.dob,
      this.passportNo,
      this.passportExpiry,
      this.email,
      this.phoneNo,
      this.visaRequestId});
}
