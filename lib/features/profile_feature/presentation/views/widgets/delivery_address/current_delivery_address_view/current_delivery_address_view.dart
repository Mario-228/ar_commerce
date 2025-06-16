import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_cubit.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/delivery_address/current_delivery_address_view/widgets/current_delivery_address_body.dart';
import '../../../../../../../core/widgets/custom_appbar.dart';

class CurrentDeliveryAddressView extends StatelessWidget {
  const CurrentDeliveryAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit()..getAddresses(),
      child: Scaffold(
        appBar: CustomAppbar(
          title: AppLocalizations.of(context)!.deliveryAddress,
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () async =>
                    await CheckoutCubit.get(context).getAddresses(),
                icon: const Icon(Icons.refresh),
              ),
            ),
          ],
        ),
        body: const CurrentDeliveryAddressBody(),
      ),
    );
  }
}
