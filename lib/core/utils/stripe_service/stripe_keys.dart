abstract class StripeKeys {
  static const String secretkey =
      "sk_test_51QrdCTPjQ1S8Quy02OSi0G8MmEzCCrqjPMYUaEkJpmvEBc5rmkkdZzN4dWF7W914vxHdhBGzq8pAmUorE25B6CqI00GbMoKa4h";
  static const String baseUrl = "https://api.stripe.com/v1/";
  static const String createIntentUrl = "payment_intents";
  static const String createEphemeralKeyUrl = "ephemeral_keys";
  static const String createCustomerIdUrl = "customers";
  static const String publishKey =
      "pk_test_51QrdCTPjQ1S8Quy0ipVYWDqDWrfEtRQ109iOo9wJphThx8Sa0xk9qG4FZR1JVLggjtDiw8EhAoRaOFJ7LUZZJlgX00XYJhzBXl";
  static const String stripeEndPoint = "create/checkout/session/";
}
