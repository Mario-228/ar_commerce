import 'package:get_it/get_it.dart';
import 'package:graduation_project_new_version/features/accessories_category_feature/data/repos/accessories_repo_implementation.dart';
import 'package:graduation_project_new_version/features/accessories_category_feature/presentation/views_models/get_accessories_cubit/get_accessories_cubit.dart';
import 'package:graduation_project_new_version/features/clothes_category_feature/data/repos/clothes_repo_implementation.dart';
import 'package:graduation_project_new_version/features/clothes_category_feature/presentation/views_models/get_clothes_cubit/get_clothes_cubit.dart';
import 'package:graduation_project_new_version/features/furniture_category_feature/data/repos/furniture_repo_implementation.dart';
import 'package:graduation_project_new_version/features/furniture_category_feature/presentation/views_models/get_furniture_cubit/get_furniture_cubit.dart';
import 'package:graduation_project_new_version/features/others_category_feature/data/repos/others_repo_implementation.dart';
import 'package:graduation_project_new_version/features/others_category_feature/presentation/views_models/get_others_cubit/get_others_cubit.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/get_user_cubit/get_user_cubit.dart';
import '../../../features/home_feature/data/repos/home_repo_implementation.dart';
import '../../../features/home_feature/presentation/views_models/get_product_cubit/get_product_cubit.dart';

abstract class GetItService {
  static final GetIt getIt = GetIt.instance;
  static void init() {
    getIt.registerSingleton<GetProductCubit>(
      GetProductCubit(homeRepo: HomeRepoImplementation()),
    );
    getIt.registerSingleton<GetUserCubit>(GetUserCubit());
    getIt.registerSingleton<GetAccessoriesCubit>(
      GetAccessoriesCubit(AccessoriesRepoImplementation()),
    );
    getIt.registerSingleton<GetClothesCubit>(
      GetClothesCubit(ClothesRepoImplementation()),
    );
    getIt.registerSingleton<GetFurnitureCubit>(
      GetFurnitureCubit(FurnitureRepoImplementation()),
    );
    getIt.registerSingleton<GetOthersCubit>(
      GetOthersCubit(OthersRepoImplementation()),
    );
  }
}
