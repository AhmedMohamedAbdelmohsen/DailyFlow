import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:daily_flow/app/extension.dart';
import 'package:daily_flow/app/functions.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/resources/assets_manager.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';

import 'custom_textfield.dart';
import 'custom_widget_with_title.dart';

class CustomDateWidget extends StatefulWidget {
  CustomDateWidget({
    Key? key,
    required this.dateTitle,
    required this.dateHint,
    required this.onSelectedValueChanged,
    this.errorText,
    this.initialValue,
    this.defaultStartDate = false,
  }) : super(key: key);
  final String dateTitle;
  final String dateHint;
  String? errorText;
  DateTime? initialValue;
  bool defaultStartDate;
  final void Function(String) onSelectedValueChanged;

  @override
  State<CustomDateWidget> createState() => _CustomDateWidgetState();
}

class _CustomDateWidgetState extends State<CustomDateWidget> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _selectedDate = widget.initialValue;
    }

    if (_selectedDate != null) {
      if (widget.initialValue == null) {
        _selectedDate = DateTime.now();
      }
      _dateController.text =
          _selectedDate!.defaultFormat(context, applyAppLanguage: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomWidgetWithTitle(
      title: widget.dateTitle,
      isRequired: false,
      child: InkWell(
        onTap: () async {
          DateTime? pickedDate = await showRoundedDatePicker(context);
          if (pickedDate != null) {
            setState(() {
              _selectedDate = pickedDate;
              _dateController.text = pickedDate.defaultFormat(context);
              widget.onSelectedValueChanged(
                  pickedDate.defaultFormat(context, applyAppLanguage: false));
            });
          }
        },
        child: CustomTextFormFiled(
          enabled: false,
          controller: _dateController,
          keyboardType: TextInputType.number,
          fillColor: ColorManager.lightGrey6,
          hintText: widget.dateHint,
          errorText: widget.errorText,
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: AppPadding.p8),
            child: Transform.scale(
              scale: AppSize.s05,
              child: SvgPicture.asset(
                IconAssets.calendar,
                height: AppSize.s8,
                color: ColorManager.midGrey2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> showRoundedDatePicker(BuildContext context) async {
    DateTime? selectedDate;

    /// if there is initial date set it
    /// & check if there is no initial or also if the selected date in edit view is after today select today
    DateTime firstDate = widget.defaultStartDate
        ? DateTime(1996)
        : DateTime.now().isBefore(widget.initialValue ?? DateTime.now())
            ? DateTime.now()
            : widget.initialValue ?? DateTime.now();

    /// to avoid error when change from default to today date when already select old date
    if (widget.defaultStartDate == false &&
        (_selectedDate ?? DateTime.now()).isBefore(firstDate)) {
      _selectedDate = DateTime.now();
    }

    return await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s10),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  // header background color
                  primary: ColorManager.darkGreyBlue,
                  // header text color
                  onPrimary: ColorManager.white,
                  // body text color
                  onSurface: ColorManager.blueBlack,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        ColorManager.darkGreyBlue, // button text color
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        LocaleKeys.date.tr(),
                        style: getBoldLexendStyle(
                          color: ColorManager.darkGreyBlue,
                          fontSize: FontSize.s18.sp,
                        )),
                    SizedBox(height: AppSize.s2.h),
                    CalendarDatePicker(
                      initialDate: _selectedDate ?? DateTime.now(),
                      firstDate: firstDate,
                      lastDate: DateTime(2050),
                      onDateChanged: (DateTime newDate) {
                        selectedDate = newDate;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(LocaleKeys.cancel.tr(),
                              style: getMediumLexendStyle(
                                  color: ColorManager.red,
                                  fontSize: FontSize.s16.sp)),
                        ),
                        SizedBox(width: AppSize.s1.w),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(selectedDate);
                          },
                          child: Text(LocaleKeys.ok.tr(),
                              style: getMediumLexendStyle(
                                  color: ColorManager.darkGreyBlue,
                                  fontSize: FontSize.s16.sp)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
