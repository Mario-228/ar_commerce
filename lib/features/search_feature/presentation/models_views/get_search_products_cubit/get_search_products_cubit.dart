import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/search_feature/data/get_search_products_repo/get_search_products_repo_implementation.dart';
import 'package:graduation_project_new_version/features/search_feature/presentation/models_views/get_search_products_cubit/get_search_products_states.dart';

class GetSearchProductsCubit extends Cubit<GetSearchProductsStates> {
  GetSearchProductsCubit() : super(GetSearchProductsInitialState());
  static GetSearchProductsCubit get(context) => BlocProvider.of(context);
  static TextEditingController searchController = TextEditingController();
  Future<void> getSearchProducts(String searchText) async {
    emit(GetSearchProductsLoadingState());
    var result = await GetSearchProductsRepoImplementation()
        .getSearchProducts(searchText);
    result.fold(
        (error) =>
            emit(GetSearchProductsFailedState(errorMsg: error.errorMessage)),
        (data) => emit(GetSearchProductsSuccessState(products: data)));
  }
}
