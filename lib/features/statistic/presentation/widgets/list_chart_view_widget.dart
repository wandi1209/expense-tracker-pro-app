import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:expense_tracker_pro/core/utils/enum.dart';
import 'package:flutter/material.dart';

class ListChartViewWidget extends StatelessWidget {
  final DateFilter selectedDate;
  final ValueChanged<DateFilter> onChangedDateFilter;
  const ListChartViewWidget({
    super.key,
    required this.onChangedDateFilter,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            onChangedDateFilter(DateFilter.day);
          },
          child: Container(
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color:
                  selectedDate == DateFilter.day
                      ? AppColors.primary
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Day',
                style: TextStyle(
                  color:
                      selectedDate == DateFilter.day
                          ? Colors.white
                          : Colors.grey.shade600,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onChangedDateFilter(DateFilter.week);
          },
          child: Container(
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color:
                  selectedDate == DateFilter.week
                      ? AppColors.primary
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Week',
                style: TextStyle(
                  color:
                      selectedDate == DateFilter.week
                          ? Colors.white
                          : Colors.grey.shade600,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onChangedDateFilter(DateFilter.month);
          },
          child: Container(
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color:
                  selectedDate == DateFilter.month
                      ? AppColors.primary
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Month',
                style: TextStyle(
                  color:
                      selectedDate == DateFilter.month
                          ? Colors.white
                          : Colors.grey.shade600,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onChangedDateFilter(DateFilter.year);
          },
          child: Container(
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color:
                  selectedDate == DateFilter.year
                      ? AppColors.primary
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Year',
                style: TextStyle(
                  color:
                      selectedDate == DateFilter.year
                          ? Colors.white
                          : Colors.grey.shade600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
