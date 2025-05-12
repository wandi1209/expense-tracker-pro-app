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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
          const SizedBox(width: 20),
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
      ),
    );
  }
}
