import 'package:expense_tracker_pro/common/listviews/transaction_listview.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';
import 'package:flutter/material.dart';

class TopSpendingWidget extends StatelessWidget {
  const TopSpendingWidget({super.key});

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
                    onTap: () {},
                    child: const Icon(Icons.swap_vert),
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
          ),
        ),
      ),
    );
  }
}
