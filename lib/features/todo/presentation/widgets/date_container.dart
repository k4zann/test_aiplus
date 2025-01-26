import 'package:flutter/material.dart';
import 'package:test_aiplus/core/constants/app_colors.dart';
import 'package:test_aiplus/core/extensions/datetime_extension.dart';

class DateContainer extends StatelessWidget {
  const DateContainer({super.key, required this.day, required this.isSelected, required this.onTap});

  final Function() onTap;
  final DateTime day;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightBeige : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.grey,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(children: [
          Text(
            day.getShortWeekDay().toUpperCase(),
            style: TextStyle(
              color: isSelected ? AppColors.primaryText : AppColors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            day.day.toString(),
            style: TextStyle(
              color: isSelected ? AppColors.primaryText : AppColors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ]),
      ),
    );
  }
}
