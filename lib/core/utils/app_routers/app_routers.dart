import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views/cart_view.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/delivery_address/add_delivery_address_view/add_delivery_address_view.dart';

import '../../../features/accessories_category_feature/presentation/views/accessories_category_view.dart';
import '../../../features/clothes_category_feature/presentation/views/clothes_category_view.dart';
import '../../../features/email_verification_feature/presentation/views/email_verification_view.dart';
import '../../../features/email_verification_feature/presentation/views_models/email_verification_cubit/email_verification_cubit.dart';
import '../../../features/favourites_feature/presentation/views/favourites_view.dart';
import '../../../features/forgot_password_feature/presentation/views/forgot_password_view.dart';
import '../../../features/furniture_category_feature/presentation/views/furniture_category_view.dart';
import '../../../features/home_feature/data/repos/home_repo_end_points.dart';
import '../../../features/home_feature/data/repos/home_repo_implementation.dart';
import '../../../features/home_feature/presentation/home_view.dart';
import '../../../features/home_feature/presentation/views_models/get_product_cubit/get_product_cubit.dart';
import '../../../features/home_feature/presentation/views_models/home_navigation_bar_cubit/home_navigation_bar_cubit.dart';
import '../../../features/login_feature/presentation/views/login_view.dart';
import '../../../features/login_feature/presentation/views_models/login_cubit/login_cubit.dart';
import '../../../features/onboarding_view/presentation/views/onboarding_view.dart';
import '../../../features/others_category_feature/presentation/views/others_category_view.dart';
import '../../../features/popular_category_feature/presentation/views/popular_category_view.dart';
import '../../../features/product_details_feature/presentation/views/product_details_view.dart';
import '../../../features/profile_feature/presentation/views/profile_view.dart';
import '../../../features/profile_feature/presentation/views/widgets/delivery_address/current_delivery_address_view/current_delivery_address_view.dart';
import '../../../features/profile_feature/presentation/views/widgets/my_details_view/my_details_view.dart';
import '../../../features/profile_feature/presentation/views/widgets/orders_profile_view/my_order_details_view/my_order_details_view.dart';
import '../../../features/profile_feature/presentation/views/widgets/orders_profile_view/my_orders_view/my_orders_view.dart';
import '../../../features/reset_password_feature/presentation/views/reset_password_view.dart';
import '../../../features/reset_password_feature/presentation/views_models/reset_password_cubit/reset_password_cubit.dart';
import '../../../features/signup_feature/data/repo/sign_up_repo_implementation.dart';
import '../../../features/signup_feature/presentation/views/signup_view.dart';
import '../../../features/signup_feature/presentation/views_models/sign_up_cubit/sign_up_cubit.dart';
import '../../../features/splash_view/presentation/views/splash_view.dart';
import '../custom_product_item_model/custom_product_item_model.dart';

abstract class AppRouters {
  static const String kSignUpView = '/signUpView';
  static const String kResetPasswordView = '/resetPasswordView';
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
  static const String kProfileView = '/profileView';
  static const String kEmailVerificationView = '/emailVerificationView';
  static const String kMyDetailsView = '/myDetailsView';
  static const String kChangePassword = '/changePassword';
  static const String kAddDeliveryAddress = '/addDeliveryAddress';
  static const String kCurrentDeliveryAddress = '/currentDeliveryAddress';
  static const String kFavouritesView = '/favouritesView';
  static const String kMyOrdersView = '/myOrdersView';
  static const String kMyOrderDetailsView = '/myOrdersDetailsView';
  static const String kCartView = '/cartView';
  static final routers = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: "/", // route screen of the application
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginView(),
        ),
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
        path: kResetPasswordView,
        builder: (context, state) => BlocProvider(
          create: (context) => ResetPasswordCubit(),
          child: ResetPasswordView(email: state.extra as String),
        ),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => BlocProvider(
            create: (context) => SignUpCubit(SignUpRepoImplementation()),
            child: const SignupView()),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => HomeNavigationBarCubit()),
              BlocProvider(
                create: (context) =>
                    GetProductCubit(homeRepo: HomeRepoImplementation())
                      ..getProduct(endPoint: HomeRepoEndPoints.product),
              ),
            ],
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
        builder: (context, state) =>
            ProductDetailsView(model: state.extra as CustomProductItemModel),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kEmailVerificationView,
        builder: (context, state) => BlocProvider(
          create: (context) => EmailVerificationCubit(),
          child: const EmailVerificationView(),
        ),
      ),
      GoRoute(
        path: kMyDetailsView,
        builder: (context, state) => const MyDetailsView(),
        // used to pass the user model when navigate to my details view screen
        // this may cause problem...
      ),
      GoRoute(
        path: kFavouritesView,
        builder: (context, state) => const FavouritesView(),
      ),
      GoRoute(
        path: kMyOrdersView,
        builder: (context, state) => const MyOrdersView(),
      ),
      GoRoute(
        path: kMyOrderDetailsView,
        builder: (context, state) => MyOrderDetailsView(
          productItemModel: state.extra as CustomProductItemModel,
        ),
      ),
      GoRoute(
        path: kCartView,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: kCurrentDeliveryAddress,
        builder: (context, state) => const CurrentDeliveryAddressView(),
      ),
      GoRoute(
        path: kAddDeliveryAddress,
        builder: (context, state) => const AddDeliveryAddressView(),
      ),
    ],
  );
}
