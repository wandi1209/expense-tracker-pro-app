import 'package:expense_tracker_pro/common/appbars/basic_app_bar.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/bloc/statistic_bloc.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/widgets/dropdown_widget.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/widgets/line_chart_widget.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/widgets/list_chart_view_widget.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/widgets/top_spending_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  bool top = true;
  final List<String> types = ['Expense', 'Income'];
  String selectedType = 'Expense';
  void onChangedType(String newType) {
    setState(() {
      selectedType = newType;
      _getTop();
    });
  }

  void onChangedTop() {
    setState(() {
      top = !top;
      _getTop();
    });
  }

  @override
  void initState() {
    _getTop();
    super.initState();
  }

  void _getTop() {
    context.read<StatisticBloc>().add(
      StatisticEventGetTopTransactions(
        top: top,
        type: selectedType.toLowerCase(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Statistics'),
      body: BlocConsumer<StatisticBloc, StatisticState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const ListChartViewWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DropdownWidget(
                      selectedType: selectedType,
                      types: types,
                      onChanged: onChangedType,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 40),
                  width: double.infinity,
                  height: 180,
                  child: const LineChartWidget(),
                ),
                state is StatisticGetTopTransactionsSuccess
                    ? TopSpendingWidget(changedTop: onChangedTop)
                    : const SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}
