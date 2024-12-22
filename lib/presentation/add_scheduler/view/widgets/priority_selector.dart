import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PrioritySelector extends StatefulWidget {
  @override
  _PrioritySelectorState createState() => _PrioritySelectorState();
}

class _PrioritySelectorState extends State<PrioritySelector> {
  String _selectedPriority = LocaleKeys.low.tr();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildPriorityChip(LocaleKeys.low.tr(), Colors.green, isSelected: _selectedPriority == LocaleKeys.low.tr()),
        _buildPriorityChip(LocaleKeys.med.tr(), Colors.yellow, isSelected: _selectedPriority == LocaleKeys.med.tr()),
        _buildPriorityChip(LocaleKeys.high.tr(), Colors.red, isSelected: _selectedPriority == LocaleKeys.high.tr()),
      ],
    );
  }

  Widget _buildPriorityChip(String label, Color color,
      {double radius = 10.0, double borderWidth = 0.5, required bool isSelected}) {
    return Expanded(
      child: ChoiceChip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s16),
          side: BorderSide(
            color: isSelected ? color : ColorManager.grey,
            width: borderWidth,
          ),
        ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: radius * 2,
              height: radius * 2,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppSize.s8),
            Text(label,style: getRegularLexendStyle(color: Colors.black),),
          ],
        ),
        labelStyle: getRegularLexendStyle(color: isSelected ? Colors.white : ColorManager.midBlack),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedPriority = label;
          });
        },
        backgroundColor: isSelected ? color : ColorManager.lightGrey6,
      ),
    );
  }
}
