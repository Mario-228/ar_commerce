import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:graduation_project_new_version/core/utils/language_service/language_assets.dart';

abstract class LanguageService {
  static Map<String, dynamic> languageText = {};
  static Future<void> changeLanguage(String languageCode) async {
    String temp;
    switch (languageCode) {
      case "ar":
        temp = await rootBundle.loadString(LanguageAssets.ar);
        break;
      case "en":
      default:
        temp = await rootBundle.loadString(LanguageAssets.en);
        break;
    }
    languageText = jsonDecode(temp);
  }
}
