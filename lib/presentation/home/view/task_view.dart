import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/domain/model/task/task_model.dart';
import 'package:daily_flow/presentation/home/manager/task_cubit.dart';
import 'package:daily_flow/presentation/home/view/tasks/task_card.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:daily_flow/presentation/widgets/empty_list.dart';
import 'package:daily_flow/presentation/widgets/refresh_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/task_shimmer.dart';

class TaskView extends StatefulWidget {
  TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  TaskCubit taskCubit = instance<TaskCubit>();

  late List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>(
        create: (BuildContext context) => taskCubit..getTasksList(context),
        child: BlocConsumer<TaskCubit, TaskState>(
          builder: (BuildContext context, TaskState state) {
            if (state is TaskLoading) {
              return Center(
                child: ListView.builder(
                    padding: const EdgeInsets.all(AppPadding.p18),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return TaskShimmer(
                        showStartVertlLine: false,
                        showSubLine: false,
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
                      ? Container(
                          height: 250,
                          child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  vertical: AppPadding.p6,
                                  horizontal: AppPadding.p12),
                              itemCount: tasks.length,
                              itemBuilder: (context, index) {
                                return TaskCard(model: tasks[index]);
                              }),
                        )
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
    taskCubit.getTasksList(context);
  }
}
