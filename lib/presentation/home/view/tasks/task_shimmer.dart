import 'package:daily_flow/presentation/widgets/global_shimmer_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';

import 'package:shimmer/shimmer.dart';

class TaskShimmer extends StatelessWidget {
  bool showStartVertlLine;
  bool showSubLine;

  TaskShimmer(
      {super.key, this.showStartVertlLine = true, this.showSubLine = true});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.only(bottom: AppMargin.m05.h),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppSize.s6), // Set the radius here
          ),
          elevation: 0,
          color: ColorManager.notificationGrey,
          child: Container(
              padding: const EdgeInsetsDirectional.only(
                  end: AppPadding.p16,
                  top: AppPadding.p14,
                  bottom: AppPadding.p14),
              width: double.infinity,
              // height: AppSize.s343,
              child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.only(end: AppPadding.p16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: showStartVertlLine,
                          child: GlobalShimmerCard(
                              size: const Size(AppSize.s5, double.infinity)),
                        ),
                        const SizedBox(width: AppSize.s10),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: AppSize.s2.w),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: GlobalShimmerCard(
                                              size: Size(
                                                  AppSize.s60.w, AppSize.s6)),
                                        ),
                                        SizedBox(width: AppSize.s2.w),
                                        Visibility(
                                          visible: showSubLine,
                                          child: Expanded(
                                              child: GlobalShimmerCard(
                                                  size: Size(AppSize.s10.w,
                                                      AppSize.s10))),
                                        ),
                                      ],
                                    ),
                                    GlobalShimmerCard(
                                        size: Size(AppSize.s40.w, AppSize.s6)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }
}
