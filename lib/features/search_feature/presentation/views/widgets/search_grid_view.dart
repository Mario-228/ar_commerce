import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/search_feature/presentation/models_views/get_search_products_cubit/get_search_products_cubit.dart';
import 'package:graduation_project_new_version/features/search_feature/presentation/models_views/get_search_products_cubit/get_search_products_states.dart';
import '../../../../home_feature/presentation/widgets/custom_product_item.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSearchProductsCubit, GetSearchProductsStates>(
      builder: (context, state) {
        if (GetSearchProductsCubit.searchController.text.isNotEmpty) {
          if (state is GetSearchProductsSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) =>
                    CustomProductItem(productItemModel: state.products[index]),
              ),
            );
          } else if (state is GetSearchProductsFailedState) {
            return Center(
              child: Text(state.errorMsg),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        } else {
          return const Center(
            child: Text(
              "Please enter a search term",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }
      },
    );
  }
}
