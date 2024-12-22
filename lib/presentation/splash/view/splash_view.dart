import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:daily_flow/app/app_prefs.dart';
import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/resources/assets_manager.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:daily_flow/presentation/resources/routes_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<double> _animation;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 4), _goNext);
  }

  _goNext() {
    _appPreferences.isUserLoggedIn().then((isUserLogin) => {
          if (isUserLogin)
            {Navigator.pushReplacementNamed(context, Routes.homeRoute)}
          else
            {
              Navigator.pushReplacementNamed(context, Routes.loginRoute)
            }
        });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation =
        Tween<double>(begin: AppSize.s10, end: AppSize.s1).animate(_animationController);

    _animation.addListener(() {
      setState(() {});
    });

    _animationController.forward();
    Future.delayed(const Duration(seconds: 1)).then((_) {
      _animationController.reverse();
    });

    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// hide status bar
    // hideStatusBar();

    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Stack(
            // mainAxisSize: MainAxisSize.min,
            alignment: Alignment.center, // Align children in the center
            children: [
              Image.asset(ImageAssets.logo, width: AppSize.s120)
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 500))
                  .then()
                  .slideY(end: -1),
              // const SizedBox(height: AppSize.s20),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.dailyFlow.tr(),
                    style: getMediumLexendStyle(
                        color: ColorManager.basicColor, fontSize: FontSize.s22.sp),
                  ).animate(delay: const Duration(seconds: 1)).scale(),
                  const SizedBox(height: AppSize.s10),
                  Text(
                    LocaleKeys.dailyFlowDesc.tr(),
                    style: getRegularLexendStyle(
                        color: ColorManager.basicColor, fontSize: FontSize.s18.sp),
                  )
                      .animate()
                      .fade(
                          delay: const Duration(milliseconds: 1200),
                          duration: const Duration(milliseconds: 500))
                      .scale(),
                ],
              )
              // const SizedBox(height: AppSize.s20),
              // Image.asset(ImageAssets.logoName, width: 150)
            ],
          ),
        ),
      ),
    );
  }
}
