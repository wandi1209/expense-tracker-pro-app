import 'package:expense_tracker_pro/common/buttons/basic_button.dart';
import 'package:expense_tracker_pro/common/inputs/basic_input.dart';
import 'package:flutter/material.dart';

class SheetAddWidget extends StatefulWidget {
  const SheetAddWidget({super.key});

  @override
  State<SheetAddWidget> createState() => _SheetAddWidgetState();
}

class _SheetAddWidgetState extends State<SheetAddWidget> {
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
                const BasicInput(title: 'Remarks', hintText: 'Type here...'),
                const SizedBox(height: 10),
                const BasicInput(title: 'Amount', hintText: '0', num: true),
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
                BasicButton(title: 'Add Transaction', onPressed: () {}),
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
