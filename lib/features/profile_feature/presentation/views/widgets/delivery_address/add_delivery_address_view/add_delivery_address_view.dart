import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/delivery_address/add_delivery_address_view/widgets/add_delivery_address_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../core/widgets/custom_appbar.dart';
import '../../../../views_models/add_new_address_cubit/add_new_address_cubit.dart';

class AddDeliveryAddressView extends StatelessWidget {
  const AddDeliveryAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: AppLocalizations.of(context)!.addNewAddress),
      body: BlocProvider(
        create: (context) => AddNewAddressCubit(),
        child: AddDeliveryAddressBody(),
      ),
    );
  }
}
