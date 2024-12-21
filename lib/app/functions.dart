import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daily_flow/presentation/resources/language_manager.dart';

bool isRTL(BuildContext context) {
  return context.locale == ARABIC_LOCAL;
}

setStatusBarTextBlack() {
  /// Set the status bar text color to black
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
}
