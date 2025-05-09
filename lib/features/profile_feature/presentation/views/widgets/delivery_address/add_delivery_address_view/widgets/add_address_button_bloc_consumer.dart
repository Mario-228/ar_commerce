import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/functions/show_snack_bar.dart';
import '../../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../../../core/widgets/custom_material_button.dart';
import '../../../../../views_models/add_new_address_cubit/add_new_address_cubit.dart';
import '../../../../../views_models/add_new_address_cubit/add_new_address_states.dart';

class AddAddressButtonBlocCounsumer extends StatelessWidget {
  const AddAddressButtonBlocCounsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewAddressCubit, AddNewAddressStates>(
      listener: (context, state) {
        if (state is AddNewAddressErrorState) {
          showSnackBar(context, state.errorMessage);
        } else if (state is AddNewAddressSuccessState) {
          showSnackBar(context, "Address added successfully");
        }
      },
      builder: (context, state) {
        if (state is AddNewAddressLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return CustomMaterialButton(
            color: AppColors.darkGreen,
            text: "Add New Address",
            onPressed: () async {
              if (AddNewAddressCubit.get(context)
                  .formKey
                  .currentState!
                  .validate()) {
                await AddNewAddressCubit.get(context).addNewAddress();
              }
            },
            textColor: AppColors.white,
          );
        }
      },
    );
  }
}
