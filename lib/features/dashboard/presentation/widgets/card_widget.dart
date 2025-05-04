import 'package:expense_tracker_pro/core/configs/assets/app_vectors.dart';
import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:expense_tracker_pro/core/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardWidget extends StatelessWidget {
  final double income;
  final double expense;
  final double balance = 200000;
  const CardWidget({super.key, required this.income, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Balance',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            rupiahFormatter.format(balance),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppVectors.arrowDown),
                      const SizedBox(width: 10),
                      const Text(
                        'Income',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  _text(rupiahFormatter.format(expense)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppVectors.arrowUp),
                      const SizedBox(width: 10),
                      const Text(
                        'Expense',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  _text(rupiahFormatter.format(expense)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Text _text(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
