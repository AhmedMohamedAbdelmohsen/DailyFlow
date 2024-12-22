import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:daily_flow/presentation/widgets/custom_loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ActionButtons extends StatelessWidget {
  ActionButtons({Key? key, required this.func, required this.isLoading})
      : super(key: key);
  final VoidCallback func;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _buildCustomButton(
            context,
            label: LocaleKeys.cancel.tr(),
            textColor: ColorManager.midBlack,
            backgroundColor: ColorManager.lightGrey4,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        SizedBox(width: AppSize.s6.w),
        Expanded(
          child: isLoading
              ? LoadingWidget(size: AppSize.s30, color: ColorManager.waterBlue)
              : _buildCustomButton(
                  context,
                  label: LocaleKeys.createTask.tr(),
                  textColor: Colors.white,
                  backgroundColor: ColorManager.waterBlue,
                  onPressed: () {
                    func();
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildCustomButton(
    BuildContext context, {
    required String label,
    required Color textColor,
    required Color backgroundColor,
    required VoidCallback onPressed,
    double borderRadius = 50.0,
    TextStyle? textStyle,
  }) {
    return SizedBox(
      height: AppSize.s6.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          label,
          style: textStyle ??
              getRegularLexendStyle(
                  color: textColor, fontSize: FontSize.s16.sp),
        ),
      ),
    );
  }
}
