import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final Color titleColor;
  double? titleSize;
  bool isRequired;

  CustomTitle(
      {Key? key,
      required this.title,
      required this.titleColor,
      this.titleSize,
      this.isRequired = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: AppSize.s1.toInt(),
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: title,
            style: getRegularLexendStyle(
                color: titleColor, fontSize: titleSize ?? AppSize.s14.sp),
          ),
          TextSpan(
            text: isRequired ? ' * ' : '',
            style: getRegularLexendStyle(
                color: ColorManager.red, fontSize: titleSize ?? AppSize.s14.sp),
          ),
        ],
      ),
    );
  }
}
