import 'package:get_it/get_it.dart';
import '../../../features/home_feature/data/repos/home_repo_implementation.dart';
import '../../../features/home_feature/presentation/views_models/get_product_cubit/get_product_cubit.dart';

abstract class GetItService {
  static final GetIt getIt = GetIt.instance;
  static void init() {
    getIt.registerSingleton<GetProductCubit>(
      GetProductCubit(homeRepo: HomeRepoImplementation()),
    );
  }
}
