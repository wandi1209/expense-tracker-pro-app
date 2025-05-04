import 'package:expense_tracker_pro/common/listviews/transaction_listview.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

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
        TransactionListview(
          listData: [
            Transaction(
              id: '0',
              userId: '002',
              amount: 12000,
              transactionType: 'expense',
              remarks: 'Nonton Film',
              createdAt: DateTime.now(),
            ),
            Transaction(
              id: '1',
              userId: '003',
              amount: 14000,
              transactionType: 'income',
              remarks: 'Testing 2',
              createdAt: DateTime.now(),
            ),
            Transaction(
              id: '2',
              userId: '003',
              amount: 14000,
              transactionType: 'expense',
              remarks: 'Testing 3',
              createdAt: DateTime(2024, 9, 12),
            ),
          ],
        ),
      ],
    );
  }
}
