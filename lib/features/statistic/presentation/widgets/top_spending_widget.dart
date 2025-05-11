import 'package:expense_tracker_pro/common/listviews/transaction_listview.dart';
import 'package:expense_tracker_pro/features/statistic/presentation/bloc/statistic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSpendingWidget extends StatefulWidget {
  const TopSpendingWidget({super.key});

  @override
  State<TopSpendingWidget> createState() => _TopSpendingWidgetState();
}

class _TopSpendingWidgetState extends State<TopSpendingWidget> {
  @override
  void initState() {
    context.read<StatisticBloc>().add(
      StatisticEventGetTopTransactions(top: true, type: 'expense'),
    );
    super.initState();
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
                          onTap: () {},
                          child: const Icon(Icons.swap_vert),
                        ),
                      ],
                    ),
                    TransactionListview(listData: state.topTransactions),
                  ],
                ),
              ),
            );
          } else if (state is StatisticStateFailure) {
            return Text('${state.error}');
          }
          return Text('data');
        },
      ),
    );
  }
}
