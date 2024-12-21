import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:daily_flow/app/constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on num? {
  num orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZeroDouble() {
    if (this == null) {
      return Constants.zeroD;
    } else {
      return this!;
    }
  }
}

extension SetDefaultFormat on DateTime {
  String defaultFormat(BuildContext context, {bool applyAppLanguage = true}) {
    String formattedDate = '';
    if (applyAppLanguage) {
      formattedDate =
          DateFormat('dd/MM/yyyy', Localizations.localeOf(context).languageCode)
              .format(this);
    } else {
      formattedDate = DateFormat('dd/MM/yyyy').format(this);
    }
    return formattedDate;
  }
}

extension SetDefaultToSend on DateTime {
  String defaultToSend() {
    String formattedDate = DateFormat('yyyy-MM-dd').format(this);
    return formattedDate;
  }
}

extension SetToStringList on List<int> {
  List<String> toStringList() {
    return map((int id) => id.toString()).toList();
  }
}
