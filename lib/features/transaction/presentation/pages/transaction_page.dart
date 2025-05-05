import 'package:expense_tracker_pro/common/appbars/basic_app_bar.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';
import 'package:expense_tracker_pro/features/transaction/presentation/widgets/slidable_widget.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  final List<Transaction> listData;
  const TransactionPage({super.key, required this.listData});

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
        child:
            widget.listData.isEmpty
                ? Center(
                  child: Text(
                    'No Transactions available.',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                )
                : SlidableWidget(listData: widget.listData),
      ),
    );
  }
}
