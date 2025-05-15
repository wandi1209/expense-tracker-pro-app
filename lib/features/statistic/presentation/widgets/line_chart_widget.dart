import '../../../../core/configs/theme/app_colors.dart';
import '../../../../core/utils/enum.dart';
import '../bloc/statistic_bloc.dart';
import '../../../transaction/data/models/transaction_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LineChartWidget extends StatefulWidget {
  final DateFilter selectedDate;
  const LineChartWidget({super.key, required this.selectedDate});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticBloc, StatisticState>(
      buildWhen: (previous, current) => current is StatisticGetByFilterSuccess,
      builder: (context, state) {
        if (state is StatisticGetByFilterSuccess) {
          List<TransactionModel> data = state.transactions;
          double getMax() {
            double max = 0;
            for (var element in data) {
              if (element.amount > max) {
                max = element.amount;
              }
            }
            return max;
          }

          return LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              minX: 0,
              maxX: widget.selectedDate == DateFilter.week ? 7 : 12,
              minY: 0,
              maxY: getMax() + 20000,
              lineBarsData: [
                LineChartBarData(
                  color: AppColors.primary,
                  spots: _generateFlSpots(data, widget.selectedDate),
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
                      String text = '';
                      if (widget.selectedDate == DateFilter.week) {
                        switch (value.toInt()) {
                          case 1:
                            text = 'Mon';
                          case 2:
                            text = 'Tue';
                          case 3:
                            text = 'Wed';
                          case 4:
                            text = 'Thu';
                          case 5:
                            text = 'Fri';
                          case 6:
                            text = 'Sat';
                          case 7:
                            text = 'Sun';
                        }
                      } else {
                        switch (value.toInt()) {
                          case 1:
                            text = 'Jan';
                          case 3:
                            text = 'Mar';
                          case 5:
                            text = 'May';
                          case 7:
                            text = 'Jun';
                          case 9:
                            text = 'Sep';
                          case 11:
                            text = 'Nov';
                        }
                      }

                      return SideTitleWidget(
                        meta: meta,
                        space: 12,
                        child: Text(text),
                      );
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
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  AxisTitles _axisTiles() {
    return const AxisTitles(sideTitles: SideTitles(showTitles: false));
  }
}

List<FlSpot> _generateFlSpots(List<TransactionModel> data, DateFilter filter) {
  // Inisialisasi spotMap dengan semua nilai 0 agar tetap tampil di grafik
  Map<int, double> spotMap = {};

  if (filter == DateFilter.week) {
    for (int i = 1; i <= 7; i++) {
      spotMap[i] = 0;
    }
    for (var transaction in data) {
      final day = transaction.createdAt.weekday;
      spotMap[day] = (spotMap[day] ?? 0) + transaction.amount;
    }
  } else {
    for (int i = 1; i <= 12; i++) {
      spotMap[i] = 0;
    }
    for (var transaction in data) {
      final month = transaction.createdAt.month;
      spotMap[month] = (spotMap[month] ?? 0) + transaction.amount;
    }
  }

  // Konversi ke FlSpot dan urutkan berdasarkan x
  return spotMap.entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList()
    ..sort((a, b) => a.x.compareTo(b.x));
}
