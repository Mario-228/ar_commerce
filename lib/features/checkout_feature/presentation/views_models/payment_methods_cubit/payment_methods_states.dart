abstract class PaymentMethodsStates {}

class PaymentMethodsInitialState extends PaymentMethodsStates {}

class StripeLoadingState extends PaymentMethodsStates {}

class StripeSuccessState extends PaymentMethodsStates {}

class StripeErrorState extends PaymentMethodsStates {
  final String error;
  StripeErrorState({required this.error});
}
