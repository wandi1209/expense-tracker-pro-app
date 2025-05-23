import 'dart:async';

import '../../../../common/dialogs/dialog_widget.dart';
import '../../../../common/sheet/sheet_edit_widget.dart';
import '../../../../core/configs/theme/app_colors.dart';
import '../../../../core/utils/formatter.dart';
import '../../domain/entities/transaction.dart';
import '../bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class SlidableWidget extends StatefulWidget {
  final List<Transaction> listData;

  const SlidableWidget({super.key, required this.listData});

  @override
  State<SlidableWidget> createState() => _SlidableWidgetState();
}

class _SlidableWidgetState extends State<SlidableWidget> {
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
      itemCount: widget.listData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Transaction data = widget.listData[index];
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
                onPressed: (ctx) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return SheetEditWidget(id: data.id);
                    },
                  );
                },
              ),
              BlocConsumer<TransactionBloc, TransactionState>(
                listener: (ctx, state) {
                  if (state is DeleteTransactionSuccess) {
                    final dialog = successDialog(context, state.message);
                    dialog.show();
                    Timer(const Duration(seconds: 2), () {
                      if (mounted) {
                        dialog.dismiss();
                      }
                    });
                  } else if (state is TransactionFailure) {
                    final dialog = errorDialog(context, state.error);
                    dialog.show();
                    Timer(const Duration(seconds: 2), () {
                      if (mounted) {
                        dialog.dismiss();
                      }
                    });
                  }
                },
                builder: (contexts, state) {
                  return SlidableAction(
                    backgroundColor: Colors.red.shade500,
                    icon: Icons.delete,
                    foregroundColor: Colors.white,
                    label: 'Delete',
                    onPressed: (ctx) {
                      warningDialog(context, 'Are you sure?', () {
                        context.read<TransactionBloc>().add(
                          TransactionEventDelete(id: data.id),
                        );
                      }).show();
                    },
                  );
                },
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
