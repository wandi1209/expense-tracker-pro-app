import '../../../../common/appbars/basic_app_bar.dart';
import '../bloc/transaction_bloc.dart';
import '../widgets/slidable_widget.dart';
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
              if (state.transactions.isNotEmpty) {
                return SingleChildScrollView(
                  child: SlidableWidget(listData: state.transactions),
                );
              }
            }
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Icon(Icons.inbox, size: 30, color: Colors.grey),
                  SizedBox(height: 12),
                  Text(
                    'No Transactions Available.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
