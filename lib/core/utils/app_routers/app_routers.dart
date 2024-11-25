import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/accessories_category_feature/presentation/views/accessories_category_view.dart';
import 'package:graduation_project/features/clothes_category_feature/presentation/views/clothes_category_view.dart';
import 'package:graduation_project/features/forgot_password_feature/presentation/views/forgot_password_view.dart';
import 'package:graduation_project/features/furniture_category_feature/presentation/views/furniture_category_view.dart';
import 'package:graduation_project/features/home_feature/presentation/home_view.dart';
import 'package:graduation_project/features/home_feature/presentation/views_models/home_navigation_bar_cubit/home_navigation_bar_cubit.dart';
import 'package:graduation_project/features/login_feature/presentation/views/login_view.dart';
import 'package:graduation_project/features/onboarding_view/presentation/views/onboarding_view.dart';
import 'package:graduation_project/features/others_category_feature/presentation/views/others_category_view.dart';
import 'package:graduation_project/features/password_reset_feature/presentation/views/password_reset_view.dart';
import 'package:graduation_project/features/popular_category_feature/presentation/views/popular_category_view.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/product_details_view.dart';
import 'package:graduation_project/features/signup_feature/presentation/views/signup_view.dart';
import 'package:graduation_project/features/splash_view/presentation/views/splash_view.dart';

abstract class AppRouters {
  static const String kSignUpView = '/signUpView';
  static const String kPasswordResetView = '/passwordResetView';
  static const String kOnBoardingView = '/onBoardingView';
  static const String kLoginView = '/loginView';
  static const String kForgotPasswordView = '/forgotPasswordView';
  static const String kHomeView = '/homeView';
  static const String kFurnitureCategoryView = '/furnitureCategoryView';
  static const String kClothesCategoryView = '/clothesCategoryView';
  static const String kAccessoriesCategoryView = '/accessoriesCategoryView';
  static const String kOthersCategoryView = '/othersCategoryView';
  static const String kPopularCategoryView = '/popularCategoryView';
  static const String kProductDetailsView = '/productDetailsView';

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
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => HomeNavigationBarCubit(),
            child: HomeView(externalIndex: state.extra as int?),
          );
        },
      ),
      GoRoute(
        path: kFurnitureCategoryView,
        builder: (context, state) => const FurnitureCategoryView(),
      ),
      GoRoute(
        path: kClothesCategoryView,
        builder: (context, state) => const ClothesCategoryView(),
      ),
      GoRoute(
        path: kAccessoriesCategoryView,
        builder: (context, state) => const AccessoriesCategoryView(),
      ),
      GoRoute(
        path: kOthersCategoryView,
        builder: (context, state) => const OthersCategoryView(),
      ),
      GoRoute(
        path: kPopularCategoryView,
        builder: (context, state) => const PopularCategoryView(),
      ),
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) => const ProductDetailsView(),
      ),
    ],
  );
}
