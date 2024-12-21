import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:daily_flow/app/app.dart';
import 'package:daily_flow/app/bloc_observer.dart';
import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/app/functions.dart';
import 'package:daily_flow/presentation/resources/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  /// prevent rotation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// set status bar text black
  setStatusBarTextBlack();

  Bloc.observer = AppBlocObserver();
  await initAppModule();
  runApp(
    EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSTET_PATH_LOCALISATION,
      child: Phoenix(
        child: MyApp(),
      ),
    ),
  );
}
