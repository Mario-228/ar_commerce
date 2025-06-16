import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_project_new_version/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project_new_version/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project_new_version/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project_new_version/core/widgets/custom_material_button.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/edit_address_cubit/edit_address_cubit.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/edit_address_cubit/edit_address_states.dart';

class EditAddressButtonBlocConsunmer extends StatelessWidget {
  const EditAddressButtonBlocConsunmer({super.key, required this.addressModel});
  final AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditAddressCubit, EditAddressStates>(
      listener: (context, state) {
        if (state is EditAddressErrorState) {
          EditAddressCubit.get(context)
              .changeTextEditingControllers(addressModel);
          showSnackBar(context, state.error);
        } else if (state is EditAddressSuccessState) {
          onEditAddressSuccess(context, state);
        }
      },
      builder: (context, state) {
        if (state is EditAddressLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CustomMaterialButton(
            color: AppColors.darkGreen,
            text: AppLocalizations.of(context)!.editAddress,
            onPressed: () async {
              if (EditAddressCubit.get(context)
                  .formKey
                  .currentState!
                  .validate()) {
                await EditAddressCubit.get(context)
                    .editAddress(addressId: addressModel.id!);
              }
            },
            textColor: AppColors.white,
          );
        }
      },
    );
  }

  void onEditAddressSuccess(
      BuildContext context, EditAddressSuccessState state) {
    EditAddressCubit.get(context)
        .changeTextEditingControllers(state.addressModel);
    showSnackBar(context, AppLocalizations.of(context)!.addressEditSuccess);
    GoRouter.of(context).pushReplacement(AppRouters.kProfileView);
  }
}
