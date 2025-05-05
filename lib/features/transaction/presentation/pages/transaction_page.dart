import 'package:expense_tracker_pro/common/appbars/basic_app_bar.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';
import 'package:expense_tracker_pro/features/transaction/presentation/widgets/slidable_widget.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Transactions'),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            SlidableWidget(
              listData: [
                Transaction(
                  id: '01',
                  userId: '01',
                  amount: 12000,
                  transactionType: 'expense',
                  remarks: 'Mabar ML',
                  createdAt: DateTime.now(),
                ),
                Transaction(
                  id: '01',
                  userId: '01',
                  amount: 12000,
                  transactionType: 'income',
                  remarks: 'Freelance',
                  createdAt: DateTime.now(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
