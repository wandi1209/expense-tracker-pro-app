import 'package:expense_tracker_pro/common/sheet/sheet_edit_widget.dart';
import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:expense_tracker_pro/core/utils/formatter.dart';
import 'package:expense_tracker_pro/features/transaction/domain/entities/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class SlidableWidget extends StatelessWidget {
  final List<Transaction> listData;

  const SlidableWidget({super.key, required this.listData});

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

        return Slidable(
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                backgroundColor: AppColors.primary,
                icon: Icons.edit,
                foregroundColor: Colors.white,
                label: 'Edit',
                onPressed: (context) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      
                      return const SheetEditWidget();
                    },
                  );
                },
              ),
              SlidableAction(
                backgroundColor: Colors.red.shade500,
                icon: Icons.delete,
                foregroundColor: Colors.white,
                label: 'Delete',
                onPressed: (context) {},
              ),
            ],
          ),
          child: ListTile(
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
              '$symbol ${rupiahFormatter.format(data.amount)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isExpense ? Colors.red.shade400 : Colors.green.shade600,
              ),
            ),
          ),
        );
      },
    );
  }
}
