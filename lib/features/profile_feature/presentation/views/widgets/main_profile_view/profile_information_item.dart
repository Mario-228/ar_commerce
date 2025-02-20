import 'package:flutter/material.dart';
import '../../../../../../core/utils/font_styles/font_styles.dart';
import '../../../../data/models/profile_info_model.dart';

class ProfileInformationItem extends StatelessWidget {
  const ProfileInformationItem({super.key, required this.item});
  final ProfileInfoModel item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 65.0,
      onTap: item.onInfoProfileItemPressed,
      leading: Icon(item.infoIcon),
      title: Text(
        item.infoText,
        style: FontStyles.textStyleSemiBold14,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15.0,
      ),
    );
  }
}
