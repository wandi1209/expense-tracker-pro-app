import '../../../../common/listviews/transaction_listview.dart';
import '../../../transaction/data/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryWidget extends StatefulWidget {
  final List<TransactionModel> lisData;

  const HistoryWidget({super.key, required this.lisData});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Transactions History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () => context.push('/transactions'),
              child: const Text('See All'),
            ),
          ],
        ),
        widget.lisData == []
            ? const Center(child: Text('No Transactions Available.'))
            : TransactionListview(listData: widget.lisData),
      ],
    );
  }
}
