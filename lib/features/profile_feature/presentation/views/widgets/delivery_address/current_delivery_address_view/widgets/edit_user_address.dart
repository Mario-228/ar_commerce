import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/delivery_address/current_delivery_address_view/widgets/edit_address_button_bloc_consumer.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/delivery_address/current_delivery_address_view/widgets/edit_user_address_input_fields_section.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/edit_address_cubit/edit_address_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../../core/utils/font_styles/font_styles.dart';

class EditUserAddressView extends StatelessWidget {
  const EditUserAddressView({super.key, required this.addressModel});
  final AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EditAddressCubit()..changeTextEditingControllers(addressModel),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.editAddress)),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.deliveryDetails,
                  style: FontStyles.textStyleRegular16,
                ),
              ),
              const SizedBox(height: 20),
              const EditUserAddressInputFieldsSection(),
              const SizedBox(height: 40),
              EditAddressButtonBlocConsunmer(addressModel: addressModel),
              const SizedBox(height: 5),
            ]),
          ),
        ),
      ),
    );
  }
}
