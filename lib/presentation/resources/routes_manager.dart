import 'package:daily_flow/presentation/add_scheduler/view/add_scheduler_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/home/view/home_view.dart';
import 'package:daily_flow/presentation/login/view/login_view.dart';
import 'package:daily_flow/presentation/splash/view/splash_view.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
  static const String addTaskView = "/addTask";
  static const String onboardingRoute = "/onboarding";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String languageRoute = "/language";
  static const String profile = "/profile";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.addTaskView:
        return MaterialPageRoute(builder: (_) => const AddScheduleView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.noRouteFound.tr()),
        ),
        body: Center(child: Text(LocaleKeys.noRouteFound.tr())),
      ),
    );
  }
}
