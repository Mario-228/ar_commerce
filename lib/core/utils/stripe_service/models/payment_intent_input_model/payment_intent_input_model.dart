class PaymentIntentInputModel {
  String amount;
  String currency;
  String? customerId;
  PaymentIntentInputModel({
    required this.amount,
    this.currency = 'EGP',
    this.customerId, //can be optional parameters , because the customer may be considered as a guest
    //guest means that the user wants to make a payment without creating any services
  });

  Map<String, dynamic> toJson() {
    amount = "${(double.parse(amount) * 100).round()}";
    return {
      'amount': amount,
      'currency': currency,
      if (customerId != null) 'customer': customerId
    };
  }
}
