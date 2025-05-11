import 'package:expense_tracker_pro/common/appbars/basic_app_bar.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/widgets/dropdown_widget.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/widgets/line_chart_widget.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/widgets/list_chart_view_widget.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/widgets/top_spending_widget.dart';
import 'package:flutter/material.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Statistics'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const ListChartViewWidget(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [DropdownWidget()],
            ),
            Container(
              margin: const EdgeInsets.only(right: 40),
              width: double.infinity,
              height: 180,
              child: const LineChartWidget(),
            ),
            const TopSpendingWidget(),
          ],
        ),
      ),
    );
  }
}
