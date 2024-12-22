import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/app/extension.dart';
import 'package:daily_flow/app/functions.dart';
import 'package:daily_flow/data/responses/task/task_response.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/add_scheduler/manager/add_task_cubit.dart';
import 'package:daily_flow/presentation/add_scheduler/view/widgets/action_buttons.dart';
import 'package:daily_flow/presentation/add_scheduler/view/widgets/category_selector.dart';
import 'package:daily_flow/presentation/add_scheduler/view/widgets/priority_selector.dart';
import 'package:daily_flow/presentation/home/manager/task_cubit.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:daily_flow/presentation/widgets/custom_auth_text_field.dart';
import 'package:daily_flow/presentation/widgets/custom_date_widget.dart';
import 'package:daily_flow/presentation/widgets/custom_time_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:ui' as ui;

class AddScheduleView extends StatefulWidget {
  AddScheduleView({super.key});

  @override
  State<AddScheduleView> createState() => _AddScheduleViewState();
}

class _AddScheduleViewState extends State<AddScheduleView> {
  AddTaskCubit addTaskCubit = instance<AddTaskCubit>();
  TaskCubit taskCubit = instance<TaskCubit>();
  final TextEditingController _nameController = TextEditingController();
  bool isLoading = false;
  bool isAllValid = false;
  String? taskNameErrorMsg;
  String? priorityErrorMsg;
  final _formKey = GlobalKey<FormState>();

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
                  PrioritySelector(
                    onPriorityChanged: (String value) {
                      addTaskCubit.requestModel.meta = MetaResponse(priority: value);
                    },
                  ),
                  SizedBox(height: AppSize.s2.h),
                  CategorySelector(),
                  SizedBox(height: AppSize.s2.h),
                  BlocProvider<AddTaskCubit>(
                      create: (BuildContext context) => addTaskCubit,
                      child: BlocConsumer<AddTaskCubit, AddTaskState>(
                        builder: (context, state) {
                          return ActionButtons(
                            func: () {
                              addTaskCubit.addTask();
                            }, isLoading: isLoading,
                          );
                        },
                        listener: (BuildContext context, AddTaskState state) {
                          if (state is AddTaskLoading) {
                            isLoading = true;
                          } else if (state is AddTaskSuccess) {
                            isLoading = false;
                            taskCubit.getTasksList(
                                context, DateTime.now().defaultToSend());
                            Navigator.of(context).pop();
                          } else if (state is AddTaskFailure) {
                            isLoading = false;
                            Fluttertoast.showToast(
                                msg: state.errorMsg,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: FontSize.s16.sp);
                          } else if (state is TaskNameValidationState) {
                            taskNameErrorMsg = state.error;
                            addTaskCubit.isAllValid(_nameController.text);
                          } else if (state is PriorityValidationState) {
                            priorityErrorMsg = state.error;
                            addTaskCubit.isAllValid(_nameController.text);
                          } else if (state is CreateTaskIsAllValidState) {
                            isAllValid = state.isAllValid;
                          }
                        },
                      ))
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
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s16)),
    ),
    builder: (_) => AddScheduleView(),
  );
}
