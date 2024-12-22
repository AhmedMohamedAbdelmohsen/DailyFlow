import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daily_flow/app/functions.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:ui' as ui;

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final String? labelText;
  final TextInputType keyboardType;
  final Iterable<String>? autofillHints;
  final void Function(String)? onFieldSubmitted;

  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final bool obscureText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final String? hintText;
  final String? upHintText;
  final String? suffixText;
  final String? errorText;
  final TextStyle? suffixTextStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? labelColor;
  final Color? cursorColor;
  final double radius;
  final double? height;
  final double horizontalPadding;
  final double verticalPadding;
  final InputBorder? inputBorder;
  final InputBorder? inputEnabledBorder;
  final InputBorder? inputFocusedBorder;
  final InputBorder? inputDisabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final AlignmentGeometry? containerAlignment;
  final BoxConstraints? suffixIconConstraints;
  final bool readOnly;
  final int? maxLength;
  final int? errorMaxLines;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final Color fillColor;
  final int? maxLines;
  final bool expands;
  final bool applyNullMaxLines;
  final TextAlignVertical textAlignVertical;

  const CustomTextFormFiled({
    Key? key,
    required this.controller,
    this.style,
    this.hintStyle,
    this.validator,
    this.onTap,
    this.labelText,
    required this.keyboardType,
    this.onFieldSubmitted,
    this.autofillHints,
    this.onEditingComplete,
    this.onChanged,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    this.hintText,
    this.upHintText,
    this.backgroundColor,
    this.height,
    this.radius = 30.0,
    this.maxLines,
    this.enabled = true,
    this.inputBorder =
        const OutlineInputBorder(borderSide: BorderSide(width: 1)),
    this.inputEnabledBorder,
    this.inputFocusedBorder,
    this.inputDisabledBorder,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.textColor,
    this.labelColor = Colors.white,
    this.contentPadding,
    this.containerAlignment,
    this.suffixText,
    this.suffixTextStyle,
    this.suffixIconConstraints,
    this.readOnly = false,
    this.cursorColor,
    this.maxLength,
    this.errorMaxLines = 2,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.autofocus = false,
    this.inputFormatters,
    this.errorText,
    this.errorStyle,
    required this.fillColor,
    this.expands = false,
    this.applyNullMaxLines = false,
    this.textAlignVertical = TextAlignVertical.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters ?? <TextInputFormatter>[],
      // Only numbers can be entered
      autofocus: autofocus,
      expands: expands,
      obscuringCharacter: '*',
      textInputAction: textInputAction,
      maxLength: maxLength,
      readOnly: readOnly,
      cursorColor: cursorColor,
      enabled: enabled,
      textAlignVertical: textAlignVertical,
      textAlign: textAlign,
      maxLines: applyNullMaxLines ? null : (maxLines ?? 1),
      textDirection: isRTL(context)
          ? ui.TextDirection.rtl
          : ui.TextDirection.ltr,
      initialValue: initialValue,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      onTap: onTap,
      obscureText: obscureText,
      style: style ?? Theme.of(context).textTheme.titleSmall,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        fillColor: fillColor,
        contentPadding: contentPadding,
        errorStyle: errorStyle,
        counterText: '',
        errorText: errorText,
        suffixStyle: suffixTextStyle,
        suffixText: suffixText,
        errorMaxLines: errorMaxLines,
        labelText: null,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        border: inputBorder ?? InputBorder.none,
        suffixIcon: suffixIcon,
        prefixIconColor: ColorManager.darkGreyBlue,
        suffixIconColor: ColorManager.darkGreyBlue,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        disabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        focusedErrorBorder:
            Theme.of(context).inputDecorationTheme.focusedErrorBorder,
      ),
    );
  }
}
