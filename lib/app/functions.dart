import 'dart:math';

import 'package:daily_flow/app/app_prefs.dart';
import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/resources/routes_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daily_flow/presentation/resources/language_manager.dart';
import 'package:url_launcher/url_launcher.dart';

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

getUserFirstName() {
  final AppPreferences appPreferences = instance<AppPreferences>();
  return appPreferences.getUserName().toString().split(' ')[0];
}

logOut(BuildContext context) {
  AppPreferences appPreferences = instance<AppPreferences>();
  appPreferences.logout().then((v) {
    resetModules();
    Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
  });
}

String getRandomTimeRange() {
  final random = Random();

  int startHour = random.nextInt(24);
  int startMinute = random.nextBool() ? 0 : 30;

  int duration = random.nextInt(12) + 1;
  int endHour = (startHour + duration) % 24;

  String formatTime(int hour, int minute) {
    String hourStr = hour.toString().padLeft(2, '0');
    String minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }

  String startTime = formatTime(startHour, startMinute);
  String endTime = formatTime(endHour, startMinute);
  return '$startTime - $endTime';
}

getRandomDateWithinFiveDays() {
  final random = Random();
  final today = DateTime.now();

  int offset = random.nextInt(11) - 5; // 11 = (5 forward + 5 backward + 1)
  return today.add(Duration(days: offset)).toString();
}

Color getPriorityColor(String priority) {
  switch (priority.toLowerCase()) {
    case 'high':
      return Colors.red;
    case 'med':
    case 'medium':
      return Colors.yellow;
    case 'low':
      return Colors.green;
    default:
      return Colors.grey;
  }
}

Future<void> shareToWhatsApp(BuildContext context, String msg) async {
  final Uri url = Uri.parse("https://wa.me/?text=${Uri.encodeComponent(msg)}");

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(LocaleKeys.errorWhats.tr())),
    );
  }
}

void copyToClipboard(BuildContext context, String msg) {
  Clipboard.setData(ClipboardData(text: msg));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(LocaleKeys.copyClipboard.tr())),
  );
}

TimeOfDay? stringToTimeOfDay(String? timeString) {
  if (timeString == null) {
    return null;
  }
  List<String> parts = timeString.split(':');
  if (parts.length != 3) {
    return null; // Return null if the input string does not have three parts
  }

  int hours = int.tryParse(parts[0]) ?? 0;
  int minutes = int.tryParse(parts[1]) ?? 0;
  return TimeOfDay(hour: hours, minute: minutes);
}

String timeToSend(TimeOfDay time) {
  return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
}

String formatTime(dynamic time, BuildContext context) {
  try {
    DateTime dateTime;
    if (time is String) {
      dateTime = DateFormat('HH:mm:ss').parse(time);
    } else if (time is TimeOfDay) {
      dateTime = DateTime(1, 1, 1, time.hour, time.minute);
    } else {
      throw ArgumentError('Invalid input type. Expected String or TimeOfDay.');
    }

    String formattedTime =
    DateFormat.jm(Localizations.localeOf(context).languageCode)
        .format(dateTime);
    return formattedTime;
  } catch (e) {
    return '';
  }
}
