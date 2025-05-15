import '../../../../common/appbars/basic_app_bar.dart';
import '../../../../core/utils/enum.dart';
import '../bloc/statistic_bloc.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/line_chart_widget.dart';
import '../widgets/list_chart_view_widget.dart';
import '../widgets/top_spending_widget.dart';
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
  DateFilter selectedDate = DateFilter.week;

  void onChangedDateFilter(DateFilter dateFilter) {
    setState(() {
      selectedDate = dateFilter;
    });
  }

  void onChangedType(String newType) {
    setState(() {
      selectedType = newType;
      _getTop();
      _getTransByFilter();
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
    super.initState();
    _getTop();
    _getTransByFilter();
  }

  void _getTop() {
    context.read<StatisticBloc>().add(
      StatisticEventGetTopTransactions(
        top: top,
        type: selectedType.toLowerCase(),
      ),
    );
  }

  void _getTransByFilter() {
    context.read<StatisticBloc>().add(
      StatisticEventGetTransactionsByFilter(
        dateFilter: selectedDate,
        type: selectedType.toLowerCase(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Statistics'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListChartViewWidget(
                  selectedDate: selectedDate,
                  onChangedDateFilter: onChangedDateFilter,
                ),
                DropdownWidget(
                  selectedType: selectedType,
                  types: types,
                  onChanged: onChangedType,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(right: 40),
              width: double.infinity,
              height: 180,
              child: LineChartWidget(selectedDate: selectedDate),
            ),
            TopSpendingWidget(changedTop: onChangedTop),
          ],
        ),
      ),
    );
  }
}
