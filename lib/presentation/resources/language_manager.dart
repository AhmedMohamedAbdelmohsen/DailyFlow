import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:daily_flow/app/functions.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';

enum LanguageType { ENGLISH, ARABIC }

const String ARABIC = 'ar';
const String ENGLISH = 'en';
const String ASSTET_PATH_LOCALISATION = "assets/translations";
const Locale ARABIC_LOCAL = Locale("ar", "EGY");
const Locale ENGLISH_LOCAL = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}

String getCurrentLangString(context) {
  // String currentLang = getAppLanguage() as String;
  if (isRTL(context)) {
    return LocaleKeys.arabic.tr();
  } else {
    return LocaleKeys.english.tr();
  }
}
