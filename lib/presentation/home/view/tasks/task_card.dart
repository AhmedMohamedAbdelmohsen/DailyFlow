import 'package:daily_flow/domain/model/task/task_model.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TaskCard extends StatefulWidget {
  final TaskModel model;

  const TaskCard({super.key, required this.model});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: AppSize.s4,
            height: double.infinity,
            decoration: BoxDecoration(
              color:  widget.model.color,
              borderRadius: BorderRadius.circular(AppSize.s2),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsetsDirectional.only(end: AppSize.s16),
              padding: const EdgeInsetsDirectional.all(AppPadding.p12),
              decoration: BoxDecoration(
                color:  widget.model.color?.withOpacity(0.25),
                borderRadius: BorderRadius.circular(AppSize.s12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.description,
                          style: const TextStyle(
                            fontSize: FontSize.s16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                         SizedBox(height: AppSize.s2.h),
                        Text(
                         widget.model.startTime,
                          style:  getMediumLexendStyle(
                            fontSize: FontSize.s14,
                            color: ColorManager.midGrey2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSize.s8),
                  Container(
                    width: AppSize.s18,
                    height: AppSize.s18,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
