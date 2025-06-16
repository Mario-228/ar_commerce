import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views/widgets/custom_item_list_view.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';
import '../../views_models/cart_cubit/cart_cubit.dart';
import '../../views_models/cart_cubit/cart_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomItemCartListViewBlocBuilder extends StatelessWidget {
  const CustomItemCartListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        if (state is GetCartSuccessState) {
          return CustomItemCartListView(cartModel: state.cartModel);
        } else if (state is GetCartLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CircleAvatar(
            radius: 80,
            backgroundColor: AppColors.darkGreen,
            child: Text(AppLocalizations.of(context)!.emptyCart,
                style: FontStyles.textStyleBold19),
          );
        }
      },
    );
  }
}
