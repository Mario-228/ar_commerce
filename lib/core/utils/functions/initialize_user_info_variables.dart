import '../../../constants.dart';
import '../cache_helper/cache_helper.dart';
import '../cache_helper/cache_helper_keys.dart';

Future<void> initializeUserInfoVariables() async {
  isVerified =
      await CacheHelper.getData<bool>(CacheHelperKeys.isVerified) ?? false;
  userToken = await CacheHelper.getData<String>(CacheHelperKeys.tokenKey) ?? "";
  userEmail =
      await CacheHelper.getData<String>(CacheHelperKeys.userEmail) ?? "";
}
