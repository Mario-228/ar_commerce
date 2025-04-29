import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views_models/cart_cubit/cart_states.dart';

import '../../../../../core/utils/font_styles/font_styles.dart';
import '../../views_models/cart_cubit/cart_cubit.dart';

class TotalCartBlocBuilder extends StatelessWidget {
  const TotalCartBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        if (state is GetCartSuccessState) {
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "${state.cartModel.totalCart} LE",
              style: FontStyles.textStyleBold24,
            ),
          );
        }
        return Text(
          "0 LE",
          style: FontStyles.textStyleBold24,
        );
      },
    );
  }
}
