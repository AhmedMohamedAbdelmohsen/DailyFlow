import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:daily_flow/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';

class CustomWidgetWithTitle extends StatelessWidget {
  CustomWidgetWithTitle(
      {Key? key,
      required this.title,
      required this.child,
      this.space = AppSize.s1,
      this.titleSize = AppSize.s14,
      this.isRequired = false})
      : super(key: key);
  final String title;
  final Widget child;
  double space;
  double titleSize;
  bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          title: title,
          titleColor: ColorManager.lightBlue2,
          isRequired: isRequired,
          titleSize: titleSize.sp,
        ),
        SizedBox(
          height: space.h,
        ),
        child
      ],
    );
  }
}
