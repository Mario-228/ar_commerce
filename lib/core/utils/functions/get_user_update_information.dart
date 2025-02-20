// import 'dart:io';

// import 'package:graduation_project/constants.dart';
// import 'package:graduation_project/core/utils/cache_helper/cache_helper.dart';
// import 'package:graduation_project/features/profile_feature/data/models/update_profile_model.dart';
// import 'package:graduation_project/features/profile_feature/presentation/views/widgets/my_details_view/widgets/custom_gender_selection_widget.dart';

// Future<UpdateProfileModel> getUserUpdateInformation(File imageFile) async {
//   if (imageFile.path.isEmpty) {
//     imageFile = await CacheHelper.getUserImage();
//   }
//   var updateProfileModel = UpdateProfileModel(
//       name: name.isEmpty ? userModel.userModel.name : name,
//       phone: phone.isEmpty ? userModel.userModel.phone : phone,
//       image: imageFile,
//       gender: CustomGenederSelectionWidget.gender.isEmpty
//           ? userModel.userModel.gender
//           : CustomGenederSelectionWidget.gender);
//   print(updateProfileModel.toJson());
//   return updateProfileModel;
// }
