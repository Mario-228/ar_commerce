import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project/core/utils/cache_helper/cache_helper_keys.dart';

Future<void> initializeUserInfoVariables() async {
  isVerified =
      await CacheHelper.getData<bool>(CacheHelperKeys.isVerified) ?? false;
  userToken = await CacheHelper.getData<String>(CacheHelperKeys.tokenKey) ?? "";
  userEmail =
      await CacheHelper.getData<String>(CacheHelperKeys.userEmail) ?? "";
}
