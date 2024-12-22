import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/domain/model/task/task_model.dart';
import 'package:daily_flow/presentation/home/manager/task_cubit.dart';
import 'package:daily_flow/presentation/home/view/tasks/task_card.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:daily_flow/presentation/widgets/empty_list.dart';
import 'package:daily_flow/presentation/widgets/refresh_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'task_shimmer.dart';

class TaskView extends StatefulWidget {
 final TaskCubit taskCubit;
 final String selectedDate;

  TaskView({super.key,required this.taskCubit,required this.selectedDate});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {

  late List<TaskDataModel> tasks;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>(
        create: (BuildContext context) => widget.taskCubit..getTasksList(context,widget.selectedDate),
        child: BlocConsumer<TaskCubit, TaskState>(
          builder: (BuildContext context, TaskState state) {
            if (state is TaskLoading) {
              return Center(
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(AppPadding.p18),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return TaskShimmer(
                        showStartVertlLine: true,
                        showSubLine: true,
                      );
                    }),
              );
            } else if (state is TaskSuccess) {
              tasks = state.tasksList;

              return RefreshWidget(
                  onRefresh: () async {
                    refreshFunc(context);
                  },
                  widgetChild: (tasks.isNotEmpty)
                      ? ListView.builder(
                        shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p6,
                              horizontal: AppPadding.p12),
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: EdgeInsets.only(bottom: AppSize.s2.h),
                                child: TaskCard(model: tasks[index]));
                          })
                      : EmptyListWidget(errorSubTitle: ''));
            } else if (state is TaskFailure) {
              return EmptyListWidget(
                  errorSubTitle: state.errorMsg, errorTitle: '');
            } else {
              return EmptyListWidget(errorSubTitle: '');
            }
          },
          listener: (BuildContext context, TaskState state) {},
        ));
  }

  refreshFunc(BuildContext context) {
    widget.taskCubit.getTasksList(context,widget.selectedDate);
  }
}
