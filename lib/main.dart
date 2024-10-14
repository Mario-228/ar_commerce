import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
// import 'package:graduation_project/features/login_feature/presentation/views/login_view.dart';
// import 'package:graduation_project/features/onboarding_view/presentation/views/onboarding_view.dart';
// import 'package:graduation_project/features/splash_view/presentation/views/splash_view.dart';

void main() {
  runApp(DevicePreview(
    builder: (BuildContext context) => const MyApp(),
    enabled: true,
  ));
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
        useMaterial3: true,
      ),
    );
  }
}
