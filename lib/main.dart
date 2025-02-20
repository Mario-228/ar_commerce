import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  await Hive.initFlutter();
  Bloc.observer = PrettyBlocObserver();
  await initializeUserInfoVariables();
  runApp(const MyApp());
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
