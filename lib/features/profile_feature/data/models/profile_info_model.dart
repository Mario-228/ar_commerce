import 'package:flutter/material.dart';

class ProfileInfoModel {
  final String infoText;
  final IconData infoIcon;
  final void Function() onInfoProfileItemPressed;
  const ProfileInfoModel(
      {required this.infoText,
      required this.infoIcon,
      required this.onInfoProfileItemPressed});
}
