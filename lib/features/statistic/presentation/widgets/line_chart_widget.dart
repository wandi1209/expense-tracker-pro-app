import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:expense_tracker_pro/core/utils/enum.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final DateFilter selectedDate;
  const LineChartWidget({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: selectedDate == DateFilter.week ? 7 : 12,
        minY: 0,
        maxY: 100000,
        lineBarsData: [
          LineChartBarData(
            color: AppColors.primary,
            spots: [
              const FlSpot(1, 20000),
              const FlSpot(2, 10000),
              const FlSpot(3, 30000),
              const FlSpot(4, 10000),
              const FlSpot(5, 80000),
              const FlSpot(6, 40000),
              const FlSpot(7, 30000),
            ],
            isCurved: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withAlpha(100),
                  AppColors.primary.withAlpha(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                if (selectedDate == DateFilter.week) {
                  switch (value.toInt()) {
                    case 1:
                      return const Text('Mon');
                    case 2:
                      return const Text('Tue');
                    case 3:
                      return const Text('Wed');
                    case 4:
                      return const Text('Thu');
                    case 5:
                      return const Text('Fri');
                    case 6:
                      return const Text('Sat');
                    case 7:
                      return const Text('Sun');
                    default:
                      return const Text('');
                  }
                } else {
                  switch (value.toInt()) {
                    case 1:
                      return const Text('Jan');
                    case 3:
                      return const Text('Mar');
                    case 5:
                      return const Text('Mei');
                    case 7:
                      return const Text('Jul');
                    case 9:
                      return const Text('Sep');
                    case 11:
                      return const Text('Nov');
                    default:
                      return const Text('');
                  }
                }
              },
            ),
          ),
          leftTitles: _axisTiles(),
          rightTitles: _axisTiles(),
          topTitles: _axisTiles(),
        ),
      ),
    );
  }

  AxisTitles _axisTiles() {
    return const AxisTitles(sideTitles: SideTitles(showTitles: false));
  }
}
