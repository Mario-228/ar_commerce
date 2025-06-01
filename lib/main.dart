import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:graduation_project_new_version/core/utils/ar_service/ar_device_compatibility_checker.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project_new_version/core/utils/get_it_service/get_it_service.dart';
import 'package:graduation_project_new_version/core/utils/paymob_service/paymob_service.dart';
import 'package:graduation_project_new_version/core/utils/stripe_service/stripe_keys.dart';
import 'package:graduation_project_new_version/features/favourites_feature/presentation/views_models/get_user_favourite_cubit/get_user_favourites_cubit.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/update_user_cubit/update_user_cubit.dart';
// import 'package:graduation_project/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pretty_bloc_observer/pretty_bloc_observer.dart';
import 'core/utils/app_colors/app_colors.dart';
import 'core/utils/app_routers/app_routers.dart';
import 'core/utils/functions/initialize_user_info_variables.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:graduation_project/features/login_feature/presentation/views/login_view.dart';
// import 'package:graduation_project/features/onboarding_view/presentation/views/onboarding_view.dart';
// import 'package:graduation_project/features/splash_view/presentation/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = StripeKeys.publishKey;
  PaymobService.initPaymob();
  await Hive.initFlutter();
  await CacheHelper.init();
  await ARDeviceCompatibilityChecker.isDeviceARCoreSupported();
  GetItService.init();
  Bloc.observer = PrettyBlocObserver();
  initializeUserInfoVariables();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserFavouritesCubit()..getUserFavourites(),
        ),
        BlocProvider(
          create: (context) => UpdateUserCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouters.routers,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.orange, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.orange, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
    );
  }
}
