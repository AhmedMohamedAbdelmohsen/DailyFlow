import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/app/functions.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/add_scheduler/manager/add_task_cubit.dart';
import 'package:daily_flow/presentation/add_scheduler/view/widgets/category_selector.dart';
import 'package:daily_flow/presentation/add_scheduler/view/widgets/priority_selector.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:daily_flow/presentation/widgets/custom_auth_text_field.dart';
import 'package:daily_flow/presentation/widgets/custom_date_widget.dart';
import 'package:daily_flow/presentation/widgets/custom_time_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:ui' as ui;

class AddScheduleView extends StatefulWidget {
  AddScheduleView({super.key});

  @override
  State<AddScheduleView> createState() => _AddScheduleViewState();
}

class _AddScheduleViewState extends State<AddScheduleView> {
  AddTaskCubit addTaskCubit = instance<AddTaskCubit>();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  String? taskNameErrorMsg;
  String? priorityErrorMsg;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 0.8,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(AppSize.s40)),
          ),
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: AppSize.s40,
                      height: AppSize.s4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(AppSize.s2),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s2.h),
                  Text(
                    LocaleKeys.newTask.tr(),
                    style: getMediumLexendStyle(
                      fontSize: FontSize.s20.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: AppSize.s1.h),
                  CustomAuthFormFiled(
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                    cursorColor: ColorManager.darkGreyBlue,
                    autofillHints: const [AutofillHints.name],
                    textInputAction: TextInputAction.next,
                    hintText: LocaleKeys.taskName.tr(),
                    labelText: null,
                    onChanged: addTaskCubit.updateTaskName,
                    errorText: taskNameErrorMsg,
                    textDirection: isRTL(context)
                        ? ui.TextDirection.rtl
                        : ui.TextDirection.ltr,
                  ),
                  CustomDateWidget(
                    initialValue: DateTime.now(),
                    defaultStartDate: true,
                    errorText: null,
                    dateTitle: '',
                    dateHint: LocaleKeys.date.tr(),
                    onSelectedValueChanged: (date) {},
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTimePicker(
                          isFromEdit: false,
                          initialValue: const TimeOfDay(hour: 1, minute: 0),
                          errorText: null,
                          isRequired: false,
                          timeTitle: '',
                          timeHint: LocaleKeys.start.tr(),
                          onSelectedValueChanged: (v) {},
                        ),
                      ),
                      SizedBox(width: AppSize.s5.h),
                      Expanded(
                        child: CustomTimePicker(
                          isFromEdit: false,
                          initialValue: const TimeOfDay(hour: 4, minute: 0),
                          errorText: null,
                          isRequired: false,
                          timeTitle: '',
                          timeHint: LocaleKeys.end.tr(),
                          onSelectedValueChanged: (v) {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s2.h),
                  Text(
                    LocaleKeys.priority.tr(),
                    style: getRegularLexendStyle(
                        color: ColorManager.midBlack,
                        fontSize: FontSize.s18.sp),
                  ),
                  SizedBox(height: AppSize.s2.h),
                  PrioritySelector(),
                  SizedBox(height: AppSize.s2.h),
                  CategorySelector(),
                  const SizedBox(height: AppSize.s24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          LocaleKeys.cancel.tr(),
                          style: getRegularLexendStyle(color: ColorManager.midBlack,fontSize: FontSize.s16.sp),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.s32, vertical: AppSize.s12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s8),
                          ),
                        ),
                        child: Text(
                          LocaleKeys.createTask.tr(),
                          style: getRegularLexendStyle(color: Colors.white,fontSize: FontSize.s16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void showNewTaskBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s16)),
    ),
    builder: (_) => AddScheduleView(),
  );
}
