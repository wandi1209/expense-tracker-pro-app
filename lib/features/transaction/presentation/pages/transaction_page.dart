import 'package:expense_tracker_pro/common/appbars/basic_app_bar.dart';
import 'package:expense_tracker_pro/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:expense_tracker_pro/features/transaction/presentation/widgets/slidable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocListener<TransactionBloc, TransactionState>(
        listener: (context, state) {},

        child: BlocBuilder<TransactionBloc, TransactionState>(
          bloc: BlocProvider.of<TransactionBloc>(context)
            ..add(TransactionEventGetTransactions()),
          builder: (context, state) {
            if (state is TransactionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetTransactionSuccess) {
              return SlidableWidget(listData: state.transactions);
            }
            return Center(
              child: Text(
                'No Transactions available.',
                style: TextStyle(color: Colors.grey.shade700),
              ),
            );
          },
        ),
      ),
    );
  }
}
