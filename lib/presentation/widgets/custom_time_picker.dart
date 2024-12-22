import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:daily_flow/app/functions.dart';
import 'package:daily_flow/presentation/resources/assets_manager.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';

import 'custom_textfield.dart';
import 'custom_widget_with_title.dart';

class CustomTimePicker extends StatefulWidget {
  CustomTimePicker({
    Key? key,
    required this.timeTitle,
    required this.timeHint,
    required this.onSelectedValueChanged,
    this.errorText,
    this.initialValue,
    this.isFromEdit = false,
    this.isRequired = false,
  }) : super(key: key);

  final String timeTitle;
  final String timeHint;
  String? errorText;
  TimeOfDay? initialValue;
  bool? isFromEdit;
  bool isRequired;
  final void Function(TimeOfDay) onSelectedValueChanged;

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TextEditingController _timeController = TextEditingController();
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialValue ?? TimeOfDay.now();
    // (Now it Solved) if we put the below code in build context below this will make default time
    // and if we not the time in edit not appear
    if (widget.isFromEdit == false) {
      setDefaultTime();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFromEdit ?? false) {
      setDefaultTime();
    }
    return CustomWidgetWithTitle(
      title: widget.timeTitle,
      isRequired: widget.isRequired,
      child: InkWell(
        onTap: () async {
          TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: _selectedTime,
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: TimePickerTheme(
                  data: TimePickerThemeData(backgroundColor: Colors.white,
                      hourMinuteColor: WidgetStateColor.resolveWith(
                          (states) => states.contains(WidgetState.selected)
                              ? ColorManager.darkGreyBlue
                              : ColorManager.grey),
                      hourMinuteTextColor: WidgetStateColor.resolveWith(
                          (states) => states.contains(WidgetState.selected)
                              ? ColorManager.white
                              : Colors.black),
                      dialHandColor: ColorManager.darkGreyBlue,
                      dayPeriodColor: ColorManager.darkGreyBlue,
                      dayPeriodTextColor:
                      WidgetStateColor.resolveWith((states) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.white;
                        } else {
                          return ColorManager
                              .darkGreyBlue; // Default background color for unselected
                        }
                      })),
                  child: child!,
                ),
              );
            },
          );
          if (pickedTime != null) {
            setState(() {
              _selectedTime = pickedTime;
              _timeController.text = formatTime(pickedTime, context).toString();
              widget.onSelectedValueChanged(pickedTime);
            });
          }
        },
        child: CustomTextFormFiled(
          enabled: false,
          controller: _timeController,
          keyboardType: TextInputType.number,
          fillColor: ColorManager.lightGrey6,
          hintText: widget.timeHint,
          errorText: widget.errorText,
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: AppPadding.p8),
            child: Transform.scale(
              scale: AppSize.s05,
              child: SvgPicture.asset(
                IconAssets.time,
                height: AppSize.s8,
                color: ColorManager.midGrey2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  setDefaultTime() {
    _timeController = TextEditingController(
        text: formatTime(_selectedTime, context).toString());
  }
}
