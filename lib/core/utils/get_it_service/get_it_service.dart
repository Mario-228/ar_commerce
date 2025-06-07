import 'package:get_it/get_it.dart';
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
  }
}
