import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/app/extension.dart';
import 'package:daily_flow/app/functions.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/home/manager/task_cubit.dart';
import 'package:daily_flow/presentation/resources/assets_manager.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

import 'tasks/task_view.dart';
import 'widgets/circular_border_icon_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: UserGreetingWidget(username: getUserFirstName()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.waterBlue,
        foregroundColor: ColorManager.waterBlue,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}

class UserGreetingWidget extends StatefulWidget {
  final String username;

  UserGreetingWidget({super.key, required this.username});

  @override
  State<UserGreetingWidget> createState() => _UserGreetingWidgetState();
}

class _UserGreetingWidgetState extends State<UserGreetingWidget> {
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  DateTime focusDate = DateTime.now();
  TaskCubit taskCubit = instance<TaskCubit>();

  @override
  Widget build(BuildContext context) {
    setStatusBarTextBlack();

    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        IconAssets.avatar,
                        height: AppSize.s50,
                      ),
                      SizedBox(width: AppSize.s4.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.hello.tr(),
                            style: getRegularLexendStyle(
                              fontSize: AppSize.s16,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            widget.username,
                            style: getBoldLexendStyle(
                              fontSize: FontSize.s18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Icons (Calendar and Notification)
                Row(
                  children: [
                    CircularBorderIconButton(
                      iconAsset: IconAssets.calendar,
                      onPressed: () {},
                    ),
                    SizedBox(width: AppSize.s4.w),
                    CircularBorderIconButton(
                      iconAsset: IconAssets.notification,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppSize.s3.h),
            EasyInfiniteDateTimeLine(
              controller: _controller,
              firstDate: DateTime.now(),
              focusDate: focusDate,
              lastDate: DateTime(2025),
              activeColor: ColorManager.waterBlue,
              showTimelineHeader: true,
              dayProps: EasyDayProps(
                dayStructure: DayStructure.dayStrDayNum,
                disabledDayStyle: const DayStyle(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSize.s16)),
                    color: ColorManager.lightGrey6,
                  ),
                ),
                activeDayStyle: DayStyle(
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s16)),
                    color: ColorManager.waterBlue,
                  ),
                ),
              ),
              headerBuilder: (context, selectedDate) {
                return Padding(
                  padding: const EdgeInsets.all(AppPadding.p8)
                      .copyWith(bottom: AppPadding.p24),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      DateFormat('MMMM yyyy',
                              Localizations.localeOf(context).languageCode)
                          .format(selectedDate),
                      textAlign: TextAlign.start,
                      style: getSemiBoldLexendStyle(
                        fontSize: FontSize.s17.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
              onDateChange: (selectedDate) {
                setState(() {
                  focusDate = selectedDate;
                });
                taskCubit.getTasksList(context, focusDate.defaultToSend());
              },
            ),
            SizedBox(height: AppSize.s3.h),
            TaskView(
                taskCubit: taskCubit, selectedDate: focusDate.defaultToSend())
          ],
        ),
      ),
    );
  }
}
