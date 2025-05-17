import '../../../../common/listviews/transaction_listview.dart';
import '../bloc/statistic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSpendingWidget extends StatefulWidget {
  final VoidCallback changedTop;

  const TopSpendingWidget({super.key, required this.changedTop});

  @override
  State<TopSpendingWidget> createState() => _TopSpendingWidgetState();
}

class _TopSpendingWidgetState extends State<TopSpendingWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top Spending',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.changedTop();
                    },
                    child: const Icon(Icons.swap_vert),
                  ),
                ],
              ),
              BlocBuilder<StatisticBloc, StatisticState>(
                buildWhen:
                    (previous, current) =>
                        current is StatisticGetTopTransactionsSuccess,
                builder: (context, state) {
                  if (state is StatisticGetTopTransactionsSuccess) {
                    if (state.topTransactions.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 40),
                            Icon(Icons.inbox, size: 30, color: Colors.grey),
                            SizedBox(height: 12),
                            Text(
                              'No Transactions Available.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return TransactionListview(
                        listData: state.topTransactions,
                      );
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
