import 'package:flutter/material.dart';
import 'package:graduation_project/features/profile_feature/data/models/profile_info_model.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/profile_information_item.dart';

class ProfileInformationListView extends StatelessWidget {
  const ProfileInformationListView({
    super.key,
  });
  static List<ProfileInfoModel> items = [
    ProfileInfoModel(
      infoText: "Orders",
      infoIcon: Icons.shopping_bag_outlined,
      onInfoProfileItemPressed: () {},
    ),
    ProfileInfoModel(
      infoText: "My Details",
      infoIcon: Icons.credit_card_outlined,
      onInfoProfileItemPressed: () {},
    ),
    ProfileInfoModel(
      infoText: "Delivery Address",
      infoIcon: Icons.location_on_outlined,
      onInfoProfileItemPressed: () {},
    ),
    ProfileInfoModel(
      infoText: "Contact us",
      infoIcon: Icons.notifications_outlined,
      onInfoProfileItemPressed: () {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(
        height: 2.0,
      ),
      itemBuilder: (context, index) =>
          ProfileInformationItem(item: items[index]),
    );
  }
}
