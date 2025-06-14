import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/repos/checkout_repo_implementation.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/payment_methods_cubit/payment_methods_states.dart';

import '../../../../../core/utils/stripe_service/models/payment_intent_input_model/payment_intent_input_model.dart';

class PaymentMethodsCubit extends Cubit<PaymentMethodsStates> {
  PaymentMethodsCubit() : super(PaymentMethodsInitialState());

  static PaymentMethodsCubit get(BuildContext context) =>
      BlocProvider.of(context);
  Future<void> payWithStripe(
      PaymentIntentInputModel model, BuildContext context) async {
    emit(StripeLoadingState());
    var response = await CheckoutRepoImplementation()
        .makePayment(model: model, context: context);
    response.fold(
      (error) => emit(StripeErrorState(error: error.errorMessage)),
      (value) => emit(StripeSuccessState()),
    );
  }
}
