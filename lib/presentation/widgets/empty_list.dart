import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/resources/assets_manager.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';

class EmptyListWidget extends StatelessWidget {
  EmptyListWidget({
    Key? key,
    this.errorTitle = LocaleKeys.empty,
    this.errorSubTitle = LocaleKeys.emptyListDesc,
    this.asset = ImageAssets.emptyList,
    this.physic = const ScrollPhysics(),
  }) : super(key: key);

  String errorTitle;
  String errorSubTitle;
  String asset;
  ScrollPhysics physic;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        // shrinkWrap: true,
        physics: physic,
        children: [
          SvgPicture.asset(
            asset,
            width: AppSize.s220,
          ),
          SizedBox(height: AppSize.s1.h),
          Visibility(
              visible: errorTitle.isNotEmpty,
              child: Column(
                children: [
                  Text(errorTitle.tr(),
                      textAlign: TextAlign.center,
                      style: getMediumLexendStyle(
                          color: ColorManager.midBlack,
                          fontSize: FontSize.s19.sp)),
                  SizedBox(height: AppSize.s2.h),
                ],
              )),
          Visibility(
            visible: errorSubTitle.isNotEmpty,
            child: Container(
              margin: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppMargin.m34),
              child: Text(errorSubTitle.tr(),
                  textAlign: TextAlign.center,
                  style: getRegularLexendStyle(
                      color: ColorManager.darkGreyBlue,
                      fontSize: FontSize.s16.sp)),
            ),
          )
        ],
      ),
    );
  }
}
