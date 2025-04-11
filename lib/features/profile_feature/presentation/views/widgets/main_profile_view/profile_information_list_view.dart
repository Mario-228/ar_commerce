import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/app_routers/app_routers.dart';
import '../../../../data/models/profile_info_model.dart';
import 'profile_information_item.dart';

class ProfileInformationListView extends StatelessWidget {
  const ProfileInformationListView({
    super.key,
  });
  static List<ProfileInfoModel> items = [
    ProfileInfoModel(
      infoText: "Orders",
      infoIcon: Icons.shopping_bag_outlined,
      onInfoProfileItemPressed: (BuildContext context) async =>
          await GoRouter.of(context).push(AppRouters.kMyDetailsView),
    ),
    ProfileInfoModel(
      infoText: "My Details",
      infoIcon: Icons.credit_card_outlined,
      onInfoProfileItemPressed: (BuildContext context) async =>
          await GoRouter.of(context).push(AppRouters.kMyDetailsView),
    ),
    ProfileInfoModel(
      infoText: "Delivery Address",
      infoIcon: Icons.location_on_outlined,
      onInfoProfileItemPressed: (BuildContext context) async =>
          await GoRouter.of(context).push(AppRouters.kMyDetailsView),
    ),
    ProfileInfoModel(
      infoText: "Contact us",
      infoIcon: Icons.call_outlined,
      onInfoProfileItemPressed: (BuildContext context) async =>
          await GoRouter.of(context).push(AppRouters.kMyDetailsView),
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
      itemBuilder: (context, index) => ProfileInformationItem(
        item: items[index],
      ),
    );
  }
}
