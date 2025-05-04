class InitPaymentSheetInputModel {
  final String paymentIntentClientSecret;
  final String? customerId;
  final String? ephemeralKeySecret;

  InitPaymentSheetInputModel({
    required this.paymentIntentClientSecret,
    this.customerId,
    this.ephemeralKeySecret,
  });
}
