import 'package:daily_flow/presentation/login/view/widgets/login_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/resources/assets_manager.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';

import 'widgets/curved_bottom_clipper.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _getContentWidget());
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Stack(
                children: [
                  CurvedBottomClipper(
                      endPointDeeperDrop: AppSize.s32,
                      color: ColorManager.lightSkyBlue,
                      height: AppSize.s34.h),
                  CurvedBottomClipper(
                      endPointDeeperDrop: AppSize.s65,
                      color: ColorManager.skyBlue,
                      height: AppSize.s32.h),
                ],
              ),
              Container(
                height: AppSize.s33.h,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(LocaleKeys.dailyFlow.tr(),
                        style: getMediumLexendStyle(
                            color: Colors.black, fontSize: FontSize.s20.sp)),
                    SizedBox(height: AppSize.s3.h),
                    ClipOval(
                      child: Image.asset(
                        ImageAssets.logoForeground,
                        width: AppSize.s100,
                        height: AppSize.s100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            const LoginBody()
          ],
        ),
      ),
    );
  }
}
