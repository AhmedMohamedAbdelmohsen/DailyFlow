import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';

class GlobalShimmerCard extends StatelessWidget {
  final Size size;
  AlignmentGeometry? align;
  double? radius;

  GlobalShimmerCard({Key? key, required this.size, this.align, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align ?? AlignmentDirectional.centerStart,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? AppSize.s12),
          color: Colors.grey,
        ),
        margin: EdgeInsets.only(bottom: AppMargin.m1_5.h),
      ),
    );
  }
}
