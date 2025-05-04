import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListview extends StatelessWidget {
  final formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp. ',
    decimalDigits: 0,
  );
  final List<Transaction> listData;

  TransactionListview({super.key, required this.listData});

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final inputDate = DateTime(date.year, date.month, date.day);

    if (inputDate == today) {
      return 'Today';
    } else if (inputDate == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('MMM d, yyyy').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Transaction data = listData[index];
        bool isExpense = data.transactionType == 'expense';
        String symbol = isExpense ? '-' : '+';
        return ListTile(
          title: Text(
            data.remarks,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(formatDate(data.createdAt)),
          leading: CircleAvatar(
            radius: 20,
            backgroundColor:
                isExpense ? Colors.red.shade400 : Colors.green.shade600,
            child: Icon(
              isExpense ? Icons.arrow_upward : Icons.arrow_downward,
              color: Colors.white,
            ),
          ),
          trailing: Text(
            '$symbol ${formatter.format(data.amount)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isExpense ? Colors.red.shade400 : Colors.green.shade600,
            ),
          ),
        );
      },
    );
  }
}
