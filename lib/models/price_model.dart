class PriceModel {
  String visaFee;
  String processingFee;
  int processingFeeVat;
  int totalFee;

  PriceModel({
    required this.visaFee,
    required this.processingFee,
    required this.processingFeeVat,
    required this.totalFee,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
        visaFee: json["visa_fee"] ?? "",
        processingFee: json["processing_fee"] ?? "",
        processingFeeVat: json["processing_fee_vat"] ?? 0,
        totalFee: json["total_fee"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "visa_fee": visaFee,
        "processing_fee": processingFee,
        "processing_fee_vat": processingFeeVat,
        "total_fee": totalFee,
      };
}
