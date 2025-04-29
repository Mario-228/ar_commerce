import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/core/widgets/custom_appbar.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(title: "Checkout"),
      body: CheckoutViewBody(),
    );
  }
}
