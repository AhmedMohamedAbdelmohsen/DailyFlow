import 'package:daily_flow/app/functions.dart';
import 'package:daily_flow/domain/model/task/task_model.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      child: GestureDetector(
        onTap: (){
          copyToClipboard(context, widget.model.description);
        },
        child: Row(
          children: [
            Container(
              width: AppSize.s4,
              height: double.infinity,
              decoration: BoxDecoration(
                color: widget.model.color,
                borderRadius: BorderRadius.circular(AppSize.s2),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsetsDirectional.only(end: AppSize.s16),
                padding: const EdgeInsetsDirectional.all(AppPadding.p12),
                decoration: BoxDecoration(
                  color: widget.model.color?.withOpacity(0.25),
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
                            style: getMediumLexendStyle(
                              fontSize: FontSize.s14,
                              color: ColorManager.midGrey2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSize.s8),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.copy,
                          size: AppSize.s24, color: Colors.green),
                      color: Colors.blue, // Icon color
                      iconSize: AppSize.s24, // Icon size
                      onPressed: () {
                        copyToClipboard(context, widget.model.description);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void launchUrlExternally(String url) {
    launchUrlString(url, mode: LaunchMode.externalApplication);
  }
}
