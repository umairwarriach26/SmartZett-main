class PriceDTO {
  String? visaFee;
  String? processingFee;
  int? processingFeeVat;
  int? totalFee;

  PriceDTO({
    this.visaFee,
    this.processingFee,
    this.processingFeeVat,
    this.totalFee,
  });

  PriceDTO.fromJson(Map<String, dynamic> json) {
    if (json["visa_fee"] is String) {
      visaFee = json["visa_fee"];
    }
    if (json["processing_fee"] is String) {
      processingFee = json["processing_fee"];
    }
    if (json["processing_fee_vat"] is int) {
      processingFeeVat = json["processing_fee_vat"];
    }
    if (json["total_fee"] is int) {
      totalFee = json["total_fee"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["visa_fee"] = visaFee;
    data["processing_fee"] = processingFee;
    data["processing_fee_vat"] = processingFeeVat;
    data["total_fee"] = totalFee;
    return data;
  }
}
