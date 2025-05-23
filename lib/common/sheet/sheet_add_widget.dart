import 'dart:async';

import '../buttons/basic_button.dart';
import '../dialogs/dialog_widget.dart';
import '../inputs/basic_input.dart';
import '../../features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SheetAddWidget extends StatefulWidget {
  const SheetAddWidget({super.key});

  @override
  State<SheetAddWidget> createState() => _SheetAddWidgetState();
}

class _SheetAddWidgetState extends State<SheetAddWidget> {
  TextEditingController remarks = TextEditingController();
  TextEditingController amount = TextEditingController();
  var selectedType = 'Expense';
  List<String> types = ['Expense', 'Income'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Add Transactions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 20),
                BasicInput(
                  title: 'Remarks',
                  hintText: 'Type here...',
                  controller: remarks,
                ),
                const SizedBox(height: 10),
                BasicInput(
                  title: 'Amount',
                  hintText: '0',
                  num: true,
                  controller: amount,
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Transaction Type',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    _dropdownButton(),
                  ],
                ),
                const SizedBox(height: 20),
                BlocConsumer<TransactionBloc, TransactionState>(
                  listener: (context, state) {
                    if (state is AddTransactionSuccess) {
                      final dialog = successDialog(
                        context,
                        'Add Transaction Success',
                      );
                      dialog.show();

                      Timer(const Duration(seconds: 2), () {
                        dialog.dismiss();

                        if (mounted) {
                          context.push('/dashboard');
                          context.pop();
                        }
                      });
                    } else if (state is TransactionFailure) {
                      final dialog = errorDialog(context, state.error);
                      dialog.show();

                      Timer(const Duration(seconds: 2), () {
                        dialog.dismiss();
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is TransactionLoading) {
                      return const CircularProgressIndicator();
                    }
                    return BasicButton(
                      title: 'Add Transaction',
                      onPressed: () async {
                        final double parsedAmount =
                            double.tryParse(amount.text) ?? 0;
                        final type = selectedType.toLowerCase();

                        if (type == 'expense') {
                          context.read<TransactionBloc>().add(
                            TransactionEventAddExpense(
                              amount: parsedAmount,
                              remarks: remarks.text,
                            ),
                          );
                        } else if (type == 'income') {
                          context.read<TransactionBloc>().add(
                            TransactionEventAddIncome(
                              amount: parsedAmount,
                              remarks: remarks.text,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dropdownButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          value: selectedType,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedType = value;
              });
            }
          },
          items:
              types.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      type,
                      style: TextStyle(
                        color:
                            type == 'Expense'
                                ? Colors.red
                                : Colors.green.shade600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
