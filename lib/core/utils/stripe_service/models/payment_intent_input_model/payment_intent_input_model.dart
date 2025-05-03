class PaymentIntentInputModel {
  String amount;
  String currency;
  String customerId;
  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    required this.customerId, //can be optional parameters , because the customer may be considered as a guest
    //guest means that the user wants to make a payment without creating any services
  });

  Map<String, dynamic> toJson() =>
      {'amount': amount, 'currency': currency, 'customer': customerId};
}
