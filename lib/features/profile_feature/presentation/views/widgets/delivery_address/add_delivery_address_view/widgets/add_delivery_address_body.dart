import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/delivery_address/add_delivery_address_view/widgets/add_address_button_bloc_consumer.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/delivery_address/add_delivery_address_view/widgets/new_address_input_feilds.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../../core/utils/font_styles/font_styles.dart';

class AddDeliveryAddressBody extends StatelessWidget {
  const AddDeliveryAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.deliveryDetails,
              style: FontStyles.textStyleRegular16,
            ),
          ),
          const SizedBox(height: 20),
          const NewAddressInputFeilds(),
          const SizedBox(height: 40),
          AddAddressButtonBlocCounsumer(),
          const SizedBox(height: 5),
        ]),
      ),
    );
  }
}
