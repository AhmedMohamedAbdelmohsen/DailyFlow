import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  String _selectedCategory = LocaleKeys.work.tr();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.lightGrey6,
        borderRadius: BorderRadius.all( Radius.circular(AppSize.s20)),
      ),
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.categories.tr(),
            style: getRegularLexendStyle(
              color: ColorManager.midBlack,
              fontSize: FontSize.s18.sp,
            ),
          ),
          SizedBox(height: AppSize.s2.h),
          Row(
            children: [
              _buildCategoryChip(LocaleKeys.work.tr(), Colors.blue,
                  isSelected: _selectedCategory == LocaleKeys.work.tr()),
              SizedBox(width: AppSize.s2.h),
              _buildCategoryChip(LocaleKeys.personal.tr(), Colors.purple,
                  isSelected: _selectedCategory == LocaleKeys.personal.tr()),
              SizedBox(width: AppSize.s2.w),
              CircleAvatar(
                radius: AppSize.s20,
                backgroundColor: Colors.grey[300],
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, Color color,
      {required bool isSelected}) {
    return ChoiceChip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s16),
        side: BorderSide(
          color: isSelected ? color : ColorManager.grey,
        ),
      ),
      label: Text(
        label,
        style: getRegularLexendStyle(
          color: isSelected ? ColorManager.midBlack : Colors.white,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedCategory = label;
        });
      },
      backgroundColor: color,
    );
  }
}
