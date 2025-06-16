import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/delivery_address/current_delivery_address_view/widgets/user_addresses_list_view_bloc_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../../../core/utils/app_routers/app_routers.dart';
import '../../../../../../../../core/widgets/custom_material_button.dart';

class CurrentDeliveryAddressBody extends StatelessWidget {
  const CurrentDeliveryAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
        UserAddressesListViewBlocBuilder(),
        const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomMaterialButton(
              text: AppLocalizations.of(context)!.addNewAddress,
              color: AppColors.lightGrey,
              textColor: AppColors.lightLimeGreen,
              onPressed: () {
                GoRouter.of(context).push(AppRouters.kAddDeliveryAddress);
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
      ],
    );
  }
}
