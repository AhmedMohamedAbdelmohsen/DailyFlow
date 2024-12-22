import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    /// main colors
    primaryColor: ColorManager.darkGreyBlue,
    primaryColorLight: Colors.grey,
    disabledColor: Colors.grey,
    splashColor: Colors.grey,
    scaffoldBackgroundColor: ColorManager.white,

    /// bottom Sheet Theme
    bottomSheetTheme: const BottomSheetThemeData(
        dragHandleColor: ColorManager.greyLightThree,
        dragHandleSize: Size(AppSize.s60, AppSize.s4)),

    /// check box
    checkboxTheme: CheckboxThemeData(
      side: BorderSide(
        color: ColorManager.lightGrey2, // Change border color
        width: AppSize.s1_5, // Change border width
        style: BorderStyle.solid, // Ensure solid style
      ),
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return ColorManager.darkBlue;
        } else {
          return ColorManager.white;
        }
      }),
      checkColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return ColorManager.midWhite;
        } else {
          return ColorManager.darkBlue;
        }
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            AppSize.s5), // Change checkbox radius according to your need
      ),
    ),

    /// card view theme
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: AppSize.s1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s2.dp),
        ),
      ),
    ),

    // /// divider theme
    // dividerTheme: const DividerThemeData(
    //     endIndent: AppSize.s16,
    //     indent: AppSize.s16,
    //     space: AppSize.s16),

    /// app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.darkGreyBlue,
      elevation: AppSize.s4,
      shadowColor: Colors.grey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(AppSize.s32),
          // Adjust the radius as needed
          bottomLeft:
              Radius.circular(AppSize.s32), // Adjust the radius as needed
        ),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      titleTextStyle: getBoldLexendStyle(
        fontSize: FontSize.s18.sp,
        color: Colors.white,
      ),
    ),

    /// time picker theme
    timePickerTheme: TimePickerThemeData(
      // Customize the colors here
      hourMinuteColor: ColorManager.darkGreyBlue,
      hourMinuteTextColor: ColorManager.white,
      backgroundColor: Colors.white,
      dialHandColor: ColorManager.darkGreyBlue,
      dayPeriodTextColor: ColorManager.darkGreyBlue,
      dialBackgroundColor: ColorManager.grey,
      helpTextStyle: getMediumLexendStyle(
        color: ColorManager.darkGreyBlue,
        fontSize: FontSize.s14.sp,
      ),
    ),

    /// text button theme
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateColor.resolveWith(
            (states) => ColorManager.darkGreyBlue),
      ),
    ),

    /// button theme
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: Colors.grey,
      buttonColor: ColorManager.darkGreyBlue,
      splashColor: Colors.blue,
    ),

    /// elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularLexendStyle(
          color: ColorManager.white,
          fontSize: FontSize.s10.sp,
        ),
        backgroundColor: ColorManager.waterBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s02.dp),
        ),
      ),
    ),

    /// text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldLexendStyle(
        color: Colors.black,
        fontSize: FontSize.s16.sp,
      ),
      displayMedium: getSemiBoldLexendStyle(
        color: Colors.black,
        fontSize: FontSize.s22.sp,
      ),
      displaySmall: getSemiBoldLexendStyle(
        color: Colors.black,
        fontSize: FontSize.s24.sp,
      ),
      headlineMedium: getSemiBoldLexendStyle(
        color: Colors.grey,
        fontSize: FontSize.s18.sp,
      ),
      titleMedium: getRegularLexendStyle(
        color: ColorManager.unSelected,
        fontSize: FontSize.s15.sp,
      ),
      titleSmall: getRegularLexendStyle(
        color: Colors.black,
        fontSize: FontSize.s15.sp,
      ),
      bodySmall: getRegularLexendStyle(color: Colors.grey),
    ),

    /// input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorManager.lightGrey6,
      filled: true,

      /// content padding
      contentPadding: EdgeInsets.all(AppPadding.p024.dp),
      hintStyle: getRegularLexendStyle(
        color: Colors.grey,
        fontSize: FontSize.s14.sp,
      ),
      labelStyle: getRegularLexendStyle(
        color: Colors.grey,
        fontSize: FontSize.s16.sp,
      ),
      errorStyle: getRegularLexendStyle(color: Colors.red),

      /// enabled
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.transparent,
          width: AppSize.s006.dp,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s02.dp),
        ),
      ),

      /// focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.transparent,
          width: AppSize.s006.dp,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s017.dp),
        ),
      ),

      /// error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: AppSize.s006.dp,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s017.dp),
        ),
      ),

      /// error focused border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: AppSize.s006.dp,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s017.dp),
        ),
      ),
    ),
  );
}
