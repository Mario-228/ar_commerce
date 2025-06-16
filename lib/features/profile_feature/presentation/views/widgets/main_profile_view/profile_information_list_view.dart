import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/app_routers/app_routers.dart';
import '../../../../data/models/profile_info_model.dart';
import 'profile_information_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileInformationListView extends StatelessWidget {
  const ProfileInformationListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ProfileInfoModel> items = [
      ProfileInfoModel(
        infoText: AppLocalizations.of(context)!.myOrders,
        infoIcon: Icons.shopping_bag_outlined,
        onInfoProfileItemPressed: (BuildContext context) async =>
            await GoRouter.of(context).push(AppRouters.kMyOrdersView),
      ),
      ProfileInfoModel(
        infoText: AppLocalizations.of(context)!.myDetails,
        infoIcon: Icons.credit_card_outlined,
        onInfoProfileItemPressed: (BuildContext context) async =>
            await GoRouter.of(context).push(AppRouters.kMyDetailsView),
      ),
      ProfileInfoModel(
        infoText: AppLocalizations.of(context)!.deliveryAddress,
        infoIcon: Icons.location_on_outlined,
        onInfoProfileItemPressed: (BuildContext context) async =>
            await GoRouter.of(context).push(AppRouters.kCurrentDeliveryAddress),
      ),
      ProfileInfoModel(
        infoText: AppLocalizations.of(context)!.contactUs,
        infoIcon: Icons.call_outlined,
        onInfoProfileItemPressed: (BuildContext context) async =>
            await GoRouter.of(context).push(AppRouters.kContactUsView),
      ),
    ];
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
