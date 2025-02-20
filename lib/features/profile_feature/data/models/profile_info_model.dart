import 'package:flutter/material.dart';

class ProfileInfoModel {
  final String infoText;
  final IconData infoIcon;
  void Function() onInfoProfileItemPressed;
  ProfileInfoModel(
      {required this.infoText,
      required this.infoIcon,
      required this.onInfoProfileItemPressed});
}
