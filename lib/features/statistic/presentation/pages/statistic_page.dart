import 'package:expense_tracker_pro/common/appbars/basic_app_bar.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/widgets/line_chart_widget.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/widgets/list_chart_view_widget.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/widgets/top_spending_widget.dart';
import 'package:flutter/material.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Statistics'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const ListChartViewWidget(),
            Container(
              margin: const EdgeInsets.only(right: 40),
              width: double.infinity,
              height: 250,
              child: const LineChartWidget(),
            ),
            const TopSpendingWidget(),
          ],
        ),
      ),
    );
  }
}
