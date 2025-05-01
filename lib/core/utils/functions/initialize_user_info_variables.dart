import '../../../constants.dart';
import '../cache_helper/cache_helper.dart';
import '../cache_helper/cache_helper_keys.dart';

void initializeUserInfoVariables() {
  isVerified = CacheHelper.getData<bool>(CacheHelperKeys.isVerified) ?? false;
  userToken = CacheHelper.getData<String>(CacheHelperKeys.tokenKey) ?? "";
  userEmail = CacheHelper.getData<String>(CacheHelperKeys.userEmail) ?? "";
}
