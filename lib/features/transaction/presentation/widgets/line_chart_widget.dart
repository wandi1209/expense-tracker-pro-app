import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        borderData: FlBorderData(
          show: false, // Ini akan menghilangkan semua border di chart
        ),
        minX: 0,
        maxX: 7,
        minY: 0,
        maxY: 100000,
        lineBarsData: [
          LineChartBarData(
            color: AppColors.primary,
            spots: [
              FlSpot(1, 20000),
              FlSpot(2, 10000),
              FlSpot(3, 30000),
              FlSpot(4, 10000),
              FlSpot(5, 80000),
            ],
            isCurved: true,
            dotData: FlDotData(show: false),
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
              },
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      ),
    );
  }
}
