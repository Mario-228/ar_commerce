import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/forgot_password_feature/presentation/views/forgot_password_view.dart';
import 'package:graduation_project/features/login_feature/presentation/views/login_view.dart';
import 'package:graduation_project/features/onboarding_view/presentation/views/onboarding_view.dart';
import 'package:graduation_project/features/password_reset_feature/presentation/views/password_reset_view.dart';
import 'package:graduation_project/features/splash_view/presentation/views/splash_view.dart';

abstract class AppRouters {
  static const String kSignUpView = '/signUpView';
  static const String kPasswordResetView = '/passwordResetView';
  static const String kOnBoardingView = '/onBoardingView';
  static const String kLoginView = '/loginView';
  static const String kForgotPasswordView = '/forgotPasswordView';

  static final routers = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: "/", // route screen of the application
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kPasswordResetView,
        builder: (context, state) => const PasswordResetView(),
      ),
    ],
  );
}
