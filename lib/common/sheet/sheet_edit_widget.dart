import 'dart:async';

import '../buttons/basic_button.dart';
import '../dialogs/dialog_widget.dart';
import '../inputs/basic_input.dart';
import '../../features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SheetEditWidget extends StatefulWidget {
  final String id;
  const SheetEditWidget({super.key, required this.id});

  @override
  State<SheetEditWidget> createState() => _SheetEditWidgetState();
}

class _SheetEditWidgetState extends State<SheetEditWidget> {
  TextEditingController remarks = TextEditingController();
  TextEditingController amount = TextEditingController();
  var selectedType = 'Expense';
  List<String> types = ['Expense', 'Income'];

  @override
  void initState() {
    context.read<TransactionBloc>().add(
      TransactionEventGetDetail(id: widget.id),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionBloc, TransactionState>(
      listener: (context, state) {
        if (state is GetDetailTransactionSuccess) {
          final data = state.transaction;
          remarks.text = data.remarks;
          amount.text = data.amount.toString();
          selectedType =
              data.transactionType == 'expense' ? 'Expense' : 'Income';
          setState(() {});
        } else if (state is EditTransactionSucces) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final dialog = successDialog(
              context,
              'Edit Transaction Successfuly',
            );
            dialog.show();

            Timer(const Duration(seconds: 2), () {
              dialog.dismiss();
              if (mounted) {
                context.push('/transactions');
              }
            });
          });
        } else if (state is TransactionFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final dialog = errorDialog(context, state.error);
            dialog.show();

            Timer(const Duration(seconds: 2), () {
              dialog.dismiss();
              if (mounted) context.pop();
            });
          });
        }
      },
      child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (ctx, state) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
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
                            'Edit Transaction',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
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
                          BasicButton(
                            title: 'Submit',
                            onPressed: () async {
                              context.read<TransactionBloc>().add(
                                TransactionEventEdit(
                                  id: widget.id,
                                  amount: double.tryParse(amount.text) ?? 0,
                                  transactionType: selectedType.toLowerCase(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state is TransactionLoading)
                  Positioned.fill(
                    child: Container(
                      color: Colors.white.withAlpha(200),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  ),
              ],
            ),
          );
        },
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
