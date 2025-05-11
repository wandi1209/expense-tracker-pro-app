import 'package:expense_tracker_pro/common/listviews/transaction_listview.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/bloc/statistic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSpendingWidget extends StatefulWidget {
  final String selectedType;
  const TopSpendingWidget({super.key, required this.selectedType});

  @override
  State<TopSpendingWidget> createState() => _TopSpendingWidgetState();
}

class _TopSpendingWidgetState extends State<TopSpendingWidget> {
  bool top = true;

  @override
  void initState() {
    _getTop();
    super.initState();
  }

  void _getTop() {
    context.read<StatisticBloc>().add(
      StatisticEventGetTopTransactions(
        top: top,
        type: widget.selectedType.toLowerCase(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<StatisticBloc, StatisticState>(
        builder: (context, state) {
          if (state is StatisticStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StatisticGetTopTransactionsSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Top Spending',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              top = !top;
                              _getTop();
                            });
                          },
                          child: const Icon(Icons.swap_vert),
                        ),
                      ],
                    ),
                    TransactionListview(listData: state.topTransactions),
                  ],
                ),
              ),
            );
          }
          return const Text('No data available');
        },
      ),
    );
  }
}
