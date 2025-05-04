import 'package:expense_tracker_pro/features/transaction/presentation/widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text(
          'Transactions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 40),
            width: double.infinity,
            height: 300,
            child: LineChartWidget(),
          ),
        ],
      ),
    );
  }
}
