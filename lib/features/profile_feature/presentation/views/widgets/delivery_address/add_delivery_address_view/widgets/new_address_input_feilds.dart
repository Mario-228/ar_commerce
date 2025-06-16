import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project_new_version/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/add_new_address_cubit/add_new_address_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewAddressInputFeilds extends StatelessWidget {
  const NewAddressInputFeilds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: AddNewAddressCubit.get(context).formKey,
      child: Column(
        children: [
          CustomTextFormField(
            type: TextInputType.name,
            labelText: AppLocalizations.of(context)!.fullName,
            controller: AddNewAddressCubit.get(context).name,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return AppLocalizations.of(context)!.insertName;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            type: TextInputType.emailAddress,
            labelText: AppLocalizations.of(context)!.email,
            controller: AddNewAddressCubit.get(context).email,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return AppLocalizations.of(context)!.insertEmail;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            type: TextInputType.text,
            labelText: AppLocalizations.of(context)!.phoneNumber,
            controller: AddNewAddressCubit.get(context).phone,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return AppLocalizations.of(context)!.insertPhoneNumber;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            readOnly: true,
            type: TextInputType.streetAddress,
            labelText: AppLocalizations.of(context)!.address,
            controller: AddNewAddressCubit.get(context).address,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return AppLocalizations.of(context)!.insertAddress;
              } else {
                return null;
              }
            },
            icon: Icons.location_on_outlined,
            onPressed: () async {
              var result = await GoRouter.of(context)
                  .push<String>(AppRouters.kGoogleMapsView);
              if (result != null && result.isNotEmpty && context.mounted) {
                AddNewAddressCubit.get(context).address.text = result;
              }
            },
          ),
        ],
      ),
    );
  }
}
